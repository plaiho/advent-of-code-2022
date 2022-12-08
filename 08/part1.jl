using DelimitedFiles

sample = collect.(readdlm(ARGS[1], String))
sample = parse.(Int, reduce(hcat, [row[1] for row in eachrow(sample)]))

cnt = 0

for i in 2:size(sample)[1]-1
    for j in 2:size(sample)[2]-1
        global cnt += (all(sample[i,j] .> sample[i,j+1:end]) || all(sample[i,j] .> sample[1:i-1,j]) || all(sample[i,j] .> sample[i,1:j-1]) || all(sample[i,j] .> sample[i+1:end,j]))
    end
end

cnt += 2*size(sample)[1] + 2*(size(sample)[2]-2)

println(cnt)