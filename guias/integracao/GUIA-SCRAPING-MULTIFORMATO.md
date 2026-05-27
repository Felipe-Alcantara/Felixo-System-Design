# GUIA DE SCRAPING MULTIFORMATO COM PLAYWRIGHT, PARSERS OFFLINE E CAPTURA MANUAL

> **O que e**: Um padrao reutilizavel para construir pipelines de coleta capazes de lidar com paginas estaticas, paginas renderizadas por JavaScript, JSON embutido, paginacao, fallback manual autorizado e persistencia auditavel.
>
> **De onde vem**: Este guia consolida um padrao tecnico recorrente em pipelines reais de coleta, mas foi escrito de forma generica para nao carregar regras comerciais, URLs, credenciais, HTML bruto ou detalhes privados de nenhum produto original.
>
> **Quando usar**: Catalogos, comparadores, ETLs, importadores, inventarios tecnicos, monitoramento de precos, captura de dados publicos autorizados e sistemas que precisam transformar paginas heterogeneas em dados estruturados.
>
> **Regra central**: Scraping de qualidade nao e "pegar HTML de qualquer jeito". E uma arquitetura auditavel, testavel, limitada por guardrails, respeitosa com autorizacoes e preparada para falhar de forma segura.

---

## 1. Escopo do padrao

Este guia cobre:

- coleta via HTTP simples;
- navegacao com Playwright;
- parsers offline com BeautifulSoup ou equivalente;
- leitura de JSON embutido em paginas modernas;
- adapter strategy por fonte/layout;
- importacao de HTML salvo;
- captura manual assistida por navegador real;
- normalizacao de URLs publicas;
- persistencia idempotente;
- historico de mudancas;
- testes com fixtures sanitizadas;
- limites operacionais, seguranca e auditoria.

Este guia nao cobre:

- contorno agressivo de bloqueios;
- bypass de autenticacao;
- uso de cookies, sessoes ou tokens sem autorizacao;
- coleta de dados pessoais sem base legitima;
- armazenamento de HTML sensivel em repositorio;
- dependencia de seletores fragilizados sem teste.

---

## 2. Stack recomendada

```text
Python 3.11+
Playwright
BeautifulSoup4
Requests/httpx
Django ORM ou camada de persistencia equivalente
PostgreSQL em producao
SQLite como fallback local
pytest/unittest
fixtures HTML reais sanitizadas
Tampermonkey/userscript opcional
Servidor HTTP local para captura assistida
```

Regra pratica:

- Use **requests/httpx + parser offline** quando o HTML ja trouxer os dados.
- Use **Playwright** quando a pagina depender de JavaScript, lazy loading, popup, paginacao dinamica ou interacao humana.
- Use **captura manual assistida** quando a coleta automatica for instavel, proibida pelo contexto operacional ou depender de acao humana autorizada.
- Use **persistencia idempotente** sempre que o resultado puder ser reprocessado.

---

## 3. Arquitetura de pastas

```text
scraper_module/
  main.py
  requirements.txt
  README.md
  src/
    config.py
    models.py
    browser.py
    registry.py
    flows/
      listing.py
      pagination.py
      product_page.py
    adapters/
      base.py
      example_source.py
    manual_html/
      importer.py
    html_capture/
      capture_server.py
      userscript.js
    persistence.py
    public_url_resolver.py
    parsing/
      prices.py
      json_payloads.py
      text.py
    reports/
      summary.py
  tests/
    fixtures/
      example_source/
        listing.html
        listing.meta.json
    test_adapters_example_source.py
    test_manual_importer.py
    test_capture_server.py
    test_public_url_resolver.py
    test_persistence.py
```

Responsabilidades:

