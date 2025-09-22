# CS414 Shell Parser

This repository contains a simple **shell command parser** project for CS414.

## Files

- `grammar.ebnf` - EBNF grammar for commands like `ls`, `cd`, `cat`, `print`, `exec`.
- `tokenizer.py` - Python tokenizer that converts input strings into tokens.
- `parser.py` - Recursive descent parser that produces a small AST from tokens.

## Example

```bash
ls docs => {'cmd': 'ls', 'arg': 'docs'}
cat notes.txt => {'cmd': 'cat', 'file': 'notes.txt'}
# CS414 Homework - Shell Command Parser

This is my homework project for CS414. The goal was to write a simple parser for a fake little "shell" that supports commands like `ls`, `cd`, `cat`, `print`, and `exec`.

## What’s included

- `grammar.ebnf` → the EBNF grammar I wrote for the commands  
- `tokenizer.py` → a basic tokenizer (just splits input and tags it as COMMAND, FILENAME, etc.)  
- `parser.py` → recursive descent parser that checks the grammar and builds a small AST (basically just a dict in Python)  

## How it works

1. You type a command like `ls docs` or `cat notes.txt`.  
2. The tokenizer breaks it into tokens like `[("COMMAND", "ls"), ("FOLDER", "docs")]`.  
3. The parser reads the tokens and makes a little AST.  

Example runs:
ls docs
=> {'cmd': 'ls', 'arg': 'docs'}

cat notes.txt
=> {'cmd': 'cat', 'file': 'notes.txt'}

That’s pretty much it — nothing fancy, just enough to follow the assignment.
