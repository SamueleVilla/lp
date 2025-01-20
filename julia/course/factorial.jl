# factorial.jl

function factorial(n)
	if n == 0
		1
	else
		n * factorial(n - 1)
	end
end


println("1! = $(factorial(1))")
println("5! = $(factorial(5))")
println("10! = $(factorial(10))")