| Camada | Responsabilidade |
|---|---|
| `config` | Env vars, limites, modo headless/headed, fontes ativas, dry-run e paths |
| `models` | DTOs puros, sem ORM e sem dependencia de framework |
| `browser` | Context manager Playwright, timeouts, user agent, lifecycle e screenshots de debug |
| `flows` | Fluxos comuns de navegacao, descoberta, popup, paginacao e fallback |
| `adapters` | Um parser por fonte/layout, todos obedecendo uma interface comum |
| `manual_html` | Importacao offline de HTML salvo em disco |
| `html_capture` | Servidor local e userscript para captura manual autorizada |
| `persistence` | Unica ponte com ORM/banco, upsert, dedupe e historico |
| `public_url_resolver` | URL canonica segura para exibicao externa |
| `tests` | Fixtures sanitizadas e validacao offline dos contratos |

---

## 4. Contrato de DTO

DTO e o contrato entre coleta, parser, persistencia e consumidor. Ele deve ser puro.

```python
from dataclasses import dataclass, field
from decimal import Decimal


@dataclass
class ProductDTO:
    external_id: str
    title: str
    product_url: str
    price: Decimal
    public_url: str = ""
    image_url: str = ""
    original_price: Decimal | None = None
    discount_percent: Decimal | None = None
    rating: Decimal | None = None
    review_count: int | None = None
    coupon_code: str = ""
    coupon_discount: Decimal | None = None
    category_hint: str = ""
    source_slug: str = ""
    capture_source: str = ""
    extras: dict = field(default_factory=dict)
```

Regras obrigatorias:

1. DTO nao importa Django, SQLAlchemy, Playwright, BeautifulSoup, API externa nem camada de UI.
2. `external_id` precisa ser estavel por produto dentro da fonte.
3. `product_url` guarda a URL usada/coletada e pode conter tracking ou contexto sensivel.
4. `public_url` guarda a URL segura para exibicao externa.
5. Se nao houver URL publica segura, `public_url` deve ficar vazia e o produto deve ser bloqueado para publicacao.
6. Campos opcionais devem continuar opcionais para permitir fontes heterogeneas.
7. `extras` so deve guardar dados nao essenciais; nao use como lixeira para contrato mal definido.

---

## 5. Interface Strategy para adapters

Cada fonte/layout deve implementar uma interface unica. O nucleo nao deve saber detalhes de seletores, JSON interno ou regras de URL de cada site.

```python
from abc import ABC, abstractmethod


class SourceAdapter(ABC):
    slug: str = ""
    display_name: str = ""

    @abstractmethod
    def extract_products(self, page, listing_url: str, limit: int) -> list[ProductDTO]:
        """Extrai produtos usando navegador real quando necessario."""

    def extract_products_from_html(
        self,
        html: str,
        base_url: str,
        limit: int,
    ) -> list[ProductDTO]:
        """Parser offline para fixtures, HTML salvo e fallback manual."""
        raise NotImplementedError

    def extract_single_product(self, page, product_url: str) -> list[ProductDTO]:
        """Opcional: paginas que apontam direto para um produto."""
        page.goto(product_url, wait_until="domcontentloaded", timeout=30000)
        return self.extract_products_from_html(page.content(), product_url, 1)

    def derive_public_url(self, source_url: str) -> str:
        """Retorna URL canonica segura para publicacao externa. Vazio = bloqueado."""
        return ""
```

Beneficio:

- adicionar fonte nova exige criar adapter novo e registrar no registry;
- o nucleo permanece fechado para modificacao frequente;
- os testes podem validar cada parser offline sem browser;
- seletores quebrados ficam isolados na fonte afetada.

---

## 6. Registry de fontes

Use um registry explicito para evitar `if/else` espalhado.

```python
from src.adapters.example_source import ExampleSourceAdapter


ADAPTERS = {
    ExampleSourceAdapter.slug: ExampleSourceAdapter(),
}


def get_adapter(slug: str):
    try:
        return ADAPTERS[slug]
    except KeyError as exc:
        known = ", ".join(sorted(ADAPTERS))
        raise ValueError(f"Fonte desconhecida: {slug}. Fontes: {known}") from exc
```

Regras:

1. `slug` e identificador tecnico estavel.
2. `display_name` e nome humano.
3. Adapter novo precisa de fixture e teste offline.
4. O registry deve ser o unico ponto de descoberta das fontes suportadas.

---

## 7. Configuracao e limites

