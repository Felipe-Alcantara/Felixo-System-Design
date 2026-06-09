# Felixo System Design

<div align="center">

![React](https://img.shields.io/badge/React-18-61DAFB?style=for-the-badge&logo=react&logoColor=white)
![Tailwind](https://img.shields.io/badge/Tailwind_CSS-3-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![C#](https://img.shields.io/badge/C%23-512BD4?style=for-the-badge&logo=csharp&logoColor=white)
![Django](https://img.shields.io/badge/Django-0C4B33?style=for-the-badge&logo=django&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Repositorio central de padroes de design, qualidade de sistema, prompts estruturados e guias reutilizaveis para desenvolvimento com IA.**

[Mapa do conteudo](#mapa-do-conteudo) · [Como usar](#como-usar-em-outros-projetos) · [Estrutura](#estrutura-do-repositorio) · [Stack](#stack)

</div>

---

## O que e isto

Uma **base centralizada** para padronizar tudo que envolve meus projetos. Organizado em duas camadas + extras:

| Camada | O que e | Quando usar |
|--------|---------|-------------|
| **`core/`** | Padroes de qualidade obrigatorios (design systems, prompts base, qualidade minima, contexto de IA) | Em **todo** projeto |
| **`guias/`** | Guias reutilizaveis extraidos de projetos reais, por dominio | Apenas quando o projeto precisar daquela funcionalidade |
| **`componets-database/`** | Submodulo com banco de componentes UI (scraper + biblioteca visual) | Opcional — so se quiser o banco de componentes |
| **`scripts/`** | Instaladores do comando global `felixo` (baixa/atualiza este repo) | Para sincronizar os padroes em outros projetos |

---

## Mapa do conteudo

### `core/` — padroes obrigatorios

| Arquivo | O que e |
|---------|---------|
| [DESIGN_SYSTEM_FRONTEND.md](core/DESIGN_SYSTEM_FRONTEND.md) | Padronizacao visual de front-end: paleta, tipografia, layout, componentes, animacoes. Separa principios universais das escolhas do FelixoVerse. |
| [DESIGN_SYSTEM_BACKEND.md](core/DESIGN_SYSTEM_BACKEND.md) | Qualidade de backend: arquitetura, modularizacao, camadas, API, persistencia, testes/TDD, Open/Closed e checklist. |
| [DESIGN_SYSTEM_README.md](core/DESIGN_SYSTEM_README.md) | Padrao de `README.md` para manter documentacao consistente entre projetos. |
| [GUIA_MINIMO_QUALIDADE.md](core/GUIA_MINIMO_QUALIDADE.md) | Contrato curto e obrigatorio: arquitetura, seguranca, testes, docs e criterio de "pronto". |
| [GUIA-START-APP-SCRIPT.md](core/GUIA-START-APP-SCRIPT.md) | Contrato do `start_app.py`: instala deps, inicia/reinicia e abre o navegador com `python start_app.py`. Template cross-platform por stack. |
| [PROMPT_BASE_FRONTEND.md](core/PROMPT_BASE_FRONTEND.md) | Guia para montar prompts de frontend completos na primeira interacao (stacks, decisoes visuais, componentes, identidade). |
| [PROMPT_BASE_BACKEND.md](core/PROMPT_BASE_BACKEND.md) | Guia para montar prompts de backend completos (stacks recomendadas, decisoes por cenario, exige seguir o design system backend). |
| [IA.md](core/IA.md) | Template de memoria operacional para continuidade entre sessoes: objetivo, decisoes, stack, bugs, testes e contexto. |

### `guias/frontend/`

| Guia | O que resolve · Quando usar |
|------|------------------------------|
| [Arvore hierarquica](guias/frontend/GUIA-ARVORE-HIERARQUICA.md) | Exploracao hierarquica de categorias (FK self-referential + serializer recursivo + componente React). **Use em:** menus/pastas, dados parent-child. |
| [Background visual](guias/frontend/GUIA-BACKGROUND-VISUAL.md) | Background em camadas com gradiente, simbolos animados e troca de tema. **Use em:** calculadoras, paginas educacionais, dashboards. |
| [Heatmap de atividade](guias/frontend/GUIA-HEATMAP-DE-ATIVIDADE.md) | Calendario de atividade estilo GitHub. **Use em:** dashboards de uso, analise temporal. |
| [Onboarding e ajuda](guias/frontend/GUIA-ONBOARDING-E-AJUDA.md) | Onboarding leve, destaque contextual e centro de ajuda. **Use em:** produtos com curva de aprendizado. |
| [Componentes UI compostos](guias/frontend/GUIA-COMPONENTES-UI-COMPOSTOS.md) | Kit base (Card compound, Button, Badge, classnames) em TS + Tailwind, zero deps. **Use em:** qualquer projeto React + Tailwind. |
| [Particulas e glow](guias/frontend/GUIA-PARTICULAS-E-GLOW.md) | Particulas flutuantes (Framer Motion) + sistema de glow CSS com 5 niveis. **Use em:** landing pages, portfolios, dark theme. |
| [Arvore de materiais dual-view](guias/frontend/GUIA-ARVORE-DE-MATERIAIS-DUAL-VIEW.md) | Arvore com 2 modos, tracking via localStorage e progresso por pasta. **Use em:** bibliotecas de materiais, listas de leitura. |
| [Calendario academico](guias/frontend/GUIA-CALENDARIO-ACADEMICO.md) | Calendario mensal interativo com eventos e 11 funcoes de data sem deps. **Use em:** dashboards academicos, agendas. |
| [Sistema de alerta e grade](guias/frontend/GUIA-SISTEMA-DE-ALERTA-E-GRADE.md) | Alerta de proxima aula, parser de grade e tabela semanal sticky. **Use em:** paineis academicos, portais de turma. |

### `guias/backend/`

| Guia | O que resolve · Quando usar |
|------|------------------------------|
| [Backend CPF](guias/backend/GUIA-BACKEND-CPF.md) | Algoritmo, contratos, validacao e guardrails para CPF. **Use em:** geracao sintetica para testes, validacao, formularios. |
| [Cifra de Cesar](guias/backend/GUIA-CRIPTOGRAFIA-CIFRA-DE-CESAR.md) | Cifra tradicional/numerica, normalizacao de acentos e UI Brython. **Use em:** apps educacionais de cripto, playgrounds. |

### `guias/integracao/`

| Guia | O que resolve · Quando usar |
|------|------------------------------|
| [API GitHub](guias/integracao/GUIA-INTEGRACAO-API-GITHUB.md) | Coleta de repos com token, paginacao, dedup, retry e rate limit. **Use em:** importadores de portfolio, sincronizadores, ETLs. |
| [Scraping multiformato](guias/integracao/GUIA-SCRAPING-MULTIFORMATO.md) | Playwright, parsers offline, captura assistida e persistencia idempotente. **Use em:** coletores, catalogos, comparadores. |
| [Deploy Railway](guias/integracao/GUIA-DEPLOY-RAILWAY.md) | Backend online (PaaS): build, deploy, banco, env, HTTPS e logs. **Use em:** APIs, workers, bots, scrapers agendados. ⚠️ login do Railway falha com frequencia — o guia manda parar e enviar passo a passo manual. |

---

## Como usar em outros projetos

Metodos do mais usual para o mais especifico.

> **Sobre o submodulo `componets-database/`**
> So e necessario se voce quiser o banco de componentes UI — para `core/` e `guias/` ele e dispensavel. Por isso cada metodo traz duas variantes: **sem o submodulo** (mais leve) e **com o submodulo** (completo). ZIP e `npx degit` **nunca** trazem submodulos — para o banco de componentes use uma das variantes `git`.

### 1. Sincronizar com a versao mais recente (recomendado)

Melhor opcao para manter uma pasta local sem vinculo com o git original, rodando o comando quantas vezes quiser para atualizar.

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

- **Use quando:** quer todos os arquivos como base independente, com atualizacao simples depois
- **Requisito:** Git · **Vinculo com o git original?** Nao

#### Comando global `felixo` (instalador multiplataforma)

Em vez de copiar a funcao na mao, use os instaladores em [`scripts/`](scripts/). Eles registram o comando `felixo` no seu terminal com **logs coloridos, barra de loading e avisos de erro**. Depois de instalado, rode `felixo` em qualquer pasta para baixar a versao mais recente — **tudo, menos o submodulo**. Use `felixo --with-submodules` (ou `-s`) para incluir o banco de componentes.

| Seu terminal | Sistemas | Script |
|--------------|----------|--------|
| **Bash** ou **Zsh** | Linux, macOS, Git Bash, WSL | [`scripts/bash-zsh/install-felixo-bash-zsh.sh`](scripts/bash-zsh/install-felixo-bash-zsh.sh) |
| **PowerShell** (5.1+ / 7+) | Windows, Linux, macOS | [`scripts/powershell/install-felixo-powershell.ps1`](scripts/powershell/install-felixo-powershell.ps1) |
| **CMD** (Prompt classico) | Windows | [`scripts/cmd/install-felixo-cmd.cmd`](scripts/cmd/install-felixo-cmd.cmd) |

> **Por que o CMD tem dois arquivos?** No Bash e PowerShell o instalador *escreve a funcao `felixo` no arquivo de config* (`.bashrc` / `$PROFILE`), entao um unico arquivo basta. No CMD um "comando" precisa ser um arquivo proprio numa pasta do PATH, por isso a pasta `cmd/` tem dois:
> - [`install-felixo-cmd.cmd`](scripts/cmd/install-felixo-cmd.cmd) — o **instalador** (roda uma vez): copia o comando para `%LOCALAPPDATA%\felixo` e adiciona ao PATH.
> - [`felixo-command.cmd`](scripts/cmd/felixo-command.cmd) — o **comando `felixo`** em si. **Nao e instalador e voce nao roda direto** — quem o executa e o `felixo` que voce digita depois de instalar.

**Bash / Zsh:**
```bash
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git /tmp/felixo-setup
bash /tmp/felixo-setup/scripts/bash-zsh/install-felixo-bash-zsh.sh
# desinstalar: bash /tmp/felixo-setup/scripts/bash-zsh/install-felixo-bash-zsh.sh --uninstall
```

**PowerShell:**
```powershell
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git $env:TEMP\felixo-setup
& "$env:TEMP\felixo-setup\scripts\powershell\install-felixo-powershell.ps1"
# desinstalar: & "$env:TEMP\felixo-setup\scripts\powershell\install-felixo-powershell.ps1" -Uninstall
```

**CMD:**
```cmd
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git "%TEMP%\felixo-setup"
"%TEMP%\felixo-setup\scripts\cmd\install-felixo-cmd.cmd"
:: desinstalar: "%TEMP%\felixo-setup\scripts\cmd\install-felixo-cmd.cmd" --uninstall
```

Depois de instalar, **abra um novo terminal** e use:
```bash
felixo                   # baixa tudo, menos o submodulo componets-database
felixo --with-submodules # inclui o banco de componentes
```

Ao terminar, o `felixo` mostra um **resumo do que mudou** — arquivos novos, atualizados e removidos (contagem + lista, em cores). Os instaladores sao **idempotentes**: rodar de novo apenas atualiza a definicao do comando.

---

### 2. Baixar o repositorio inteiro como ZIP

> **Submodulo:** o ZIP do GitHub **nunca** inclui `componets-database/`. Para o banco de componentes use o metodo 1 (com submodulo) ou o metodo 4.

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

> **Submodulo:** `degit` **nao** baixa submodulos. Traz `core/` e `guias/`, mas `componets-database/` vem vazia.

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

> Se ja clonou sem `--recurse-submodules`, rode dentro do repositorio:
> ```bash
> git submodule update --init --recursive
> ```

---

### 5. Baixar apenas `guias/` com `npx degit`

```bash
npx degit Felipe-Alcantara/Felixo-System-Design/guias ./felixo-guias
```

---

### 6. Baixar apenas `core/` com `git sparse-checkout`

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

Depois, copie manualmente a pasta desejada (`core`, `guias` ou `componets-database`).

---

### Escolha rapida por cenario

| Cenario | Melhor opcao | Traz o submodulo? |
|---------|--------------|-------------------|
| `core/` + `guias/` com atualizacao simples | metodo 1 sem submodulo (`felixo`) | Nao |
| Tudo, incluindo o banco de componentes | metodo 1 com submodulo (`felixo -s`) | Sim |
| Tudo da forma mais simples | ZIP | Nao (ZIP nao suporta) |
| Tudo sem `.git` via terminal | `npx degit` | Nao (degit nao suporta) |
| Tudo e depois atualizar via git | `git clone` (com/sem `--recurse-submodules`) | Depende da flag |
| So `guias/` sem `git` | `npx degit` em `guias` | N/A |
| So `guias/` ou `core/` com atualizacao futura | `git sparse-checkout` | N/A |
| Opcao universal | clone completo (`--recurse-submodules`) + copiar a pasta | Sim |

---

## Estrutura do repositorio

```
Felixo-System-Design/
├── core/                                  # OBRIGATORIO — usar em todo projeto
│   ├── IA.md                              # Template de contexto operacional para IA
│   ├── DESIGN_SYSTEM_FRONTEND.md          # Padroes de qualidade frontend
│   ├── DESIGN_SYSTEM_BACKEND.md           # Padroes de qualidade backend
│   ├── DESIGN_SYSTEM_README.md            # Padroes de documentacao README
│   ├── GUIA_MINIMO_QUALIDADE.md           # Regras minimas obrigatorias de qualidade
│   ├── GUIA-START-APP-SCRIPT.md           # Contrato do start_app.py (instala/inicia/abre)
│   ├── PROMPT_BASE_FRONTEND.md            # Prompt guiado para frontend
│   └── PROMPT_BASE_BACKEND.md             # Prompt guiado para backend
│
├── guias/                                 # OPCIONAL — usar quando relevante
│   ├── frontend/                          # UI, visual, UX, dados (9 guias)
│   ├── backend/                           # Logica pura Python/Django (2 guias)
│   └── integracao/                        # Integracoes externas (3 guias)
│
├── componets-database/                    # SUBMODULO — banco de componentes UI
│   ├── scraper/                           # Coletor de componentes
│   ├── site/                              # Biblioteca visual (Flask + React/Vite)
│   └── start_app.py                       # Setup + coleta com um comando
│
├── scripts/                               # Instaladores do comando global "felixo"
│   ├── bash-zsh/                          # Bash e Zsh (Linux, macOS, Git Bash, WSL)
│   ├── powershell/                        # PowerShell (Windows, Linux, macOS)
│   └── cmd/                               # CMD: instalador + comando felixo
│
├── CONTRIBUTING.md
├── README.md
├── LICENSE
└── .gitmodules
```

---

## Stack

**Linguagens:** HTML5 · CSS3 · JavaScript · TypeScript · C# · Python
**Frameworks & libs:** React · Tailwind CSS · Bootstrap · Django · Vite
**Ferramentas:** Git · GitHub · VS Code · Railway (deploy PaaS padrao) · Windows

---

## Para agentes de IA

Instrucoes para agentes que trabalham **diretamente neste repositorio** (nao via fork). Para contribuicoes externas, siga o fluxo de fork + Pull Request em [`CONTRIBUTING.md`](CONTRIBUTING.md).

- **Git:** trabalhe direto no `main` por padrao. So crie branch para **feature grande**, **refatoracao significativa** ou algo de **alto risco**. Evite abrir branch para cada pequena mudanca.
- **Commits:** sempre commite apos uma adicao concluida; commits pequenos e bem descritivos.
- **Documentacao:** mantenha viva durante os commits — ao mudar comportamento, estrutura ou comandos, atualize no mesmo passo o `README.md`, os guias e o `IA.md` afetados. Se um modulo nao couber no README/guias, crie uma pasta [`docs/`](docs/).

---

## Licenca e autor

Licenca **MIT** — veja [`LICENSE`](LICENSE).

**Felipe Martin** · GitHub: [@Felipe-Alcantara](https://github.com/Felipe-Alcantara)

---

> **Assinatura de Origem**
> Criado por **Felipe Martin**, parte do repositorio **Felixo System Design**.
> Origem: https://github.com/Felipe-Alcantara/Felixo-System-Design
> Sugestoes e pull requests sao bem-vindos.
