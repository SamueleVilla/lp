# functions.jl

println("-"^10)
println("Functions")

# basic syntax
function f(x, y)
  x + y
end

# single line syntax
Σ(x, y) = x + y
# function call
res = Σ(2, 3)

println(res)

function f(x, y)
  x[1] = 42    # mutates x
  y = 7 + y    # new binding for y, no mutation
  return y
end

fib(n::Integer) = n <= 2 ? 1 : fib(n - 1) + fib(n - 2)
println("fib(5) = $(fib(5))")

println("-"^10)
println("Tuples")

# Tuples
x = (1, 2, 3)
println(x)

x = (a=2, b=3)
println(x)

(a, b, c) = 1:3
println("$a , $b, $c")

function add_and_mult(a, b)
  a + b, a * b
end
println("a&m = $(add_and_mult(5, 5))")

minmax(x, y) = (y < x) ? (y, x) : (x, y)
gap((min, max)) = max - min
println("gap = $(gap(minmax(10, 2)))")