Centralize configuracao em `config.py`.

```python
from dataclasses import dataclass
import os
from pathlib import Path


@dataclass(frozen=True)
class ScraperConfig:
    headless: bool = os.getenv("SCRAPER_HEADLESS", "1") != "0"
    max_products: int = int(os.getenv("SCRAPER_MAX_PRODUCTS", "100"))
    max_pages: int = int(os.getenv("SCRAPER_MAX_PAGES", "5"))
    timeout_ms: int = int(os.getenv("SCRAPER_TIMEOUT_MS", "30000"))
    dry_run: bool = os.getenv("SCRAPER_DRY_RUN", "1") != "0"
    debug_dir: Path = Path(os.getenv("SCRAPER_DEBUG_DIR", "debug_html"))
    manual_html_dir: Path = Path(os.getenv("SCRAPER_MANUAL_HTML_DIR", "manual_html"))
```

Todo pipeline deve ter:

- limite de paginas;
- limite de produtos;
- limite de tempo;
- limite de bytes para captura manual;
- modo dry-run por padrao em importadores;
- logs objetivos com contadores;
- saida em JSON para auditoria quando fizer sentido.

---

## 8. HTML estatico com parser offline

Use parser offline quando o HTML ja trouxer cards completos.

Boas praticas:

1. Use seletor primario especifico.
2. Tenha fallback por links, atributos semanticos ou JSON-LD.
3. Normalize preco em funcao separada.
4. Descarte item sem titulo, URL ou preco.
5. Deduplicate por `external_id`.
6. Resolva URLs relativas com `urljoin`.
7. Guarde fixture HTML sanitizada para teste.

Exemplo:

```python
from bs4 import BeautifulSoup
from urllib.parse import urljoin


class ExampleSourceAdapter(SourceAdapter):
    slug = "example"
    display_name = "Example Source"

    def extract_products(self, page, listing_url: str, limit: int) -> list[ProductDTO]:
        page.goto(listing_url, wait_until="domcontentloaded", timeout=30000)
        return self.extract_products_from_html(page.content(), listing_url, limit)

    def extract_products_from_html(
        self,
        html: str,
        base_url: str,
        limit: int,
    ) -> list[ProductDTO]:
        soup = BeautifulSoup(html, "html.parser")
        products: list[ProductDTO] = []

        for card in soup.select("[data-product-card]"):
            title_el = card.select_one("[data-product-title]")
            link_el = card.select_one("a[href]")
            price_el = card.select_one("[data-price]")

            if not title_el or not link_el or not price_el:
                continue

            product_url = urljoin(base_url, link_el["href"])
            external_id = self._derive_external_id(product_url)
            public_url = self.derive_public_url(product_url)

            products.append(
                ProductDTO(
                    external_id=external_id,
                    title=title_el.get_text(" ", strip=True),
                    product_url=product_url,
                    public_url=public_url,
                    price=parse_price(price_el.get_text(" ", strip=True)),
                    source_slug=self.slug,
                    capture_source="html",
                )
            )

            if len(products) >= limit:
                break

        return dedupe_products(products)
```

---

## 9. Paginas client-rendered com Playwright

Use Playwright quando conteudo depender de JavaScript, lazy loading, popup, scroll ou paginacao dinamica.

Boas praticas:

1. Navegue com `domcontentloaded`.
2. Espere seletor relevante quando existir.
3. Use `networkidle` apenas como best-effort.
4. Execute scroll incremental quando houver lazy loading.
5. Capture `page.content()` e reaproveite o parser offline.
6. Salve HTML de debug local quando nenhum item for extraido.
7. Exponha modo `--headed` para diagnostico humano.
8. Nao use Playwright para parsing quando BeautifulSoup resolve.

Exemplo de browser isolado:

```python
from contextlib import contextmanager
from playwright.sync_api import sync_playwright


@contextmanager
def open_browser(config):
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=config.headless)
        context = browser.new_context(
            viewport={"width": 1366, "height": 768},
            ignore_https_errors=False,
        )
        try:
            yield context
        finally:
            context.close()
            browser.close()
```

