# Felixo System Design

<div align="center">

![React](https://img.shields.io/badge/React-18-61DAFB?style=for-the-badge&logo=react&logoColor=white)
![Tailwind](https://img.shields.io/badge/Tailwind_CSS-3-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![C#](https://img.shields.io/badge/C%23-512BD4?style=for-the-badge&logo=csharp&logoColor=white)
![Django](https://img.shields.io/badge/Django-0C4B33?style=for-the-badge&logo=django&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Docs](https://img.shields.io/badge/Docs-Guide-2084FF?style=for-the-badge&logo=read-the-docs&logoColor=white)

**Repositorio central de padroes de design, qualidade de sistema, prompts estruturados, documentacao operacional e guias reutilizaveis para IA.**

[Core (Obrigatorio)](#-core--padroes-obrigatorios) | [Guias (Opcional)](#-guias--padroes-especificos) | [Stack](#%EF%B8%8F-minha-stack) | [Como Usar](#-como-usar-em-outros-projetos)

</div>

---

## Indice

- [Sobre o Repositorio](#-sobre-o-repositorio)
- [Como Usar em Outros Projetos](#-como-usar-em-outros-projetos)
- [Minha Stack](#%EF%B8%8F-minha-stack)
- [Estrutura do Repositorio](#-estrutura-do-repositorio)
- [Core — Padroes Obrigatorios](#-core--padroes-obrigatorios)
- [Guias — Padroes Especificos](#-guias--padroes-especificos)
- [Licenca](#-licenca)
- [Autor](#-autor)

---

## Sobre o Repositorio

Este repositorio serve como **base centralizada** para registrar e padronizar tudo que envolve meus projetos de desenvolvimento. Ele e organizado em duas camadas:

### `core/` — Obrigatorio

Padroes de qualidade que devem acompanhar **todo projeto**:

- **Design Systems** — Contratos de qualidade para frontend, backend e documentacao
- **Prompt Bases** — Guias para montar prompts de IA completos na primeira interacao
- **Guia Minimo de Qualidade** — Regras curtas e obrigatorias para preservar qualidade de software
- **Start App Script** — Script Python obrigatorio que instala, inicia/reinicia e abre cada app web
- **Template de Contexto IA** — Memoria operacional padronizada para continuidade entre sessoes

### `guias/` — Opcional

Guias reutilizaveis extraidos de **projetos reais**, organizados por dominio. Use apenas quando o projeto precisar daquela funcionalidade especifica.

---

## Como Usar em Outros Projetos

Use os metodos abaixo do mais usual para o mais especifico.

> **Sobre o submodulo `componets-database/`**
> Este repositorio inclui o submodulo `componets-database/` (banco de componentes UI). Ele **so e necessario** se voce quiser o banco de componentes — para os padroes `core/` e `guias/` ele e dispensavel. Por isso cada metodo abaixo traz duas variantes: **sem o submodulo** (mais leve) e **com o submodulo** (completo). ZIP e `npx degit` nunca trazem submodulos — para o banco de componentes, use uma das variantes `git`.

### 1. Sincronizar `Padrão de qualidade - Felixo System Design` com a versao mais recente (Recomendado)

Melhor opcao quando voce quer manter uma pasta local sem vinculo com o git original e poder rodar o comando quantas vezes quiser para atualizar.

**Linux / macOS / Git Bash (sem submodulo):**
```bash
tmp_dir="$(mktemp -d)" && git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git "$tmp_dir/repo" && rm -rf "$tmp_dir/repo/.git" && mkdir -p "./Padrão de qualidade - Felixo System Design" && rsync -a --delete "$tmp_dir/repo/" "./Padrão de qualidade - Felixo System Design/" && rm -rf "$tmp_dir"
```

**Linux / macOS / Git Bash (com submodulo):**
```bash
tmp_dir="$(mktemp -d)" && git clone --depth 1 --recurse-submodules https://github.com/Felipe-Alcantara/Felixo-System-Design.git "$tmp_dir/repo" && find "$tmp_dir/repo" -name .git -prune -exec rm -rf {} + && mkdir -p "./Padrão de qualidade - Felixo System Design" && rsync -a --delete "$tmp_dir/repo/" "./Padrão de qualidade - Felixo System Design/" && rm -rf "$tmp_dir"
```

**PowerShell (Windows) — sem submodulo:**
```powershell
$tmpDir = Join-Path $env:TEMP ("felixo-standards-" + [guid]::NewGuid())
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git $tmpDir
Remove-Item -Recurse -Force (Join-Path $tmpDir ".git")
New-Item -ItemType Directory -Force -Path "./Padrão de qualidade - Felixo System Design" | Out-Null
robocopy $tmpDir "./Padrão de qualidade - Felixo System Design" /MIR | Out-Null
Remove-Item -Recurse -Force $tmpDir
```

**PowerShell (Windows) — com submodulo:**
```powershell
$tmpDir = Join-Path $env:TEMP ("felixo-standards-" + [guid]::NewGuid())
git clone --depth 1 --recurse-submodules https://github.com/Felipe-Alcantara/Felixo-System-Design.git $tmpDir
Get-ChildItem $tmpDir -Recurse -Force -Filter ".git" | Remove-Item -Recurse -Force
New-Item -ItemType Directory -Force -Path "./Padrão de qualidade - Felixo System Design" | Out-Null
robocopy $tmpDir "./Padrão de qualidade - Felixo System Design" /MIR | Out-Null
Remove-Item -Recurse -Force $tmpDir
```

**CMD (Windows) — sem submodulo:**
```cmd
set TMP_DIR=%TEMP%\felixo-standards-%RANDOM% && git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git %TMP_DIR% && rmdir /s /q %TMP_DIR%\.git && if not exist "Padrão de qualidade - Felixo System Design" mkdir "Padrão de qualidade - Felixo System Design" && robocopy %TMP_DIR% "Padrão de qualidade - Felixo System Design" /MIR >nul && rmdir /s /q %TMP_DIR%
```

**CMD (Windows) — com submodulo:**
```cmd
set TMP_DIR=%TEMP%\felixo-standards-%RANDOM% && git clone --depth 1 --recurse-submodules https://github.com/Felipe-Alcantara/Felixo-System-Design.git %TMP_DIR% && for /d /r %TMP_DIR% %G in (.git) do @if exist "%G" rmdir /s /q "%G" && if not exist "Padrão de qualidade - Felixo System Design" mkdir "Padrão de qualidade - Felixo System Design" && robocopy %TMP_DIR% "Padrão de qualidade - Felixo System Design" /MIR >nul && rmdir /s /q %TMP_DIR%
```

- **Use quando**: quer todos os arquivos como base independente, com atualizacao simples depois
- **Requisito**: Git
- **Vinculo com o git original?** Nao

#### Comando global `felixo` (instalador multiplataforma)

Em vez de copiar a funcao na mao, use os instaladores em [`scripts/`](scripts/). Eles registram o comando `felixo` no seu terminal com **logs coloridos, barra de loading e avisos de erro**. Depois de instalado, rode `felixo` em qualquer pasta para baixar a versao mais recente — **tudo, menos o submodulo** `componets-database`. Use `felixo --with-submodules` (ou `-s`) para incluir tambem o banco de componentes.

**Bash / Zsh** (Linux, macOS, Git Bash, WSL):
```bash
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git /tmp/felixo-setup
bash /tmp/felixo-setup/scripts/install-felixo.sh
# desinstalar: bash /tmp/felixo-setup/scripts/install-felixo.sh --uninstall
```

**PowerShell** (Windows / Linux / macOS):
```powershell
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git $env:TEMP\felixo-setup
& "$env:TEMP\felixo-setup\scripts\install-felixo.ps1"
# desinstalar: & "$env:TEMP\felixo-setup\scripts\install-felixo.ps1" -Uninstall
```

**CMD** (Windows classico):
```cmd
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git "%TEMP%\felixo-setup"
"%TEMP%\felixo-setup\scripts\install-felixo.cmd"
:: desinstalar: "%TEMP%\felixo-setup\scripts\install-felixo.cmd" --uninstall
```

Depois de instalar, **abra um novo terminal** e use:

```bash
felixo                   # baixa tudo, menos o submodulo componets-database
felixo --with-submodules # inclui o banco de componentes
```

Os instaladores sao **idempotentes**: rodar de novo apenas atualiza a definicao do comando, sem duplicar.

---

### 2. Baixar o repositorio inteiro como ZIP

> **Submodulo:** o ZIP do GitHub **nunca** inclui o submodulo `componets-database/` (limitacao da plataforma). Se precisar do banco de componentes, use o metodo 1 (com submodulo) ou o metodo 4.

**PowerShell (Windows):**
```powershell
Invoke-WebRequest -Uri "https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip" -OutFile "felixo.zip"
Expand-Archive "felixo.zip" -DestinationPath .
Rename-Item "Felixo-System-Design-main" "Padrão de qualidade - Felixo System Design"
Remove-Item "felixo.zip"
```

**CMD (Windows):**
```cmd
curl -L https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip -o felixo.zip
tar -xf felixo.zip
ren Felixo-System-Design-main "Padrão de qualidade - Felixo System Design"
del felixo.zip
```

**Linux / macOS:**
```bash
curl -L https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip -o felixo.zip
unzip felixo.zip && mv Felixo-System-Design-main "Padrão de qualidade - Felixo System Design" && rm felixo.zip
```

---

### 3. Baixar com `npx degit`

> **Submodulo:** `degit` **nao** baixa submodulos. O comando abaixo traz `core/` e `guias/`, mas `componets-database/` vem vazia. Para o banco de componentes, use o metodo 1 (com submodulo) ou o metodo 4.

```bash
npx degit Felipe-Alcantara/Felixo-System-Design "./Padrão de qualidade - Felixo System Design"
```

---

### 4. Clonar com `git`

**Sem submodulo** (apenas `core/` e `guias/`):
```bash
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git "./Padrão de qualidade - Felixo System Design"
```

**Com submodulo** (inclui `componets-database/`):
```bash
git clone --depth 1 --recurse-submodules https://github.com/Felipe-Alcantara/Felixo-System-Design.git "./Padrão de qualidade - Felixo System Design"
```

> Se ja clonou sem `--recurse-submodules` e quiser o submodulo depois, rode dentro do repositorio:
> ```bash
> git submodule update --init --recursive
> ```

---

### 5. Baixar apenas `guias/` com `npx degit`

> **Submodulo:** nao se aplica — `componets-database/` fica fora de `guias/`.

```bash
npx degit Felipe-Alcantara/Felixo-System-Design/guias ./felixo-guias
```

---

### 6. Baixar apenas `core/` com `git sparse-checkout`

> **Submodulo:** nao se aplica — `componets-database/` fica fora de `core/`.


```bash
mkdir felixo-core
cd felixo-core
git init
git remote add -f origin https://github.com/Felipe-Alcantara/Felixo-System-Design.git
git sparse-checkout init --no-cone
git sparse-checkout set core
git pull origin main
```

---

### 7. Baixar apenas `guias/` com `git sparse-checkout`

> **Submodulo:** nao se aplica — `componets-database/` fica fora de `guias/`.

```bash
mkdir felixo-guias
cd felixo-guias
git init
git remote add -f origin https://github.com/Felipe-Alcantara/Felixo-System-Design.git
git sparse-checkout init --no-cone
git sparse-checkout set guias
git pull origin main
```

---

### 8. Clonar tudo e copiar so a pasta desejada

**Sem submodulo:**
```bash
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git "./Padrão de qualidade - Felixo System Design"
```

**Com submodulo** (inclui `componets-database/`):
```bash
git clone --depth 1 --recurse-submodules https://github.com/Felipe-Alcantara/Felixo-System-Design.git "./Padrão de qualidade - Felixo System Design"
```

Depois, copie manualmente a pasta desejada:

- `./Padrão de qualidade - Felixo System Design/core`
- `./Padrão de qualidade - Felixo System Design/guias`
- `./Padrão de qualidade - Felixo System Design/componets-database` (se clonou com submodulo)

---

### Escolha Rapida por Cenario

| Cenario | Melhor opcao | Traz o submodulo? |
|---------|--------------|-------------------|
| Quero `core/` + `guias/` com atualizacao simples | sincronizacao sem `.git`, variante **sem submodulo** (metodo 1 / `felixo`) | Nao |
| Quero tudo, incluindo o banco de componentes | sincronizacao **com submodulo** (metodo 1 / `felixo -s`) | Sim |
| Quero tudo da forma mais simples | ZIP | Nao (ZIP nao suporta) |
| Quero tudo sem `.git` via terminal | `npx degit` | Nao (degit nao suporta) |
| Quero tudo e depois atualizar via git | `git clone` (com ou sem `--recurse-submodules`) | Depende da flag |
| Quero so `guias/` sem `git` | `npx degit` em `guias` | N/A |
| Quero so `guias/` com atualizacao futura | `git sparse-checkout` | N/A |
| Quero so `core/` com atualizacao futura | `git sparse-checkout` | N/A |
| Quero uma opcao universal | clone completo (`--recurse-submodules`) + copiar a pasta | Sim |

---

## Minha Stack

### Linguagens

| Tecnologia | Uso |
|------------|-----|
| **HTML5** | Estrutura e marcacao web |
| **CSS3** | Estilizacao e layout |
| **JavaScript** | Logica client-side e scripts |
| **TypeScript** | Tipagem forte, projetos escalaveis |
| **C#** | Back-end robusto, APIs .NET |
| **Python** | Back-end, automacoes, scripts |

### Frameworks & Bibliotecas

| Tecnologia | Uso |
|------------|-----|
| **React** | Interfaces de usuario reativas |
| **Tailwind CSS** | Estilizacao utilitaria |
| **Bootstrap** | Prototipagem rapida, admin panels |
| **Django** | Back-end Python, APIs REST |
| **Vite** | Build tool e dev server rapido |

### Ferramentas & Infraestrutura

| Ferramenta | Uso |
|------------|-----|
| **Git** | Controle de versao |
| **GitHub** | Repositorios, CI/CD, colaboracao |
| **VS Code** | IDE principal |
| **Railway** | Plataforma padrao para deploy de backend online (PaaS) |
| **Windows** | Sistema operacional de desenvolvimento |

---

## Estrutura do Repositorio

```
Felixo-System-Design/
│
├── core/                                    # OBRIGATORIO — usar em todo projeto
│   ├── IA.md                                # Template de contexto operacional para IA
│   ├── DESIGN_SYSTEM_FRONTEND.md            # Padroes de qualidade frontend
│   ├── DESIGN_SYSTEM_BACKEND.md             # Padroes de qualidade backend
│   ├── DESIGN_SYSTEM_README.md              # Padroes de documentacao README
│   ├── GUIA_MINIMO_QUALIDADE.md             # Regras minimas obrigatorias de qualidade
│   ├── GUIA-START-APP-SCRIPT.md             # Script de start obrigatorio (instala/inicia/abre)
│   ├── PROMPT_BASE_FRONTEND.md              # Prompt guiado para frontend
│   └── PROMPT_BASE_BACKEND.md               # Prompt guiado para backend
│
├── guias/                                   # OPCIONAL — usar quando relevante
│   ├── frontend/                            # UI, visual, UX, dados
│   │   ├── GUIA-COMPONENTES-UI-COMPOSTOS.md
│   │   ├── GUIA-PARTICULAS-E-GLOW.md
│   │   ├── GUIA-BACKGROUND-VISUAL.md
│   │   ├── GUIA-HEATMAP-DE-ATIVIDADE.md
│   │   ├── GUIA-ONBOARDING-E-AJUDA.md
│   │   ├── GUIA-ARVORE-HIERARQUICA.md
│   │   ├── GUIA-ARVORE-DE-MATERIAIS-DUAL-VIEW.md
│   │   ├── GUIA-CALENDARIO-ACADEMICO.md
│   │   └── GUIA-SISTEMA-DE-ALERTA-E-GRADE.md
│   ├── backend/                             # Logica pura Python/Django
│   │   ├── GUIA-BACKEND-CPF.md
│   │   └── GUIA-CRIPTOGRAFIA-CIFRA-DE-CESAR.md
│   └── integracao/                          # Integracoes externas
│       ├── GUIA-INTEGRACAO-API-GITHUB.md
│       ├── GUIA-SCRAPING-MULTIFORMATO.md
│       └── GUIA-DEPLOY-RAILWAY.md
│
├── componets-database/                      # SUBMODULO — banco de componentes UI
│   ├── scraper/                             # Coletor de componentes (10 fontes)
│   ├── site/                                # Biblioteca visual (Flask + React/Vite)
│   └── start_app.py                         # Setup + coleta com um comando
│
├── scripts/                                 # Instaladores do comando global "felixo"
│   ├── install-felixo.sh                    # Bash/Zsh (Linux, macOS, Git Bash, WSL)
│   ├── install-felixo.ps1                   # PowerShell (Windows/Linux/macOS)
│   ├── install-felixo.cmd                   # CMD (Windows classico)
│   └── felixo.cmd                           # Comando felixo usado pelo instalador CMD
│
├── CONTRIBUTING.md
├── README.md
├── LICENSE
└── .gitmodules
```

---

## Core — Padroes Obrigatorios

A pasta `core/` concentra os artefatos que devem acompanhar **todo projeto**. Ela separa padroes tecnicos de qualidade, prompts operacionais para IA e template de memoria operacional.

### Design System Frontend

Guia completo de padronizacao visual para front-end, extraido do **FelixoVerse**. Documenta paleta, tipografia, layout, componentes, animacoes e padroes de interface. Inclui separacao explicita entre principios universais e escolhas especificas do FelixoVerse.

[Ver design system frontend](core/DESIGN_SYSTEM_FRONTEND.md)

### Design System Backend

Guia de **qualidade de sistema backend**. Define principios de arquitetura, escolha de stack, modularizacao forte, separacao de responsabilidades, estrutura por camadas, padroes de API, persistencia, testes, TDD, SQLite como padrao inicial, Open/Closed, documentacao viva e checklist de qualidade.

[Ver design system backend](core/DESIGN_SYSTEM_BACKEND.md)

### Design System README

Guia de padronizacao para `README.md`, usado como referencia para manter documentacao consistente entre projetos.

[Ver design system README](core/DESIGN_SYSTEM_README.md)

### Guia Minimo de Qualidade

Contrato curto e obrigatorio para preservar qualidade de software em qualquer projeto. Resume os padroes essenciais de arquitetura, seguranca, testes, documentacao e criterio de pronto antes de consultar os documentos longos.

[Ver guia minimo de qualidade](core/GUIA_MINIMO_QUALIDADE.md)

### Start App Script (obrigatorio por app web)

Contrato obrigatorio: **toda aplicacao web** deve ter um `start_app.py` na raiz que **instala dependencias, inicia/reinicia o app e abre o navegador com um unico comando** (`python start_app.py`). Facilita quem automatiza processos de servidor local e quem nao tem facilidade com terminal. Inclui template Python cross-platform pronto, ajuste por stack (Django, FastAPI, Flask, Vite) e checklist.

[Ver guia do start app script](core/GUIA-START-APP-SCRIPT.md)

### Prompt Base Backend

Guia tecnico para montar prompts de backend completos na primeira interacao. Inclui stacks recomendadas, decisoes tecnicas por cenario e exige que a IA siga o `DESIGN_SYSTEM_BACKEND.md` como contrato de qualidade.

[Ver prompt base backend](core/PROMPT_BASE_BACKEND.md)

### Prompt Base Frontend

Guia tecnico para montar prompts de frontend completos na primeira interacao. Inclui stacks recomendadas, decisoes visuais por cenario, campos para componentes, identidade visual, responsividade e animacoes.

[Ver prompt base frontend](core/PROMPT_BASE_FRONTEND.md)

### IA.md — Template de Contexto Operacional

Template padrao de **memoria operacional** para projetos com IA. Deve ser copiado e preenchido continuamente durante o desenvolvimento para registrar:

- objetivo atual e milestones
- decisoes tecnicas
- stack e convencoes
- bugs e correcoes relevantes
- testes importantes
- contexto necessario para outra IA retomar o trabalho sem reler tudo

[Ver IA.md](core/IA.md)

---

## Guias — Padroes Especificos

A pasta `guias/` contem **guias reutilizaveis extraidos de projetos reais**, organizados por dominio. Diferente do `core/`, estes arquivos sao **opcionais** — use apenas quando o projeto precisar daquela funcionalidade.

Cada guia responde a tres perguntas:

- Qual problema ele resolve
- De qual projeto o padrao foi extraido
- Em que tipo de sistema vale reutiliza-lo

### Frontend

#### Arvore Hierarquica

Padrao de **exploracao hierarquica de categorias** com modelo Django (self-referential FK), serializer recursivo e componente React recursivo com animacoes.

**Quando usar:** explorador de categorias/pastas, menus hierarquicos, qualquer dado em arvore parent-child.

[Ver guia](guias/frontend/GUIA-ARVORE-HIERARQUICA.md)

#### Background Visual

Padrao de **background visual em camadas** com gradiente, simbolos animados e troca de tema. Extraido da Calculadora Pro Web (Brython).

**Quando usar:** calculadoras, paginas educacionais, dashboards tecnicos, interfaces com profundidade visual.

[Ver guia](guias/frontend/GUIA-BACKGROUND-VISUAL.md)

#### Heatmap de Atividade

Padrao de **calendario de atividade com intensidade visual** no estilo GitHub. Extraido do Reading Tracker.

**Quando usar:** visualizacao de atividade por dia/semana/mes, dashboards de uso, analise temporal.

[Ver guia](guias/frontend/GUIA-HEATMAP-DE-ATIVIDADE.md)

#### Onboarding e Ajuda

Padrao de **primeira experiencia do usuario** com onboarding leve, destaque contextual e centro de ajuda permanente. Extraido do Reading Tracker.

**Quando usar:** produtos com multiplas funcionalidades, interfaces com curva de aprendizado, dashboards.

[Ver guia](guias/frontend/GUIA-ONBOARDING-E-AJUDA.md)

#### Componentes UI Compostos

Kit de **componentes UI compostos** com Card (compound component), Button (4 variantes x 3 tamanhos), Badge e utilitario de classnames. TypeScript + Tailwind, zero dependencias.

**Quando usar:** qualquer projeto React + Tailwind que precise de componentes base consistentes.

[Ver guia](guias/frontend/GUIA-COMPONENTES-UI-COMPOSTOS.md)

#### Particulas e Sistema de Glow

**Background de particulas flutuantes** com Framer Motion e **sistema completo de glow CSS** com 5 niveis de intensidade controlados por CSS variable.

**Quando usar:** landing pages, portfolios, dashboards dark-theme, interfaces com efeitos de glow.

[Ver guia](guias/frontend/GUIA-PARTICULAS-E-GLOW.md)

#### Arvore de Materiais Dual-View

**Arvore de materiais com dois modos de visualizacao** (simples e dinamico), tracking de itens vistos via localStorage e contagem de progresso por pasta.

**Quando usar:** bibliotecas de materiais, exploradores de documentos, listas de leitura com progresso.

[Ver guia](guias/frontend/GUIA-ARVORE-DE-MATERIAIS-DUAL-VIEW.md)

#### Calendario Academico

**Calendario mensal interativo** com grade de dias, agrupamento de eventos por data, status do usuario e 11 funcoes de data sem dependencias externas.

**Quando usar:** dashboards academicos, calendarios de entregas, agendas de projeto.

[Ver guia](guias/frontend/GUIA-CALENDARIO-ACADEMICO.md)

#### Sistema de Alerta e Grade de Horarios

**Sistema de alerta automatico de proxima aula** com parser de grade, cores por sala e tabela semanal com coluna sticky.

**Quando usar:** paineis academicos, portais de turma, apps de agenda escolar.

[Ver guia](guias/frontend/GUIA-SISTEMA-DE-ALERTA-E-GRADE.md)

### Backend

#### Backend CPF

Padrao de **backend logico para CPF** com algoritmo, contratos, fluxo de validacao, matriz de testes e guardrails para dados reais.

**Quando usar:** geracao sintetica de CPF para testes, validacao backend, normalizacao de entrada, formularios.

[Ver guia](guias/backend/GUIA-BACKEND-CPF.md)

#### Criptografia Cifra de Cesar

Sistemas reutilizaveis da **Cifra de Cesar em Python**: cifra tradicional, cifra numerica, normalizacao de acentos e interface web com Brython.

**Quando usar:** apps educacionais de criptografia, playgrounds web, utilitarios de encode/decode.

[Ver guia](guias/backend/GUIA-CRIPTOGRAFIA-CIFRA-DE-CESAR.md)

### Integracao

#### Integracao API GitHub

Padrao de **coleta robusta de repositorios no GitHub** com autenticacao por token, paginacao, deduplicacao, retry com backoff e tratamento de rate limit.

**Quando usar:** importadores de portfolio, dashboards de projetos, sincronizadores, ETLs de inventario tecnico.

[Ver guia](guias/integracao/GUIA-INTEGRACAO-API-GITHUB.md)

#### Scraping Multiformato

Padrao de **scraping multiformato** com Playwright, parsers offline, JSON embutido, captura manual assistida, persistencia idempotente, URL publica segura, testes e guardrails operacionais.

**Quando usar:** coletores, catalogos, ETLs, comparadores, importadores e pipelines que precisam transformar paginas heterogeneas em dados estruturados auditaveis.

[Ver guia](guias/integracao/GUIA-SCRAPING-MULTIFORMATO.md)

#### Deploy Railway (backend padrao online)

**Servico padrao para colocar backend online**. Railway (PaaS) faz build, deploy, banco gerenciado, variaveis de ambiente, dominio HTTPS e logs sem gerenciar servidor — **mais do que suficiente para a maioria das aplicacoes**. Inclui fluxo completo de CLI, conceitos, deploy por Git ou `railway up`, bancos e checklist.

**Quando usar:** APIs REST, back-ends de apps, workers, bots, scrapers agendados e qualquer servico que precise ficar online com URL publica e HTTPS.

> **Aviso:** o login/autorizacao do Railway falha com frequencia. O guia instrui o agente a **parar e enviar o passo a passo manual ao usuario** (terminal ou interface) apos erros repetidos de conexao, em vez de insistir.

[Ver guia](guias/integracao/GUIA-DEPLOY-RAILWAY.md)

---

## Licenca

Este projeto esta sob a licenca MIT — veja o arquivo `LICENSE`.

## Autor

**Felipe Martin**
- GitHub: [@Felipe-Alcantara](https://github.com/Felipe-Alcantara)

---

> **Assinatura de Origem**  
> Este arquivo foi criado por **Felipe Martin** e faz parte do repositorio **Felixo System Design**.  
> Origem: https://github.com/Felipe-Alcantara/Felixo-System-Design  
> Data desta versao: 2026-06-07
> Sugestoes e pull requests sao bem-vindos.
