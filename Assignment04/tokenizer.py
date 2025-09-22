# tokenizer.py - Tokenizer for shell commands with variables
import re

FILENAME_RE = re.compile(r"^[A-Za-z]{1,8}\.[A-Za-z]{3}$")
FOLDER_RE = re.compile(r"^[A-Za-z]{1,8}$")
VARIABLE_RE = re.compile(r"^\$[A-Za-z][A-Za-z0-9]*$")
NUMBER_RE = re.compile(r"^\d+$")

def tokenize(input_str):
    parts = input_str.strip().split()
    tokens = []
    for p in parts:
        if p in ["ls", "cd", "cat", "print", "exec", "SET", "echo"]:
            tokens.append(("COMMAND", p))
        elif p in ["=", "+", "-", "*", "/"]:
            tokens.append(("OPERATOR", p))
        elif VARIABLE_RE.match(p):
            tokens.append(("VARIABLE", p))
        elif NUMBER_RE.match(p):
            tokens.append(("NUMBER", p))
        elif FILENAME_RE.match(p):
            tokens.append(("FILENAME", p))
        elif FOLDER_RE.match(p):
            tokens.append(("FOLDER", p))
        else:
            tokens.append(("UNKNOWN", p))
    return tokens

if __name__ == "__main__":
    test_cmds = [
        "SET $x = 5 + 3",
        "echo $x",
        "ls docs",
        "cd root",
        "cat notes.txt",
        "exec prog.exe"
    ]
    for cmd in test_cmds:
        print(cmd, "=>", tokenize(cmd))