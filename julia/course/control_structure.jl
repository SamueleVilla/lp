# Julia has some interesting "control" structure
# 
# Essentially, they are special operators used in conjuction with function application

# do-syntax
# is useful to simplify the use of values by (anonymous) functions
#
# Examples

struct Person
	name::String
	age
end

adults = map([Person("Salvo Montalbano", 42),
						Person("Catarella", 42),
						Person("Livia Burlando", 15)]) do p
						if p.age >=	18
								"Adult"
						else
								"Under age"
						end
					end

println("sex = $adults")
