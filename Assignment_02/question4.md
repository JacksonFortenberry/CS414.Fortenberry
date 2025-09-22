# Question 4: Extending the Grammar

We add unary `+` and `-` operators at the highest precedence:


---

## Example: (3+-3)*4

1. Top-level: `Expr → Term`.
2. `Term → Term * Factor`.
   - Left `Term` is `(3+-3)`.
   - Right `Factor` is number `4`.
3. Inside `(3+-3)`:
   - `Expr → Expr + Term`
   - Left side: `3`
   - Right side: `-3` parsed as `Unary → - Unary → number`

Final structure: **((3 + (-3)) * 4)**
