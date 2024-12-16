### fatt.jl

"""
fatt(n)

Returns the factorial of n.
"""
function fatt(n)
    if n == 0
        1
    else
        n * fatt(n - 1)
    end
end

"""
fattacc(n, acc = 1)

Returns the factorial of n (iterative)
"""
function fattacc(n, acc = 1)
    if n == 0
        acc
    else
        fattacc(n - 1, n * acc)
    end
end

"""
fattk(n, cont = identity)

Calls the continuation cont on the result of the factorial computation"
"""
function fattk(n, cont = identity)
    if n == 0
        cont(1)
    else
        fattk(n - 1, acc -> cont(n * acc))
    end
end

"""
fattke
"""
function fattke(n, cont = identity, ef = e -> error("Negative number"))
    if n < 0
        ef(1)
    elseif n == 0
        cont(1)
    else
        fattke(n - 1, acc -> cont(n * acc), ef)
    end
end
####  fatt.jl ends here
