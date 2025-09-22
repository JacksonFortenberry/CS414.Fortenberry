# tokenizer.py - hand-built tokenizer for shell commands

import re

FILENAME_RE = re.compile(r"^[A-Za-z]{1,8}\.[A-Za-z]{3}$")
FOLDER_RE   = re.compile(r"^[A-Za-z]{1,8}$")

def tokenize(input_str):
    parts = input_str.strip().split()
    tokens = []
    for p in parts:
        if p in ["ls", "cd", "cat", "print", "exec"]:
            tokens.append(("COMMAND", p))
        elif FILENAME_RE.match(p):
            tokens.append(("FILENAME", p))
        elif FOLDER_RE.match(p):
            tokens.append(("FOLDER", p))
        else:
            tokens.append(("UNKNOWN", p))
    return tokens

if __name__ == "__main__":
    cmds = [
        "ls",
        "ls docs",
        "cd root",
        "cat notes.txt",
        "print file.prn",
        "exec prog.exe"
    ]

    for c in cmds:
        print(c, "=>", tokenize(c))
