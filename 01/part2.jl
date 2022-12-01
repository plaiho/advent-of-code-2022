using DelimitedFiles

elves = Matrix{Int}[]

println(string("Reading data from file ", ARGS[1]))
open(ARGS[1], "r") do io
    while !eof(io)
        str = readuntil(io, "\n\n")
        push!(elves, readdlm(IOBuffer(str)))
    end
end

println(sum(sum.(elves[partialsortperm(sum.(elves), 1:3, rev=true)])))