Fluxo recomendado:

```python
def collect_listing(adapter, listing_url: str, config):
    with open_browser(config) as context:
        page = context.new_page()
        page.goto(listing_url, wait_until="domcontentloaded", timeout=config.timeout_ms)

        try:
            page.wait_for_selector("[data-product-card]", timeout=5000)
        except Exception:
            pass

        scroll_page(page, max_rounds=3)
        html = page.content()
        products = adapter.extract_products_from_html(html, listing_url, config.max_products)

        if not products:
            save_debug_html(config.debug_dir, adapter.slug, listing_url, html)

        return products
```

---

## 10. JSON embutido em paginas modernas

Muitas paginas renderizam DOM vazio, mas embutem dados em scripts.

Fontes comuns:

- `script#__NEXT_DATA__` em Next.js;
- JSON-LD `application/ld+json`;
- payloads de streaming/RSC;
- objetos globais serializados;
- atributos `data-*` com blobs JSON.

Padrao recomendado:

1. Ler HTML bruto.
2. Procurar payloads estruturados antes de depender de classe CSS volatil.
3. Coletar recursivamente objetos com campos caracteristicos.
4. Normalizar para DTO.
5. Usar DOM apenas como complemento quando JSON nao tiver preco, desconto ou imagem.

Exemplo de busca recursiva:

```python
def walk_json(value):
    if isinstance(value, dict):
        yield value
        for child in value.values():
            yield from walk_json(child)
    elif isinstance(value, list):
        for item in value:
            yield from walk_json(item)


def looks_like_product(obj: dict) -> bool:
    keys = {key.lower() for key in obj.keys()}
    return bool({"name", "title"} & keys) and bool({"price", "offers"} & keys)
```

Cuidados:

- JSON embutido pode conter dados demais; extraia apenas o necessario.
- Nao salve payload bruto se houver risco de dados pessoais ou tokens.
- Teste parser de JSON com fixture reduzida e sanitizada.

---

## 11. Captura manual assistida

Use captura manual quando a coleta automatica nao for confiavel ou quando a pagina exigir interacao humana autorizada.

Fluxo:

1. Subir servidor local em `127.0.0.1`.
2. Instalar userscript em navegador real.
3. Abrir a pagina manualmente.
4. Aguardar lazy loading e fechar popups nao essenciais.
5. Converter `href`, `src` e `srcset` para URLs absolutas.
6. Enviar `outerHTML` para o servidor local.
7. Salvar HTML por fonte/categoria/pagina.
8. Gravar `.meta.json` com URL, data, bytes, contagem de imagens/cards e user agent.
9. Rodar importador offline sobre os HTMLs capturados.

O servidor local deve:

- aceitar apenas `127.0.0.1`;
- limitar tamanho do payload;
- sanitizar nomes de arquivo;
- rejeitar path traversal;
- nunca gravar cookies, tokens ou headers sensiveis;
- responder com JSON simples;
- registrar contadores.

Contrato de payload:

```json
{
  "source": "example",
  "category": "categoria-publica",
  "pageUrl": "https://example.com/listing",
  "html": "<html>...</html>",
  "capturedAt": "2026-05-27T12:00:00Z",
  "stats": {
    "cards": 24,
    "images": 24,
    "bytes": 180000
  }
}
```

Metadados salvos:

```json
{
  "source": "example",
  "category": "categoria-publica",
  "pageUrl": "https://example.com/listing",
  "capturedAt": "2026-05-27T12:00:00Z",
  "htmlFile": "listing-001.html",
  "bytes": 180000,
  "cards": 24,
  "images": 24
}
```

---

## 12. Importador offline de HTML salvo

O importador precisa funcionar sem browser e sem rede.

Regras:

1. Varrer subpastas recursivamente.
2. Reconhecer fonte pelo caminho, nome do arquivo ou `.meta.json`.
3. Derivar categoria pela arvore visual quando fizer sentido.
4. Usar o adapter correto.
5. Rodar em preview por padrao.
6. Exigir `--commit` para gravar.
7. Gerar resumo JSON da execucao.
8. Contar criados, atualizados, inalterados, duplicados, ignorados e erros.

