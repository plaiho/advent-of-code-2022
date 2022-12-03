using DelimitedFiles

function value(c)
    c < 91 ? c - 38 : c - 96
end

input = readdlm(ARGS[1], String)

println(sum([value(Int(collect(intersect(Set(row[1][1:Int(length(row[1])/2)]),Set(row[1][Int(length(row[1])/2)+1:length(row[1])])))[1])) for row in eachrow(input)]))



