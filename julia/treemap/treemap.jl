### treemap.jl

"""
module Treemap

A 'Dictionary ADT implementation using Binary Search Trees.
"""
module Treedicts

"""
struct Node

The standard Node structure.
"""
struct Node
    key
    value
    left::Union{Nothing, Node}
    right::Union{Nothing, Node}
end

Node(k, v) = Node(k, v, nothing, nothing)

"""
struct Treedict

The standard Treedict structure.
"""
mutable struct Treedict
    name
    root::Union{Nothing, Node}
end

Treedict(name) = Treedict(name, nothing)

### Interface

"""
insert!(tm, key, value)

Inserts the key value pair into the tree.
"""
function insert!(tm::Treedict, key, value)
    tm.root = insert(tm.root, key, value)
    tm
end

function insert(n::Nothing, key, value)
    Node(key, value)
end

function insert(n::Node, key, value)::Node
    if key == n.key
        Node(key, value, n.left, n.right)
    elseif key < n.key
        Node(n.key, n.value, insert(n.left, key, value), n.right)
    else
        Node(n.key, n.value, n.left, insert(n.right, key, value))
    end
end

function print_tree(tm::Treedict)
    println("Treedict ", tm.name)
    print_tree(tm.root, "r")
end

print_tree(tm::Nothing, d, level) = nothing

function print_tree(n::Node, side::String, level::Int = 1)

    for i in 1:level
        print(" ")
    end
    
    println(side, " ==> ", n.key)
    print_tree(n.left, "l", level + 4)
    print_tree(n.right, "r", level + 4)
end

function search(tm::Treedict, key)
    node_search(tm.root, key)
end

search(n::Nothing, key) = nothing

function search(n::Node, key)
    if key == n.key
        n
    elseif key < n.key
        search(n.left, key)
    else
        search(n.right, key)
    end
end

end # module Treedicts

### treemap.jl ends here
