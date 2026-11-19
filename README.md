# Sistema Básico de Combate

Sistema de combate desenvolvido em **BYOND Dream Maker (DM)**, utilizando procedimentos para controlar ataques, calcular danos e aplicar efeitos de nocaute.

## Funcionalidades

- Ataques direcionais contra adversários.
- Identificação automática de alvos no quadrado à frente do personagem.
- Cálculo de dano baseado nos atributos de ataque e defesa.
- Aplicação automática de dano à vida do adversário.
- Controle de intervalo entre ataques.
- Sistema de nocaute quando a vida chega a zero.
- Mensagens de combate para os participantes.

## Atributos

O sistema utiliza os seguintes atributos:

| Atributo | Valor inicial | Função |
|---|---:|---|
| Vida | 100 | Quantidade de vida do personagem |
| Ataque | 10 | Influencia o dano causado |
| Defesa | 10 | Reduz o dano recebido |

## Fórmula de dano

O dano é calculado considerando a relação entre o ataque do agressor e a defesa do alvo.

**Redução proporcionada pela defesa:**

\[
R = \frac{DEF}{DEF + ATQ}
\]

**Dano final:**

\[
D = 5 + ATQ \times (1-R)
\]

O resultado é arredondado para um número inteiro, com dano mínimo de 1 ponto.

## Estrutura do código

O sistema possui três procedimentos principais:

- `Atacar()`: identifica um adversário à frente e inicia o ataque.
- `ReceberDano()`: calcula a redução pela defesa, aplica o dano e verifica o nocaute.
- `KnockOut()`: altera o estado do personagem para nocauteado.

O comando `Bater()` disponibiliza o ataque básico na categoria de combate.

## Tecnologias utilizadas

- BYOND
- Dream Maker (DM)

## Objetivo do projeto

Este projeto faz parte dos meus estudos de lógica de programação e desenvolvimento de jogos.

O objetivo é desenvolver sistemas independentes, praticando conceitos como manipulação de objetos, procedimentos, parâmetros, estruturas condicionais, cálculos matemáticos e controle de tempo.

## Autor

Desenvolvido durante meus estudos de programação com BYOND Dream Maker.
