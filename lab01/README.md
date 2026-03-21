# Analisador Léxico

Este projeto implementa um analisador léxico para a linguagem ANSI C utilizando a ferramenta Flex (Fast Lexical Analyzer). O programa identifica tokens, constantes, identificadores e palavras-chave, gerando uma saída formatada conforme as especificações do laboratório.

##  Pré-requisitos
- GCC (Compilador C)
- Flex (Gerador de Analisador Léxico)


Para instalar as dependências, execute:

```bash
sudo apt update && sudo apt install build-essential flex -y
```

## Como compilar

O processo de compilação transforma o arquivo de regras do Flex (.l) em um executável binário:

1. Gere o código-fonte em C a partir das regras do Flex:

```bash
flex scanner.l
```

2. Compile o arquivo gerado (lex.yy.c) com o GCC:

```bash
gcc lex.yy.c -o meu_compilador
```

## Como usar

Para analisar um arquivo de código fonte em C _(ex: amostra.c)_, execute o binário passando o caminho do arquivo como argumento:

```bash
./meu_compilador amostra.c
```

### Gerando um arquivo de saída

Para salvar a saída da análise em um arquivo de texto:

```bash
./meu_compilador amostra.c > resposta.txt
```

## Classes de Tokens Identificadas

O analisador categoriza o código fonte nas seguintes classes:

| Classe | Descrição | Exemplos |
| :--- | :--- | :--- |
| **KEYWORD** | Palavras reservadas da linguagem ANSI C | `int`, `if`, `else`, `return` |
| **ID** | Identificadores de variáveis, funções e structs | `main`, `ponto_t`, `res` |
| **NUM_INT** | Números inteiros (base 10) | `0`, `10`, `123` |
| **NUM_DEC** | Números de ponto flutuante e notação científica | `1.01`, `.25e-13`, `1.e2` |
| **STRING** | Cadeias de caracteres entre aspas duplas | `"Estranho, ne?\n"` |
| **OP_...** | Operadores (Aritméticos, Lógicos, Atribuição) | `+`, `==`, `&&`, `+=` |
| **PUNCT** | Símbolos de pontuação e delimitadores | `;`, `,`, `(`, `{`, `[` |