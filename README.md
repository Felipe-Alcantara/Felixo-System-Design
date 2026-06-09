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

[Core (Obrigatorio)](docs/CORE.md) | [Guias (Opcional)](docs/GUIAS.md) | [Como Usar](docs/INSTALACAO.md) | [Stack](#%EF%B8%8F-minha-stack)

</div>

---

## Indice

- [Sobre o Repositorio](#-sobre-o-repositorio)
- [Mapa do Repositorio](#-mapa-do-repositorio)
- [Estrutura do Repositorio](#-estrutura-do-repositorio)
- [Minha Stack](#%EF%B8%8F-minha-stack)
- [Para Agentes de IA](#-para-agentes-de-ia)
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

## Mapa do Repositorio

Cada area tem um documento proprio, com uma responsabilidade unica. Use o mapa abaixo para ir direto ao que precisa.

| Documento | Responsabilidade | O que voce encontra |
|-----------|------------------|---------------------|
| **[docs/CORE.md](docs/CORE.md)** | Padroes **obrigatorios** | Design systems (frontend, backend, README), guia minimo de qualidade, start app script, prompts base e o template de contexto `IA.md` — cada um descrito e com link. |
| **[docs/GUIAS.md](docs/GUIAS.md)** | Padroes **opcionais** por dominio | Guias reutilizaveis de **frontend** (9), **backend** (2) e **integracao** (3): o que cada um resolve, de qual projeto foi extraido e quando reutilizar. |
| **[docs/INSTALACAO.md](docs/INSTALACAO.md)** | **Como usar** em outros projetos | Os 8 metodos de download/sincronizacao (incluindo o comando global `felixo`), variantes com/sem submodulo e a tabela de escolha rapida por cenario. |
| **[CONTRIBUTING.md](CONTRIBUTING.md)** | **Contribuir** de fora | Fluxo de fork + Pull Request para contribuicoes externas. |
| [Estrutura do Repositorio](#-estrutura-do-repositorio) | **Layout** das pastas | Arvore completa de arquivos e pastas com uma linha por item. |
| [Para Agentes de IA](#-para-agentes-de-ia) | Regras para agentes **neste** repo | Politica de git/branches, commits e documentacao viva. |

### Mapa rapido por necessidade

- **Quero os padroes obrigatorios de qualidade** → [docs/CORE.md](docs/CORE.md)
- **Preciso de um padrao especifico** (arvore, heatmap, scraping, deploy...) → [docs/GUIAS.md](docs/GUIAS.md)
- **Quero baixar/sincronizar este repo num projeto** → [docs/INSTALACAO.md](docs/INSTALACAO.md)
- **Quero o comando global `felixo`** → [docs/INSTALACAO.md — comando `felixo`](docs/INSTALACAO.md#comando-global-felixo-instalador-multiplataforma)
- **Quero o banco de componentes UI** → submodulo [`componets-database/`](componets-database/) (veja as variantes "com submodulo" em [docs/INSTALACAO.md](docs/INSTALACAO.md))
- **Vou contribuir de fora** → [CONTRIBUTING.md](CONTRIBUTING.md)
- **Sou um agente de IA trabalhando aqui** → [Para Agentes de IA](#-para-agentes-de-ia)

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
│   ├── bash-zsh/
│   │   └── install-felixo-bash-zsh.sh       # Instalador p/ Bash e Zsh (Linux, macOS, Git Bash, WSL)
│   ├── powershell/
│   │   └── install-felixo-powershell.ps1    # Instalador p/ PowerShell (Windows, Linux, macOS)
│   └── cmd/                                  # CMD (Prompt classico do Windows)
│       ├── install-felixo-cmd.cmd           # Instalador (roda uma vez)
│       └── felixo-command.cmd               # Comando felixo em si (instalado como felixo.cmd)
│
├── docs/                                    # Documentacao por responsabilidade
│   ├── CORE.md                              # Detalhe dos padroes obrigatorios
│   ├── GUIAS.md                             # Detalhe dos guias por dominio
│   └── INSTALACAO.md                        # Como usar em outros projetos (8 metodos)
│
├── CONTRIBUTING.md
├── README.md
├── LICENSE
└── .gitmodules
```

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

## Para Agentes de IA

Instrucoes para agentes que trabalham **diretamente neste repositorio** (nao via fork). Para contribuicoes externas, siga o fluxo de fork + Pull Request descrito em [`CONTRIBUTING.md`](CONTRIBUTING.md).

### Git e branches

- **Trabalhe direto no `main` por padrao.** Nao crie branches desnecessarias.
- **So crie uma branch nova quando** a mudanca for uma **feature grande**, uma **refatoracao** significativa ou algo de **alto risco** (que altera comportamento e precisa ser testado, ou pode quebrar algo existente).
- Fora esses casos (correcoes simples, docs, ajustes pequenos, refactors seguros), **commite no `main`** sem criar branch.
- Evite o vicio de abrir uma branch nova para cada implementacao — varios agentes tendem a criar branches demais; nao siga esse padrao aqui.

### Commits

- **Sempre commite apos uma adicao concluida.** Nao acumule varias mudancas soltas sem commitar.
- Faca **commits pequenos, porem bem descritivos** — cada commit com escopo claro e mensagem que explica o que mudou e por que.

### Documentacao

- **Mantenha a documentacao atualizada e viva durante os commits.** Ao mudar comportamento, estrutura ou comandos, atualize no mesmo passo o `README.md`, os documentos em [`docs/`](docs/), os guias e o `IA.md` afetados — documentacao desatualizada conta como trabalho incompleto.
- A pasta [`docs/`](docs/) ja existe para documentacao por responsabilidade (core, guias, instalacao). Mantenha cada arquivo com **uma responsabilidade unica** e adicione novos documentos ali quando um tema nao couber naturalmente nos existentes.

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
> Data desta versao: 2026-06-09
> Sugestoes e pull requests sao bem-vindos.
