# Question 3: Grammar and Parse Trees

Grammar:


---

## Parse Trees

### (a+(b*C)/2)

- Outer: `( Expr )`
- Inside: `Expr → Expr + Term`
  - Left: identifier `a`
  - Right: `Term / Factor`
    - `Term` is `(b*C)`
    - `Factor` is number `2`

---

### a*(3+b)*4

- Left associative multiplication:
  - First `a * (3+b)`
  - Then result `* 4`
- `(3+b)` is an `Expr` inside parentheses.

---

### 42*c+3*(a+b)

- Top: `Expr → Expr + Term`
- Left side: `42 * c`
- Right side: `3 * (a+b)`
