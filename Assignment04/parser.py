# parser.py - Recursive descent parser for shell commands with variables

# EBNF Grammar:
# <command> ::= <simple_command> | <set_command> | <echo_command>
# <simple_command> ::= "ls" [<folder>] | "cd" <folder> | "cat" <filename> | "print" <filename> | "exec" <filename> | <command> <variable>
# <set_command> ::= "SET" <variable> "=" <expr>
# <echo_command> ::= "echo" <variable>
# <expr> ::= <term> { ("+" | "-") <term> }
# <term> ::= <factor> { ("*" | "/") <factor> }
# <factor> ::= <number> | <variable> | "(" <expr> ")"
# <variable> ::= "$" <identifier>
# <identifier> ::= <letter> { <letter> | <digit> }
# <folder> ::= <identifier>
# <filename> ::= <identifier> "." <identifier>
# <number> ::= <digit> { <digit> }
# <letter> ::= "A".."Z" | "a".."z"
# <digit> ::= "0".."9"

from tokenizer import tokenize

symbol_table = {}

def parse(tokens):
    if not tokens:
        return

    token_type, token_value = tokens[0]

    if token_value == "SET":
        parse_set(tokens)
    elif token_value == "echo":
        parse_echo(tokens)
    else:
        parse_command(tokens)

    print("Symbol Table:", symbol_table)

def parse_set(tokens):
    if len(tokens) < 4:
        print("Syntax error in SET command")
        return
    var_token = tokens[1]
    if var_token[0] != "VARIABLE":
        print("Expected variable after SET")
        return
    if tokens[2][1] != "=":
        print("Expected '=' after variable")
        return
    expr_tokens = tokens[3:]
    expr_str = " ".join([t[1] for t in expr_tokens])
    symbol_table[var_token[1]] = expr_str
    print(f"Set {var_token[1]} = {expr_str}")

def parse_echo(tokens):
    if len(tokens) != 2 or tokens[1][0] != "VARIABLE":
        print("Syntax error in echo command")
        return
    var_name = tokens[1][1]
    value = symbol_table.get(var_name, "<undefined>")
    print(f"{var_name} = {value}")

def parse_command(tokens):
    print("Parsed simple command:", " ".join([t[1] for t in tokens]))

if __name__ == "__main__":
    test_inputs = [
        "SET $x = 5 + 3",
        "echo $x",
        "ls",
        "cd root",
        "cat notes.txt"
    ]
    for line in test_inputs:
        print("\nInput:", line)
        tokens = tokenize(line)
        parse(tokens)