CLI esperada:

```bash
python import_saved_html.py --root manual_html
python import_saved_html.py --root manual_html --commit --yes --no-interactive
```

Resumo esperado:

```json
{
  "mode": "preview",
  "files_seen": 12,
  "files_imported": 10,
  "products_seen": 240,
  "created": 0,
  "updated": 0,
  "unchanged": 0,
  "duplicates": 4,
  "ignored": 6,
  "errors": 0
}
```

---

## 13. Persistencia recomendada

Modelo generico:

```text
Source
  slug
  display_name
  source_url
  is_active
  last_scraped_at

Category
  source_id
  name
  listing_url
  last_scraped_at

Product
  source_id
  category_id
  external_id
  title
  product_url
  public_url
  image_url
  original_price
  current_price
  discount_percent
  rating
  review_count
  is_available
  capture_source
  first_seen_at
  last_seen_at

PriceHistory
  product_id
  captured_at
  current_price
  original_price
```

Regras de banco:

1. Upsert idempotente por `(source, external_id)` ou `(category, external_id)`, conforme a granularidade real.
2. Registrar historico somente quando preco mudar ou produto for novo.
3. Marcar como indisponivel produtos nao vistos em uma categoria, sem deletar fisicamente.
4. Separar DTO do ORM.
5. Manter `persistence.py` como unico ponto que importa ORM.
6. Suportar PostgreSQL em producao e SQLite local para desenvolvimento.
7. Gravar `capture_source` para saber se veio de browser, HTTP, JSON ou HTML manual.
8. Salvar timestamps de primeira e ultima visualizacao.

Exemplo de fronteira de persistencia:

```python
def persist_products(source_slug: str, category_name: str, products: list[ProductDTO], commit: bool):
    summary = ImportSummary()

    for dto in products:
        if not dto.public_url:
            summary.blocked += 1
            continue

        if not commit:
            summary.preview += 1
            continue

        upsert_product(source_slug, category_name, dto, summary)

    return summary
```

---

## 14. URL publica, tracking e seguranca

Separe URL de coleta da URL de exibicao.

| Campo | Uso |
|---|---|
| `product_url` | URL original de coleta; pode conter tracking, afiliacao, sessao, cupom, token ou contexto privado |
| `public_url` | URL canonica segura para exibicao externa |

Regras:

1. Nunca publicar `product_url` diretamente.
2. Cada adapter deve saber gerar `public_url`.
3. Se o adapter nao souber, retornar string vazia.
4. O consumidor deve bloquear publicacao quando `public_url` estiver vazia.
5. Remover query string apenas quando isso nao quebrar variante, SKU ou contexto publico necessario.
6. Preservar parametros que identificam variante legitima.
7. Remover parametros de tracking, afiliacao privada, sessao, token e origem interna.

Exemplo:

```python
TRACKING_PARAMS = {
    "utm_source",
    "utm_medium",
    "utm_campaign",
    "utm_term",
    "utm_content",
    "fbclid",
    "gclid",
}
```

Importante: limpeza de URL nao deve ser global e cega. Alguns sites usam query string para SKU, cor, tamanho ou vendedor. A regra segura pertence ao adapter da fonte.

---

## 15. CLI recomendada

Comandos esperados:

```bash
python main.py --help
python main.py --source exemplo --limit 20
python main.py --source exemplo --category "Categoria" --limit 20
python main.py --all-sources --no-interactive
python import_saved_html.py --root manual_html
python import_saved_html.py --root manual_html --commit --yes --no-interactive
python capture_server.py --host 127.0.0.1 --port 8765
```

Regras:

- modo interativo para operacao humana;
- modo nao interativo para cron/CI;
- preview seguro por padrao em importacao;
- `--commit` explicito para gravar;
- `--limit`, `--max-pages` e `--timeout` sempre disponiveis;
- logs objetivos com contadores;
- snapshots de saida para auditoria.

---

## 16. Testes obrigatorios

