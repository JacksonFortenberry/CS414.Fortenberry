# CS 414 Assignment 05 – Extended Shell Parser & Scope Contours

**Student:** Jackson  
**Course:** CS 414 – Programming Languages  
**Repo Folder:** `Assignment05/`

## Overview

This assignment extends the command-line shell parser to support shell variables and arithmetic expressions. I implemented a hand-built tokenizer and recursive descent parser in Python, following the TinyML examples and lecture notes. The parser recognizes commands like `SET $var = expr` and `echo $var`, and maintains a symbol table to track variable definitions.

I also included scope contour diagrams for the C++ examples in Question 3, showing how variables behave across function calls, blocks, and pointer usage.

## Files Included

- `tokenizer.py`: Tokenizes shell input into command, variable, operator, and filename tokens.
- `parser.py`: Parses shell commands using recursive descent. Includes symbol table output and EBNF grammar as comments.
- `test_cases.txt`: Sample input lines used to test the tokenizer and parser.
- `documents/contours.pdf`: Scope diagrams for all four C++ examples, including repeated pointer scope in (d).
- `README.md`: This file.

## How to Run

Run `parser.py` directly to test the parser:

```bash
python parser.py

All work in this assignment was done by me, Jackson.
I wrote the tokenizer, parser, grammar, and scope diagrams myself without using AI-generated code.
Everything reflects my own understanding and effort.
