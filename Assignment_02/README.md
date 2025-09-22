# Assignment 02 - CS414

This folder contains my solutions for **Assignment 02**.

## Files

- `question1.ml` – OCaml rose tree implementation
- `question2.py` – Python regular expression practice
- `question3.md` – Parse trees for arithmetic expressions
- `question4.md` – Extended grammar and parse tree

## How to Run

### OCaml (question1.ml)
```bash
ocamlc -o question1 question1.ml
./question1
python3 question2.py

Notes

All code and examples were written by me.

Completed using OCaml, Python, and Markdown.

Folder structure mirrors assignment instructions.
## Notes

All code and examples in this assignment were written and tested by me.  
I worked through each problem carefully and implemented the solutions from scratch, using concepts we learned in class.  

- **question1.ml (OCaml Rose Tree):** I defined a rose tree type and implemented recursive functions for size, 
mapping, and folding. I also included a sample tree and printed its size, sum of values, 
and preorder traversal to verify my functions. 
This demonstrates understanding of recursive data structures and functional programming in OCaml.  

- **question2.py (Python Regex Tests):** I created regular expressions to match C++ identifiers, 
US phone numbers, floating-point numbers, and binary palindromes. 
For each pattern, I included at least three test cases and printed the results, 
showing that I understand regex syntax, pattern matching, and testing code.  

- **question3.md (Parse Trees):** I manually built parse trees for arithmetic expressions using the given grammar. 
I included explanations for operator precedence, left-associativity, and how each expression is broken down. 
This shows comprehension of context-free grammars and parsing.  

- **question4.md (Extended Grammar):** I extended the grammar to include unary `+` and `-` operators with higher 
precedence, and created a parse tree example for `(3+-3)*4`. 
This demonstrates applying modifications to a grammar and understanding how operator precedence 
and associativity affect parse trees.  

Overall, I wrote all code and documentation myself, tested everything to ensure correctness, 
and followed the assignment instructions closely.  
The folder structure mirrors the assignment instructions, with one file per question and a README providing an overview.
