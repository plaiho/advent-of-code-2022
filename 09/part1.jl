using DelimitedFiles, LinearAlgebra

function move(c,head,tail) 
    c == "R" ? head += [1,0] : 
    c == "L" ? head += [-1,0] : 
    c == "D" ? head += [0,1] : 
    c == "U" ? head += [0,-1] : 
    head
    if norm(head-tail) >= 2
        c == "R" ? tail += [1,0] : 
        c == "L" ? tail += [-1,0] : 
        c == "D" ? tail += [0,1] : 
        c == "U" ? tail += [0,-1] : 
        tail
        if head[1] != tail[1] && head[2] != tail[2]
            c == "R" || c == "L" ? tail[2] = head[2] :
            c == "D" || c == "U" ? tail[1] = head[1] :
            tail
        end
    end
    return (head, tail)
end

input = readdlm(ARGS[1])
head = [1,1]
tail = [1,1]
tails = []

for row in eachrow(input)
    for i in 1:row[2]
        global (head, tail) = move(row[1], head, tail)
        global tails = vcat(tails, [tail])
    end
end

println(length(Set(tails)))