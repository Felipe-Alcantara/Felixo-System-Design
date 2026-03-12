# 🎨 Felixo System Design

<div align="center">

![React](https://img.shields.io/badge/React-18-61DAFB?style=for-the-badge&logo=react&logoColor=white)
![Tailwind](https://img.shields.io/badge/Tailwind_CSS-3-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![C#](https://img.shields.io/badge/C%23-512BD4?style=for-the-badge&logo=csharp&logoColor=white)
![Django](https://img.shields.io/badge/Django-0C4B33?style=for-the-badge&logo=django&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Repositório central de padrões de design, stack de tecnologias e prompts para IA — garantindo consistência em todos os meus projetos.**

[🎨 Design System Frontend](#-design-system-frontend) • [🚀 Prompt Base Backend](#-prompt-base-backend) • [🤖 IA.md](#-iamd--registro-de-contexto) • [📖 Guia de README](#-guia-de-documentação-readme) • [🛠️ Stack](#%EF%B8%8F-minha-stack)

</div>

---

## 📋 Índice

- [📋 Sobre o Repositório](#-sobre-o-repositório)
- [🛠️ Minha Stack](#%EF%B8%8F-minha-stack)
- [📁 Estrutura do Repositório](#-estrutura-do-repositório)
- [🎨 Design System Frontend](#-design-system-frontend)
- [🚀 Prompt Base Backend](#-prompt-base-backend)
- [🤖 IA.md — Registro de Contexto](#-iamd--registro-de-contexto)
- [📖 Guia de Documentação README](#-guia-de-documentação-readme)
- [📥 Como Usar em Outros Projetos](#-como-usar-em-outros-projetos)
- [📝 Licença](#-licença)
- [👤 Autor](#-autor)

---

## 📋 Sobre o Repositório

Este repositório serve como **base centralizada** para registrar e padronizar tudo que envolve meus projetos de desenvolvimento:

- **🎨 Design System** — Identidade visual, componentes, paletas de cores e padrões de UI para o front-end
- **🚀 Prompts para IA** — Prompts otimizados para usar com assistentes de IA no desenvolvimento back-end
- **🛠️ Stack de Tecnologias** — Registro da stack preferida para priorizar em novos projetos
- **🤖 Registro de Contexto para IA** — Template de anotações técnicas para manter contexto entre modelos de IA
- **📖 Padrão de Documentação** — Guia de como documentar repositórios com READMEs consistentes

O objetivo é ter um **ponto de referência único** para garantir consistência, qualidade e agilidade em todos os novos projetos.

---

## 🛠️ Minha Stack

### Linguagens

| Tecnologia | Uso |
|------------|-----|
| **HTML5** | Estrutura e marcação web |
| **CSS3** | Estilização e layout |
| **JavaScript** | Lógica client-side e scripts |
| **TypeScript** | Tipagem forte, projetos escaláveis |
| **C#** | Back-end robusto, APIs .NET |
| **Python** | Back-end, automações, scripts |

### Frameworks & Bibliotecas

| Tecnologia | Uso |
|------------|-----|
| **React** | Interfaces de usuário reativas |
| **Tailwind CSS** | Estilização utilitária |
| **Bootstrap** | Prototipagem rápida, admin panels |
| **Django** | Back-end Python, APIs REST |
| **Vite** | Build tool e dev server rápido |

### Ferramentas & Infraestrutura

| Ferramenta | Uso |
|------------|-----|
| **Git** | Controle de versão |
| **GitHub** | Repositórios, CI/CD, colaboração |
| **VS Code** | IDE principal |
| **Windows** | Sistema operacional de desenvolvimento |

---

## 📁 Estrutura do Repositório

```
Felixo System Design/
│
├── DESIGN-SYSTEM-FRONTEND.md     # Design system para front-end
├── PROMPT-BASE-BACKEND.md        # Prompt base para desenvolvimento back-end
├── IA.md                         # Registro de contexto para modelos de IA
├── GUIA_DOCUMENTACAO_README.md   # Padrão de documentação de READMEs
├── README.md                     # Este arquivo
└── LICENSE
```

---

## 🎨 Design System Frontend

Guia completo de padronização visual para o front-end, extraído do portfólio **FelixoVerse**. Contém:

- Paleta de cores (primárias, gradientes, status, categorias)
- Tipografia e hierarquia de tamanhos
- Sistema de grid e breakpoints
- Componentes reutilizáveis (Button, Card, Badge, Input, Modal)
- Padrões de animação com Framer Motion
- Efeitos visuais (glow, glassmorphism, gradientes)

📖 [Ver Design System completo](DESIGN-SYSTEM-FRONTEND.md)

---

## 🚀 Prompt Base Backend

Prompt otimizado para iniciar projetos de **back-end** com assistentes de IA. Inclui:

- Stack preferida já definida (Python/Django, TypeScript — C# só em último caso)
- Diretrizes de planejamento e arquitetura
- Fluxo de trabalho iterativo
- Padrões de segurança e qualidade
- Estrutura de pastas sugerida
- Checklist de pré-entrega

📖 [Ver Prompt Base Backend](PROMPT-BASE-BACKEND.md)

---

## 🤖 IA.md — Registro de Contexto

Template de **caderno de anotações técnico para IAs**. Deve ser copiado para cada novo projeto e preenchido ao longo do desenvolvimento. Garante que:

- Modelos de IA recuperem contexto sem reler todo o código
- Decisões, stack, bugs e metas fiquem registrados em um único lugar
- Trocas de modelo (ou novas conversas) não percam informações críticas
- O conteúdo é técnico e específico — feito para IA, não para humanos

📖 [Ver template IA.md](IA.md)

---

## 📖 Guia de Documentação README

Padrão de estrutura e escrita de `README.md` para todos os projetos. Define:

- Estrutura obrigatória de seções
- Convenções de badges, emojis e formatação
- Template rápido para novos projetos
- Checklist antes de publicar

📖 [Ver Guia de Documentação](GUIA_DOCUMENTACAO_README.md)

---

## 📥 Como Usar em Outros Projetos

Para copiar todos os arquivos deste repositório para dentro de qualquer projeto **sem vínculo com o repositório original**, use um dos métodos abaixo:

### Opção 1: `npx degit` (Recomendado 🌟)

Copia os arquivos direto do GitHub, sem `.git`, sem histórico — só os arquivos.

```bash
npx degit Felipe-Alcantara/Felixo-System-Design ./felixo-standards
```

- **Requisito**: Node.js instalado
- **O que faz**: Baixa os arquivos do repositório e coloca na pasta `./felixo-standards`
- **Vínculo com o git original?** Não — nenhum `.git` é criado

---

### Opção 2: `git clone` + remover `.git`

Clona o repositório e depois remove a pasta `.git` para desvinculiar.

**Linux / macOS / Git Bash:**
```bash
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git ./felixo-standards && rm -rf ./felixo-standards/.git
```

**PowerShell (Windows):**
```powershell
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git ./felixo-standards; Remove-Item -Recurse -Force ./felixo-standards/.git
```

**CMD (Windows):**
```cmd
git clone --depth 1 https://github.com/Felipe-Alcantara/Felixo-System-Design.git ./felixo-standards && rmdir /s /q ./felixo-standards/.git
```

- **Requisito**: Git instalado
- **`--depth 1`**: Clona apenas o último commit (mais rápido)
- **O que faz**: Clona e depois apaga o `.git`, deixando apenas os arquivos

---

### Opção 3: Download como ZIP

Baixa e extrai o ZIP direto pelo terminal, sem precisar de git.

**PowerShell (Windows):**
```powershell
Invoke-WebRequest -Uri "https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip" -OutFile "felixo.zip"
Expand-Archive "felixo.zip" -DestinationPath .
Rename-Item "Felixo-System-Design-main" "felixo-standards"
Remove-Item "felixo.zip"
```

**CMD (Windows):**
```cmd
curl -L https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip -o felixo.zip
tar -xf felixo.zip
ren Felixo-System-Design-main felixo-standards
del felixo.zip
```

**Linux / macOS:**
```bash
curl -L https://github.com/Felipe-Alcantara/Felixo-System-Design/archive/refs/heads/main.zip -o felixo.zip
unzip felixo.zip && mv Felixo-System-Design-main felixo-standards && rm felixo.zip
```

- **Requisito**: Nenhum (ferramentas nativas do sistema)
- **O que faz**: Baixa o ZIP do GitHub, extrai e renomeia a pasta

---

> 💡 **Dica**: Após copiar, os arquivos ficam independentes. Você pode editá-los, mover para outra pasta ou commitar junto com o seu projeto normalmente.

---

## 📝 Licença

Este projeto está sob a licença MIT — veja o arquivo `LICENSE`.

## 👤 Autor

**Felipe Martin**
- GitHub: [@Felipe-Alcantara](https://github.com/Felipe-Alcantara)

---

⭐ Se este repositório foi útil, considere dar uma estrela no GitHub!
