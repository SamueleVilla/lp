# vectors_arrays_matrices.jl

# 'zeros' fuction is builtin
a = zeros(3)
b = zeros(3, 2, 2)

a[1] = 4

b[1, 1, 1] = 5

c = [1, 2, 3] # vertical concatentation
r = [1 2 3] # horizionatal concatenation

# Arrays can hold any value
s = [1 3.14 "Foo" 2.2]

println(a)
println(b)

println("Vertial concat: $c")
println("Horizontal concat: $r")

println("s = $s")

