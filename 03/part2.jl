using DelimitedFiles

function value(c)
    c < 91 ? c - 38 : c - 96
end

input = readdlm(ARGS[1], String)

println(sum([value(Int(collect(intersect!(Set(input[3*i-2:3*i][1]), Set(input[3*i-2:3*i][2]), Set(input[3*i-2:3*i][3])))[1])) for i in 1:Int(length(input)/3)]))



