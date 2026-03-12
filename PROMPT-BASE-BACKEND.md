# 🚀 Prompt Base para Desenvolvimento Backend

> **Escopo**: Este prompt é voltado para o desenvolvimento **back-end** — APIs, lógica de negócios, banco de dados, automações e infraestrutura do lado do servidor.

```markdown
# CONTEXTO DO PROJETO
[Descreva brevemente a ideia do projeto aqui]

---

## 🛠️ STACK PREFERIDA

Sempre que possível, **priorize as tecnologias abaixo**. Caso o projeto exija algo diferente, justifique a escolha antes de prosseguir.

### Linguagens & Frameworks (em ordem de prioridade)

| Prioridade | Tecnologia | Uso Principal |
|:----------:|------------|---------------|
| 🥇 | **Python** / **Django** | Back-end principal, APIs REST, automações, scripts |
| 🥈 | **TypeScript** | Back-end Node.js, tipagem forte, lógica compartilhada |
| — | **JavaScript** | Scripts auxiliares, integrações leves |
| 🔻 | **C#** / **.NET** | **Último recurso** — usar apenas quando as opções acima não atenderem |

### Front-end (quando necessário)

| Tecnologia | Uso Principal |
|------------|---------------|
| **React** | Biblioteca principal para interfaces |
| **Tailwind CSS** | Estilização utilitária |
| **Bootstrap** | Estilização de projetos rápidos / admin panels |
| **Vite** | Build tool e dev server |
| **HTML5 / CSS3** | Estrutura e estilo base |

### Ferramentas & Infraestrutura

| Ferramenta | Uso Principal |
|------------|---------------|
| **Git** | Controle de versão |
| **GitHub** | Repositórios, CI/CD, colaboração |
| **VS Code** | IDE principal |
| **Windows** | Sistema operacional de desenvolvimento |

> 💡 **Nota**: Sempre priorize **Python/Django** ou **TypeScript** para o back-end. Use **C#/.NET** apenas como último recurso, quando nenhuma das opções anteriores for viável. Se precisar de algo fora da stack, sugira alternativas e aguarde aprovação.

---

## 📋 DIRETRIZES DE DESENVOLVIMENTO

### 1. PLANEJAMENTO INICIAL
Antes de escrever qualquer código:
- Analise o problema completamente
- Proponha a arquitetura/estrutura de pastas
- Liste as tecnologias/dependências necessárias (priorizando a stack acima)
- Aguarde minha aprovação antes de prosseguir

### 2. ESTRUTURA DO PROJETO
- Crie uma estrutura modular e organizada
- Separe responsabilidades (config, lógica, interface, utils)
- Use nomes descritivos em português ou inglês (consistente)
- Inclua README.md desde o início

### 3. DESENVOLVIMENTO ITERATIVO
Para cada funcionalidade:
1. Implemente a versão básica primeiro
2. Teste manualmente ou com testes unitários
3. Refatore e melhore baseado nos resultados
4. Documente o que foi feito

### 4. TESTES E QUALIDADE
- Crie testes unitários para funções críticas
- Teste com dados reais quando possível
- Valide edge cases e cenários de erro
- Mantenha cobertura de testes atualizada

### 5. SEGURANÇA E PROTEÇÃO DE DADOS
- NUNCA delete arquivos sem confirmação explícita
- Prefira COPIAR ao invés de MOVER quando possível
- Implemente verificações antes de operações destrutivas
- Adicione logs/feedback visual das operações
- Teste cenários de falha (permissões, arquivos em uso, etc.)

### 6. INTERFACE E UX
- Forneça feedback claro ao usuário
- Use cores/ícones para facilitar leitura (quando aplicável)
- Mostre progresso em operações longas
- Confirme antes de ações importantes

### 7. DOCUMENTAÇÃO
- README com: descrição, instalação, uso, exemplos
- Comentários em código complexo
- Docstrings em funções públicas
- Changelog para mudanças significativas

### 8. COMMITS E VERSIONAMENTO
Ao final de cada milestone, forneça:
- Título do commit (feat/fix/docs/refactor)
- Descrição detalhada das mudanças
- Lista de arquivos modificados

---

## 🔄 FLUXO DE TRABALHO

### Fase 1: Análise
- [ ] Entender o problema completamente
- [ ] Identificar requisitos e restrições
- [ ] Propor solução e aguardar aprovação

### Fase 2: Setup
- [ ] Criar estrutura de pastas
- [ ] Configurar dependências
- [ ] Criar arquivos base (config, main, etc.)

### Fase 3: Desenvolvimento
- [ ] Implementar funcionalidades core
- [ ] Adicionar tratamento de erros
- [ ] Criar interface (CLI/GUI/API)

### Fase 4: Testes
- [ ] Testes unitários
- [ ] Testes com dados reais
- [ ] Validar edge cases

### Fase 5: Refinamento
- [ ] Otimizar performance se necessário
- [ ] Melhorar UX baseado em feedback
- [ ] Refatorar código duplicado

### Fase 6: Documentação
- [ ] Atualizar README
- [ ] Documentar funções/APIs
- [ ] Preparar commit final

---

## ⚠️ REGRAS IMPORTANTES

1. **Pergunte antes de assumir** - Se algo não estiver claro, pergunte
2. **Mostre progresso** - Atualize-me sobre o que está fazendo
3. **Teste antes de entregar** - Rode os testes antes de dizer que terminou
4. **Seja conservador com dados** - Nunca assuma que pode deletar/modificar
5. **Itere com feedback** - Após cada entrega, aguarde meu feedback
6. **Documente decisões** - Explique o porquê de escolhas importantes

---

## 📁 ESTRUTURA SUGERIDA (adapte conforme necessário)

```
projeto/
├── src/                    # Código fonte principal
│   ├── __init__.py
│   ├── config.py          # Configurações e constantes
│   ├── core.py            # Lógica principal
│   └── utils.py           # Funções utilitárias
├── tests/                  # Testes unitários
│   └── test_core.py
├── utils/                  # Scripts auxiliares
├── docs/                   # Documentação extra
├── main.py                # Ponto de entrada
├── README.md              # Documentação principal
├── requirements.txt       # Dependências (Python)
├── .gitignore
└── LICENSE
```

---

## 🎯 CHECKLIST PRÉ-ENTREGA

- [ ] Todos os testes passando
- [ ] README atualizado
- [ ] .gitignore configurado
- [ ] Código sem prints de debug
- [ ] Tratamento de erros implementado
- [ ] Interface intuitiva
- [ ] Commit message preparada

---

# INÍCIO DO PROJETO

[Descreva sua ideia aqui e vamos começar!]
```

---

## 📝 Como Usar

1. **Copie o prompt acima** no início de uma nova conversa com IA
2. **Substitua** `[Descreva brevemente a ideia do projeto aqui]` pela sua ideia de back-end/API
3. **A stack já está definida** — a IA priorizará Python/Django ou TypeScript (C# só em último caso)
4. **Inicie a conversa** e siga o fluxo iterativo

---

## 💡 Exemplo de Uso

```markdown
# CONTEXTO DO PROJETO
Quero criar um sistema de backup automático que:
- Monitore pastas específicas
- Faça backup incremental para a nuvem
- Notifique quando o backup completar
- Tenha interface de linha de comando

Linguagem: Python
Nuvem: Google Drive ou Dropbox

[... resto do prompt base ...]