# 🤖 IA.MD — Registro de Contexto para Modelos de IA

> **Propósito**: Este arquivo é um **caderno de anotações técnico para IAs**. Ele existe para que qualquer modelo de IA (ou troca de modelo durante o desenvolvimento) consiga recuperar o contexto do projeto sem precisar reler todo o código ou histórico de conversas.
>
> **Público-alvo**: Exclusivamente modelos de IA. O conteúdo pode (e deve) ser técnico, direto e específico — não precisa ser legível para humanos.
>
> **Regra fundamental**: Todo contexto relevante deve estar **neste único arquivo**. Não espalhe informações em vários lugares. A IA deve conseguir ler apenas este arquivo e entender o estado atual do projeto.

---

## 📋 INSTRUÇÕES PARA A IA

### Quando registrar

Você **DEVE** atualizar este arquivo sempre que:

1. **Decisão técnica for tomada** — escolha de lib, padrão, arquitetura, estrutura de banco
2. **Stack for definida ou alterada** — linguagem, framework, dependências
3. **Teste importante passar ou falhar** — testes que validam comportamento crítico
4. **Design/arquitetura mudar** — refatorações, mudança de padrão, novo módulo
5. **Bug significativo for resolvido** — causa raiz e fix aplicado
6. **Meta ou objetivo mudar** — pivôs, mudanças de escopo, prioridades
7. **Convenção for estabelecida** — naming, estrutura de pastas, padrão de commit
8. **Integração externa for configurada** — APIs, serviços, credenciais (sem expor secrets)
9. **Milestone for atingida** — feature completa, release, deploy
10. **Chain of thought relevante** — registre o raciocínio por trás de decisões complexas, passos de debug e caminhos explorados

### Por que registrar chain of thought?

Modelos de IA podem **alucinar ou se confundir** durante raciocínios longos. Registrar o passo-a-passo do pensamento permite:

- **Identificar onde o erro começou** — se o resultado final estiver errado, dá pra rastrear qual passo do raciocínio divergiu
- **Evitar loops** — se a IA já tentou um caminho e falhou, o registro impede que tente de novo
- **Retomar com outro modelo** — um modelo diferente consegue ler o raciocínio anterior e continuar de onde parou
- **Auditar alucinações** — comparação entre o raciocínio registrado e o código gerado revela inconsistências

### Como registrar

- Seja **técnico e específico** — ex: "Migrado de `express` para `fastify` por performance em rotas async"
- Use **timestamps** — formato `[YYYY-MM-DD]`
- Registre o **porquê**, não só o quê — decisões sem justificativa perdem valor
- Mantenha cada entrada **curta** — 1-3 linhas por item
- Use as seções abaixo — não crie seções novas sem necessidade

---

## 🎯 OBJETIVO DO PROJETO

<!-- 
  Descreva aqui o objetivo principal do projeto em 2-3 frases.
  Atualize se o escopo mudar.
  Exemplo:
  [2026-03-11] API REST para gerenciamento de tarefas com autenticação JWT.
  Público: uso pessoal. Deploy: VPS própria. Prioridade: simplicidade > escalabilidade.
-->

_Preencher no início do projeto._

---

## 🏁 METAS & MILESTONES

<!-- 
  Liste as metas do projeto e marque conforme forem atingidas.
  Formato: [DATA] STATUS - Descrição
  STATUS: ⬜ pendente | 🔄 em progresso | ✅ concluída | ❌ cancelada
-->

_Preencher conforme o projeto avança._

---

## 🛠️ STACK & DEPENDÊNCIAS

<!-- 
  Registre a stack completa e dependências instaladas.
  Atualize quando adicionar/remover/trocar qualquer tecnologia.
  Exemplo:
  [2026-03-11] Back-end: Python 3.12 + Django 5.1 + DRF 3.15
  [2026-03-11] DB: PostgreSQL 16 via Docker
  [2026-03-12] Adicionado django-cors-headers para CORS em dev
-->

_Preencher no setup do projeto._

---

## 📐 DECISÕES DE ARQUITETURA

<!-- 
  Registre decisões estruturais e o motivo de cada uma.
  Exemplo:
  [2026-03-11] Monolito Django ao invés de microserviços — projeto pequeno, não justifica a complexidade.
  [2026-03-11] Pasta `services/` para lógica de negócio separada das views — facilita testes unitários.
  [2026-03-12] JWT via `djangorestframework-simplejwt` ao invés de sessão — API stateless para consumo mobile futuro.
