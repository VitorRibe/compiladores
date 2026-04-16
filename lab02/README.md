# Lab 02 — Analisador Sintático (LALR)

Este laboratório compreende a segunda fase do compilador, onde a sequência de tokens gerada na fase anterior é validada estruturalmente através de uma gramática **LALR(1)**. O objetivo é garantir que o código fonte siga as regras sintáticas da linguagem ANSI C.

## 🎯 Objetivos
- Definição de uma gramática livre de contexto para ANSI C.
- Geração de tabelas de transição LR/LALR via *jsmachines*.
- Integração do analisador léxico (Flex) com o motor de parsing sintático.
- Resolução de precedência de operadores diretamente na gramática.

---

## 📂 Arquivos do Projeto

| Arquivo | Função |
| :--- | :--- |
| [**gramatica.conf**](./gramatica.conf) | Definição das regras de produção da linguagem. |
| [**tabela_lr1.conf**](./tabela_lr1.conf) | Tabela de estados e ações gerada para o parser. |
| [**amostra-correcao2.c**](./amostra-correcao2.c) | Código fonte em C utilizado para os testes de validação. |
| [**saida**](./saida) | Log completo da execução (Shift/Reduce) e validação final. |
| **scanner.l** | Analisador léxico atualizado para tokens individuais. |

---

## 🚀 Processo de Execução

O fluxo de execução depende da interação entre o analisador léxico e o motor fornecido pelo professor:

### 1. Geração dos Tokens (Léxico)
O léxico deve gerar uma lista de classes de tokens onde cada símbolo é identificado individualmente para que o sintático processe a precedência:
```bash
flex scanner.l
gcc lex.yy.c -o meu_compilador
./meu_compilador amostra-correcao2.c > saida_fase1.txt
echo '$$' >> saida_fase1.txt
```

### 2. Validação Sintática
```bash
# Compilação do motor
g++ parserLR/src/*.cpp -o parserLR/bin/parserLR

# Execução do Parsing
./parserLR/bin/parserLR < saida_fase1.txt > saida 2>&1
```
