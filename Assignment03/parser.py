# parser.py - recursive descent parser for shell commands

from tokenizer import tokenize

class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def peek(self):
        return self.tokens[self.pos] if self.pos < len(self.tokens) else None

    def eat(self, kind=None):
        tok = self.peek()
        if tok is None:
            raise SyntaxError("Unexpected end of input")
        if kind and tok[0] != kind:
            raise SyntaxError(f"Expected {kind}, got {tok}")
        self.pos += 1
        return tok

    def parse(self):
        tok = self.peek()
        if tok is None:
            raise SyntaxError("Empty input")
        cmd = tok[1]
        if cmd == "ls":
            return self.parse_ls()
        elif cmd == "cd":
            return self.parse_cd()
        elif cmd == "cat":
            return self.parse_cat()
        elif cmd == "print":
            return self.parse_print()
        elif cmd == "exec":
            return self.parse_exec()
        else:
            raise SyntaxError(f"Unknown command: {tok}")

    def parse_ls(self):
        self.eat("COMMAND")
        if self.peek() and self.peek()[0] == "FOLDER":
            folder = self.eat("FOLDER")[1]
            return {"cmd": "ls", "arg": folder}
        return {"cmd": "ls", "arg": None}

    def parse_cd(self):
        self.eat("COMMAND")
        if self.peek() and self.peek()[0] == "FOLDER":
            folder = self.eat("FOLDER")[1]
            return {"cmd": "cd", "arg": folder}
        return {"cmd": "cd", "arg": "root"}

    def parse_cat(self):
        self.eat("COMMAND")
        fname = self.eat("FILENAME")[1]
        return {"cmd": "cat", "file": fname}

    def parse_print(self):
        self.eat("COMMAND")
        fname = self.eat("FILENAME")[1]
        return {"cmd": "print", "file": fname}

    def parse_exec(self):
        self.eat("COMMAND")
        fname = self.eat("FILENAME")[1]
        return {"cmd": "exec", "file": fname}


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
        toks = tokenize(c)
        p = Parser(toks)
        ast = p.parse()
        print(c, "=>", ast)
