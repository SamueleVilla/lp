# Julia has composite types: 
# the way to introduce a composite type in the system is to use struct,# which will also create a "constructor"

struct Person
	name::String # The field "name" is a "String"
	age
end

p = Person("Salvo Montalbano", 42) # Creates a "Person"

println("p.name is $(p.name)") # Usual "." notation to access fields.
println("typeof(p) is $(typeof(p))") # "typeof" is a built-in function

# Structs can be used in arrays
people = [Person("Salvo Montalbano", 42), Person("Catarella", 42)]
println("people = $people")

# Map
names = map(p -> p.name, people) # Note the "->" lamdba.
println("names = $names")

names = [p.name for p in people]
println("names = $names")


