# polyscheme
School project in Scheme. Created a library of bin ops for polynomials.

Polynomials are expressed as lists written in reverse order.

For example, 4x^3+5x-2 => '(-2 5 0 4)

poly_add : takes two polynomials and adds them together.
poly_sub : subtracts the second polynomial from the first.
poly_mul : multiplies two polynomial and combines like terms.
poly_der : takes the derivative of a polynomial
poly_mod : performs long division and returns the remainder.

Also provided are several utility functions, some of which are used in the bin-ops.
