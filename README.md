# Relatório A3 – Estruturas Matemáticas em Sistemas Distribuídos e Mobile

## Apresentação da Equipe

| Nome Completo                       |     RA     |
| :---------------------------------- | :--------: |
| **Alisson Lucas Alves de Oliveira** | 1272322139 |
| **Alisson Bezerra Brito**    |  1272326397 |

---

## Situação Problema e Solução Aplicada

### Situação Problema: Análise de Tendência do Mercado de Ações

Escolhemos o tema **Análise de Tendências do Mercado de Ações**, usando um modelo simplificado de **Cadeias de Markov** para ver a probabilidade do mercado transitar entre três estados possíveis ao longo de um determinado número de dias.

#### Estados (Variáveis de Estado)

O mercado pode estar em um dos seguintes estados:

1. **Alta (A):** O valor médio das ações subiu.
2. **Estável (E):** O valor médio das ações manteve-se.
3. **Baixa (B):** O valor médio das ações caiu.

#### Matriz de Transição (P)

A **matriz de transição** representa a probabilidade de mover-se de um estado para outro em **um dia** (um passo):

$$P = \begin{pmatrix}
P_{A \to A} & P_{A \to E} & P_{A \to B} \\
P_{E \to A} & P_{E \to E} & P_{E \to B} \\
P_{B \to A} & P_{B \to E} & P_{B \to B}
\end{pmatrix}$$

**Exemplo Numérico Utilizado:**

$$P = \begin{pmatrix}
0.5 & 0.3 & 0.2 \\
0.4 & 0.4 & 0.2 \\
0.3 & 0.3 & 0.4
\end{pmatrix}$$

---

### Solução Aplicada: Resolvedor em Julia

Implementamos uma aplicação modular em **Julia**, capaz de:

1. Validar a **matriz de transição**.
2. Calcular a matriz elevada a (n) passos ((P^n)).
3. Retornar a **probabilidade de transição entre dois estados específicos**.

#### Exemplo Manual: $P(\text{Baixa} \to \text{Alta})$ em 2 dias

A probabilidade de transição em $n$ passos é calculada como $P^n = P \cdot P \cdot \dots \cdot P$ ($n$ vezes).

Para 2 dias:

$$P^2 = P \cdot P = \begin{pmatrix}
0.5 & 0.3 & 0.2 \\
0.4 & 0.4 & 0.2 \\
0.3 & 0.3 & 0.4
\end{pmatrix}
\cdot
\begin{pmatrix}
0.5 & 0.3 & 0.2 \\
0.4 & 0.4 & 0.2 \\
0.3 & 0.3 & 0.4
\end{pmatrix}$$

O elemento da linha **Baixa (3ª linha)** e coluna **Alta (1ª coluna)** é:

$$P^2_{3,1} = (0.3 \times 0.5) + (0.3 \times 0.4) + (0.4 \times 0.3) = 0.39$$

O resolvedor em Julia retorna o mesmo resultado automaticamente.

---

## Estrutura do Código-Fonte

O projeto está dividido em três arquivos:

1. **`UtilModel.jl`** – Funções auxiliares: validação da matriz e cálculo de $P^n$.
2. **`MarkovModel.jl`** – Função principal para calcular probabilidades, convertendo nomes de estados em índices.
3. **`main.jl`** – Exemplo de execução usando o Mercado de Ações e chamando `calcular_probabilidade`.

> O código completo de cada arquivo está anexado ao relatório.

---

## Instruções de Instalação e Execução

### Pré-requisitos

* Instalar a linguagem **Julia (v1.x ou superior)** no seu sistema operacional.
* Julia é gratuita e pode ser baixada em [https://julialang.org/downloads/](https://julialang.org/downloads/).

### Execução

1. Salve os arquivos (`main.jl`, `UtilModel.jl`, `MarkovModel.jl`) no **mesmo diretório**.
2. Abra o terminal e navegue até o diretório dos arquivos.
3. Execute o programa:

```bash
julia main.jl
```

### Saída Esperada

O console exibirá a **validação da matriz** e o cálculo das probabilidades, correspondendo aos resultados manuais apresentados.

