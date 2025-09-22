# Question 2: Regular Expressions
import re

# 1. C++ Identifiers
cpp_identifier = r"^[A-Za-z_][A-Za-z0-9_]*$"
print("C++ Identifier Tests:")
for t in ["variable1", "_hidden", "2fast"]:
    print(t, "->", bool(re.match(cpp_identifier, t)))
print()

# 2. US Phone Numbers
us_phone = r"^(\(\d{3}\)\s|\d{3}-)\d{3}-\d{4}$"
print("Phone Number Tests:")
for t in ["(123) 456-7890", "987-654-3210", "1234567890"]:
    print(t, "->", bool(re.match(us_phone, t)))
print()

# 3. Floating Point Numbers
float_number = r"^[+-]?(\d+(\.\d*)?|\.\d+)$"
print("Float Tests:")
for t in ["3.14", "-0.5", "+10"]:
    print(t, "->", bool(re.match(float_number, t)))
print()

# 4. Binary palindromes (length 3 or 4)
binary_palindrome = r"^(0|1)(0|1)\2\1?$"
print("Binary Palindrome Tests:")
for t in ["101", "0110", "1001"]:
    print(t, "->", bool(re.match(binary_palindrome, t)))