| Teste | O que valida |
|---|---|
| Parser por adapter | Extrai DTOs corretos de fixture HTML sanitizada |
| Parser de JSON embutido | Coleta produtos de `__NEXT_DATA__`, JSON-LD ou payload textual |
| Parser de preco | Normaliza moeda, separadores, descontos e valores ausentes |
| URL resolver | Gera URL publica correta e bloqueia quando nao sabe resolver |
| Importador manual | Detecta fonte, categoria, caminho, preview e resumo |
| Servidor de captura | Salva HTML/meta, sanitiza paths e limita payload |
| Persistencia | Upsert, dedupe, historico de preco e indisponibilidade |
| CLI | `--help`, args principais e dry-run sem crash |

Checklist minimo:

1. Fixture HTML nao deve conter dado sensivel.
2. Teste offline nao deve depender de rede.
3. Parser deve falhar com lista vazia ou erro controlado, nunca dado parcial enganoso.
4. Todo adapter novo precisa de pelo menos um teste offline.
5. Toda regra de URL publica precisa de teste dedicado.
6. Captura manual precisa validar paths, limite de payload e metadados.
7. Upsert precisa ser idempotente: rodar duas vezes nao duplica produto.

---

## 17. Logs e auditoria

Registre:

- fonte;
- categoria;
- URL de listagem;
- modo de captura;
- quantidade de paginas;
- quantidade de produtos extraidos;
- quantidade de produtos persistidos;
- duplicados;
- bloqueados por falta de `public_url`;
- erros por adapter;
- caminho de HTML de debug local, quando existir.

Nao registre:

- cookies;
- tokens;
- headers sensiveis;
- HTML bruto com dados pessoais;
- URLs privilegiadas em logs publicos;
- respostas inteiras de APIs privadas.

Formato recomendado:

```json
{
  "source": "example",
  "category": "categoria",
  "mode": "browser",
  "products_seen": 40,
  "products_valid": 38,
  "blocked_without_public_url": 2,
  "created": 10,
  "updated": 5,
  "unchanged": 23,
  "errors": 0
}
```

---

## 18. Guardrails operacionais

- Respeitar termos de uso, autorizacoes, limites e robots quando aplicavel.
- Preferir APIs oficiais quando elas existirem e cobrirem o caso.
- Nao registrar secrets, cookies, tokens ou HTML com dados pessoais em repositorio publico.
- Nao implementar bypass agressivo de bloqueios.
- Se houver desafio humano ou bloqueio, usar fluxo manual autorizado ou fonte oficial.
- Colocar limites de paginas, bytes, produtos e tempo de execucao.
- Salvar HTML de debug localmente e revisar antes de transformar em fixture.
- Sanitizar fixtures antes de commit.
- Separar ambiente de teste, staging e producao.
- Usar dry-run/preview para qualquer importacao manual.
- Registrar fonte, data e arquivo de origem para auditoria.

---

## 19. Receita rapida de reaproveitamento

1. Definir DTO puro.
2. Criar `SourceAdapter` abstrato.
3. Implementar um adapter por fonte/layout.
4. Priorizar payload estruturado quando existir.
5. Usar BeautifulSoup/DOM como parser offline testavel.
6. Usar Playwright apenas para navegacao, interacao e captura de HTML.
7. Criar fallback de captura manual com userscript + servidor local.
8. Persistir com upsert idempotente e historico.
9. Separar URL de coleta da URL publica.
10. Cobrir cada adapter com fixtures e testes offline.

---

## 20. Criterio de pronto

Um scraper so esta pronto quando:

- tem adapter isolado;
- tem DTO puro;
- tem parser offline;
- tem fixture sanitizada;
- tem teste do adapter;
- tem limites operacionais;
- tem dry-run;
- tem persistencia idempotente;
- tem regra de URL publica;
- bloqueia publicacao quando URL segura nao existe;
- registra resumo auditavel;
- nao vaza dado sensivel.

Se uma dessas garantias nao existir, o scraper pode ate funcionar, mas ainda nao e um padrao confiavel para reutilizacao.
