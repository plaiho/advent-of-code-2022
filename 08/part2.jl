using DelimitedFiles

function score(vec)
    if ~any(vec)
        return length(vec)
    else
        return findfirst(vec)
    end
end

sample = collect.(readdlm(ARGS[1], String))
sample = parse.(Int, reduce(hcat, [row[1] for row in eachrow(sample)]))

scenic_score = 1

for i in 2:size(sample)[1]-1
    for j in 2:size(sample)[2]-1
        global scenic_score = max(scenic_score, score(sample[i,j] .<= sample[i,j+1:end]) * score(sample[i,j] .<= reverse(sample[1:i-1,j])) * score(sample[i,j] .<= reverse(sample[i,1:j-1])) * score(sample[i,j] .<= sample[i+1:end,j]))
        println(scenic_score)
    end
end