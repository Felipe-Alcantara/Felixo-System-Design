# Instrucoes para agentes

## Git e branches

- **Trabalhe direto no `main` por padrao.** Nao crie branches desnecessarias.
- **So crie uma branch nova quando** a mudanca for:
  - uma **feature nova** que altera comportamento e **precisa ser testada** antes de entrar no `main`, ou
  - algo de **alto risco** (pode quebrar algo existente).
- Fora esses casos (correcoes simples, docs, ajustes pequenos, refactors seguros), **commite no `main`** sem criar branch.
- Evite o vicio de abrir uma branch nova para cada implementacao. Varios agentes
  (em especial o CODEX) tendem a criar branches demais — nao siga esse padrao aqui.
