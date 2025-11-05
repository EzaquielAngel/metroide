# Guia de Desenvolvimento de Jogos com GameMaker

Este documento apresenta princípios fundamentais para desenvolver jogos, aplicados especialmente ao **GameMaker**, além de um **guia básico de Git e GitHub** para versionar e organizar seu projeto.

---

## 1. Conceito e Planejamento

- **Defina a visão do jogo**: qual o gênero (plataforma, shooter, puzzle, narrativa, etc.) e qual experiência o jogador deve sentir.  
- **Comece pequeno**: um jogo curto, mas completo, é melhor do que um projeto gigante inacabado.  
- **Crie um documento de design (GDD)** com:
  - História ou tema
  - Mecânicas principais
  - Controles e objetivos
  - Arte e trilha sonora planejadas
- Faça **protótipos rápidos** no GameMaker usando *sprites* e *rooms* simples para testar ideias antes de investir tempo em arte final.

---

## 2. Estrutura no GameMaker

- **Rooms**: cada fase, menu ou tela do jogo.  
- **Objects**: são os elementos que contêm lógica — personagem, inimigo, item, etc.  
- **Sprites**: as imagens animadas dos objetos.  
- **Events**: controlam o comportamento (Step, Collision, Create, Draw...).  
- **Scripts e funções**: permitem separar lógica e reaproveitar código.

> Dica: nomeie tudo de forma clara. Exemplo:
> - `obj_player`
> - `spr_enemy_idle`
> - `scr_calcular_dano`

Mantenha a pasta do projeto organizada — isso ajuda tanto no desenvolvimento quanto no versionamento com Git.

---

## 3. Mecânica e Jogo

- Foque na **mecânica central**: o que o jogador faz 80% do tempo.  
- Adicione pequenas **camadas de complexidade** ao redor da ideia principal.  
- Teste a **resposta dos controles** — input e física devem ser suaves e consistentes.  
- Sempre que possível, adicione **feedback visual e sonoro** para ações do jogador.

---

## 4. Arte e Áudio

- Mesmo *placeholders* simples ajudam a visualizar o fluxo do jogo.  
- Use cores e estilos coerentes com o clima do jogo.  
- Otimize os sprites: resoluções muito altas ou muitos frames podem impactar performance.  
- Mantenha a trilha e efeitos sonoros leves, bem ajustados em volume e looping.

---

## 5. Testes e Iteração

- **Prototipe** rapidamente com novas ideias e descarte o que não funciona.  
- Faça **testes com jogadores** — observe onde eles se divertem e onde se frustram.  
- **Registre feedbacks** (inclusive bugs) e priorize correções.  
- Melhore gradualmente, sem tentar “perfeição” logo no início.

---

## 6. Publicação e Manutenção

- Gere builds estáveis (Windows, Android, HTML5) direto do GameMaker.  
- Crie uma pasta separada para **versões exportadas**.  
- Anote as **mudanças por versão** em um arquivo `CHANGELOG.md`.  
- Após o lançamento, corrija bugs e avalie possíveis atualizações com base no retorno dos jogadores.

---

## 7. Usando Git e GitHub no Projeto

### O que é Git?

Git é um sistema de **controle de versão**. Ele permite salvar e acompanhar mudanças do seu projeto, voltar versões antigas e trabalhar em equipe sem sobrescrever arquivos.

### Configuração inicial

1. Instale o Git: [https://git-scm.com](https://git-scm.com)
2. No diretório do seu jogo (onde está o `.yyp`):
   ```bash
   git init
   git add .
   git commit -m "Primeiro commit do projeto GameMaker"


## Recursos de Orientação e Aprendizagem

### Roadmap de Desenvolvedor de Jogos  
O site [Roadmap.sh](https://roadmap.sh/game-developer) apresenta um **roadmap detalhado para se tornar um desenvolvedor de jogos em 2025**.
Esse roadmap funciona como um guia visual e incremental: ele lista as áreas de conhecimento, ferramentas e tecnologias que alguém trabalhando com jogos pode estudar — desde fundamentos até níveis mais avançados.  

---

### A Lista “Awesome” de Recursos  
O repositório [awesome](https://github.com/sindresorhus/awesome?tab=readme-ov-file#front-end-development) mantido por Sindre Sorhus é uma **coleção enorme de listas de links para recursos de programação, design, ferramentas, frameworks, aprendizado**.
No contexto de desenvolvimento de jogos, essa lista inclui desde categorias como *Game Development*, *Game-Engine Development*, *Gaming*, até listas de frameworks, tutoriais, ativos, design de áudio e muito mais.