-->

_Preencher ao tomar decisões._

---

## 🎨 DECISÕES DE DESIGN & CONVENÇÕES

<!-- 
  Padrões de código, naming, estrutura que foram definidos.
  Exemplo:
  [2026-03-11] Nomes de variáveis e funções em inglês, comentários em português.
  [2026-03-11] Commits seguem Conventional Commits: feat/fix/docs/refactor.
  [2026-03-11] Respostas da API sempre em formato { "data": ..., "error": ... }.
-->

_Preencher conforme convenções forem definidas._

---

## 🧪 TESTES IMPORTANTES

<!-- 
  Registre testes que validam comportamento crítico.
  Inclua o que o teste cobre e se passou/falhou.
  Exemplo:
  [2026-03-12] ✅ test_auth_login — Login com credenciais válidas retorna token JWT.
  [2026-03-12] ✅ test_auth_login_invalid — Credenciais inválidas retorna 401.
  [2026-03-13] ❌ test_upload_large_file — Timeout em arquivos >50MB. Fix pendente: aumentar TIMEOUT no nginx.
-->

_Preencher ao rodar testes._

---

## 🐛 BUGS & FIXES RELEVANTES

<!-- 
  Bugs significativos e como foram resolvidos.
  Exemplo:
  [2026-03-13] BUG: CORS bloqueando requests do frontend em produção.
  CAUSA: `ALLOWED_ORIGINS` não incluía domínio com www.
  FIX: Adicionado `https://www.dominio.com` em settings.py L45.
-->

_Preencher ao resolver bugs._

---

## 🔗 INTEGRAÇÕES & SERVIÇOS EXTERNOS

<!-- 
  APIs, serviços e integrações configuradas.
  NÃO registre secrets/tokens aqui — apenas o serviço e como está configurado.
  Exemplo:
  [2026-03-14] Stripe API — checkout de pagamento. Webhook configurado em /api/webhooks/stripe.
  [2026-03-14] SendGrid — envio de emails transacionais. Template ID: d-abc123.
-->

_Preencher conforme integrações forem adicionadas._

---

## 📝 NOTAS GERAIS

<!-- 
  Qualquer informação que não se encaixe nas seções acima
  mas que seria útil para outra IA retomar o contexto.
  Exemplo:
  [2026-03-11] O cliente pediu para não usar Docker em produção — deploy direto na VPS.
  [2026-03-15] Performance: endpoint /api/reports leva ~3s. Otimizar se virar problema.
-->

_Preencher quando necessário._

---

## 🧠 CHAIN OF THOUGHT

<!-- 
  Registre aqui o raciocínio detalhado em decisões complexas, debug difícil
  ou qualquer situação onde o passo-a-passo do pensamento importa.
  Isso serve para rastrear alucinações e erros de lógica.
  
  Formato:
  [YYYY-MM-DD] CONTEXTO: <o que estava tentando fazer>
  PENSAMENTO: <passo 1 do raciocínio>
  PENSAMENTO: <passo 2>
  RESULTADO: <o que aconteceu / conclusão>
  
  Exemplo:
  [2026-03-13] CONTEXTO: Endpoint /api/users retornando 500 em produção.
  PENSAMENTO: Logs mostram `KeyError: 'email'` em serializer.py L32.
  PENSAMENTO: O campo `email` existe no model. Verifiquei — o request body do frontend envia `user_email` ao invés de `email`.
  PENSAMENTO: Duas opções: renomear no frontend ou aceitar ambos no serializer. Optei por aceitar ambos via `source='email'`.
  RESULTADO: Fix aplicado. Manter compat retroativa — frontend será atualizado depois.
  
  [2026-03-14] CONTEXTO: Tentando implementar cache com Redis para /api/reports.
  PENSAMENTO: Primeiro tentei django-cacheops — configurei mas não funcionou com queries complexas (aggregations).
  PENSAMENTO: Tentei cache manual com redis-py direto — funcionou mas código ficou verbose.
  PENSAMENTO: Voltei para django cache framework com backend Redis — mais simples, cobre o caso.
  RESULTADO: Usando `django.core.cache` com `django-redis`. Cache de 5min em endpoints pesados.
-->

_Preencher durante debug complexo ou decisões que envolvam múltiplos caminhos._
