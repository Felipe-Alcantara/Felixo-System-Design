# Git — Branches, Commits e Documentacao Viva

> **O que e**: A politica unica de git deste repositorio. Define como agentes (e pessoas) devem versionar mudancas: quando criar branch, como commitar e como manter a documentacao viva.
>
> **Quando usar**: Sempre que for **alterar este repositorio diretamente** (sem fork). Para contribuicoes externas via fork + Pull Request, veja [`CONTRIBUTING.md`](../CONTRIBUTING.md).
>
> **Por que existe**: Estas regras viviam apenas numa secao do README e os agentes nao as absorviam de forma consistente. Este documento e a fonte unica — o README e o [Guia Minimo de Qualidade](../core/GUIA_MINIMO_QUALIDADE.md) apenas resumem e apontam para ca.

> **Obrigatorio**: este guia nao e opcional nem "consulte se lembrar". Toda sessao ou rodada de trabalho neste repositorio — de qualquer agente — segue estas regras do primeiro ao ultimo commit. Nao ha excecao por preguica, pressa ou tarefa "pequena demais para seguir o padrao".

> Voltar ao [README](../README.md).

---

## 1. Resumo em uma frase

**Commite direto no `main`, em commits pequenos e descritivos, atualizando a documentacao no mesmo passo. So crie branch quando a mudanca for grande, arriscada ou precisar ser testada antes de entrar. Cada commit, branch e documento cobre um unico tema — nunca misture assuntos.**

---

## 2. Branches — o padrao e *nao* criar branch

A regra mais importante deste repositorio, e a que os agentes mais erram: **trabalhe direto no `main` por padrao.**

Muitos agentes tem o vicio de abrir uma branch nova para cada implementacao. **Aqui isso e considerado errado.** Branch nao e gratis: cada branch sem necessidade gera overhead de merge, fragmenta o historico e exige revisao que a mudanca nao pedia.

### Quando commitar direto no `main` (a maioria dos casos)

Commite direto, sem branch, quando a mudanca for:

- correcao simples de bug ou de texto;
- alteracao ou criacao de documentacao;
- ajuste pequeno e localizado;
- refatoracao segura (que **nao** altera comportamento observavel).

### Quando criar uma branch nova (excecao)

Crie branch **somente** quando a mudanca for uma das tres:

1. **Feature grande** — funcionalidade nova e substancial, com varios commits ate ficar utilizavel.
2. **Refatoracao significativa** — mexe em varios modulos distintos ou na estrutura do projeto, e voce quer poder revisar/reverter como um bloco.
3. **Alto risco** — altera comportamento e **precisa ser testado antes** de entrar no `main`, ou pode quebrar algo existente.

Em outras palavras: branch e reservada para mudanca **sensivel e estrutural**, que atravessa varios modulos ao mesmo tempo. Uma mudanca localizada — mesmo que grande em linhas de codigo — nao justifica branch se ficar contida num unico modulo ou responsabilidade.

> Regra pratica: se voce nao consegue dizer **qual** das tres justifica a branch, entao **nao** crie branch — commite no `main`.

### Nomes de branch (quando criar uma)

Use prefixo + descricao curta em kebab-case:

- `feat/` — nova funcionalidade. Ex.: `feat/instalador-powershell`
- `fix/` — correcao. Ex.: `fix/link-quebrado-instalacao`
- `refactor/` — refatoracao. Ex.: `refactor/separa-docs-por-responsabilidade`
- `docs/` — documentacao (quando, excepcionalmente, virar uma branch). Ex.: `docs/guia-git`

### Apos o merge: apague a branch

Branch tem vida curta: existe so para abrigar a mudanca ate ela entrar no `main`. **Assim que a branch for mesclada, apague-a** — local e remota. Branch ja mesclada que fica para tras polui a lista, confunde quem nao sabe se ainda esta em uso e mascara o que de fato esta em andamento.

```bash
git branch -d <branch>                 # apaga local (so se ja foi mesclada)
git push origin --delete <branch>      # apaga a remota
git fetch --prune                      # limpa referencias remotas que ja sumiram
```

Regra pratica: **uma branch viva = trabalho em andamento.** Se o trabalho ja entrou no `main`, a branch nao deveria mais existir.

---

## 3. Commits — pequenos, frequentes e descritivos

### Frequencia

- **Sempre commite apos uma adicao concluida.** Nao acumule varias mudancas soltas sem commitar.
- Cada commit deve ser uma unidade coesa: uma ideia, um motivo. Se voce precisa usar "e" varias vezes para descrever o commit, provavelmente sao dois commits.

### Mensagem

Mensagens seguem o formato **Conventional Commits**: `tipo: descricao no imperativo`.

Tipos usados neste repositorio:

| Tipo | Quando usar |
|------|-------------|
| `feat:` | Nova funcionalidade ou conteudo novo (guia, script, comando). |
| `fix:` | Correcao de bug, link quebrado, erro de conteudo. |
| `docs:` | Mudanca apenas em documentacao. |
| `refactor:` | Reorganizacao sem mudar comportamento observavel. |
| `chore:` | Manutencao (configuracao, dependencias, ajustes de repo). |

A descricao deve explicar **o que mudou e por que**, em linguagem geral e acessivel (o repositorio e open source — veja [`DESIGN_SYSTEM_README.md`](../core/DESIGN_SYSTEM_README.md), secao 3.5). Sem valores hardcoded, caminhos locais ou contexto privado na mensagem.

### Exemplos

| Evite | Prefira |
|-------|---------|
| `update` | `docs: corrige link quebrado em INSTALACAO` |
| `mudancas no readme` | `docs: separa README por responsabilidade em docs/` |
| `fix bug` | `fix: trata caminho com espacos no instalador cmd` |
| `feat: novo guia + ajustes no readme + fix de link` (3 coisas) | tres commits separados, um por mudanca |
| `wip` | (nao commite "wip" no `main`; termine a unidade ou use branch) |

---

## 4. Documentacao viva — parte do mesmo commit

Documentacao desatualizada conta como **trabalho incompleto**. Ao mudar comportamento, estrutura ou comandos, atualize **no mesmo commit** (ou na mesma sequencia coesa) os documentos afetados:

- [`README.md`](../README.md) — uso, setup e mapa do repositorio.
- documentos em [`docs/`](.) — cada um com **uma responsabilidade unica**.
- guias em [`guias/`](../guias/) afetados.
- o `IA.md` do projeto (contexto operacional, decisoes, proximos passos).

O `IA.md` deve ser preservado como **linha do tempo tecnica**. Quando uma decisao mudar, nao apague nem reescreva o registro antigo; acrescente uma nova entrada datada com contexto, motivo e validacao. O historico explica como o projeto chegou ao estado atual.

Se um tema de documentacao nao couber naturalmente nos arquivos existentes de `docs/`, crie um novo arquivo ali com responsabilidade unica — foi exatamente o caso deste documento de politica de git.

---

## 5. Separacao minima — nunca misture temas

O mesmo principio vale para commits, branches e documentacao: **separe pelo minimo possivel**. Cada unidade de trabalho cobre um unico tema, bloco ou topico. Nao junte, no mesmo commit/branch/arquivo, coisas que pertencem a responsabilidades diferentes — por exemplo:

- **Interno** — decisoes de implementacao, contexto operacional (`IA.md`), configuracao especifica do ambiente.
- **Publico** — o que quem usa ou contribui de fora enxerga (`README.md`, guias, `CONTRIBUTING.md`).
- **API/integracao** — contratos, endpoints e formatos usados por quem integra com o projeto (ex.: [`GUIA-INTEGRACAO-API-GITHUB.md`](../guias/integracao/GUIA-INTEGRACAO-API-GITHUB.md)).

Na pratica:

- Um commit que muda uma decisao interna e um commit que atualiza o README publico sao **dois commits**, mesmo que a motivacao seja a mesma.
- Um documento novo nasce num arquivo com **responsabilidade unica** (ja e a regra da secao 4) em vez de crescer dentro de um arquivo que trata de outro tema.
- Contribuicao externa (fork) segue o fluxo publico do [`CONTRIBUTING.md`](../CONTRIBUTING.md); mudanca interna direta neste repositorio segue este documento — os dois fluxos nao se misturam.

> Regra pratica: se a descricao do commit, branch ou documento precisa de "e" para juntar dois temas diferentes (interno + publico, ou publico + API), separe em duas unidades.

---

## 6. Checklist antes de commitar

- [ ] A mudanca vai para o `main`? (Se for criar branch, ela e feature grande, refatoracao significativa ou alto risco?)
- [ ] O commit e uma unidade coesa, com escopo claro, sem misturar interno + publico + API?
- [ ] A mensagem segue `tipo: descricao` e explica **o que** e **por que**?
- [ ] Nao ha segredo, token, caminho local ou contexto privado na mensagem nem nos arquivos.
- [ ] A documentacao afetada (README, `docs/`, guias, `IA.md`) foi atualizada no mesmo passo.
- [ ] O `IA.md` manteve registros anteriores e adicionou novas decisoes como entradas datadas.
- [ ] Se uma branch foi mesclada, ela foi apagada (local e remota) — nenhuma branch ja mesclada ficou para tras.

---

## 7. Contribuicao externa (via fork)

Tudo acima vale para quem trabalha **direto neste repositorio**. Quem contribui **de fora** segue o fluxo de fork + branch + Pull Request descrito em [`CONTRIBUTING.md`](../CONTRIBUTING.md), onde criar branch e parte natural do processo.
