using DelimitedFiles

input = readdlm(ARGS[1], String)

cnt = 0

for row in eachrow(input)
    first_range = Set(parse(Int, split(row[1], ('-',','))[1]):parse(Int, split(row[1], ('-',','))[2]))
    second_range = Set(parse(Int, split(row[1], ('-',','))[3]):parse(Int, split(row[1], ('-',','))[4]))
    global cnt += (intersect(first_range,second_range) == first_range || intersect(first_range,second_range) == second_range)
end

println(cnt)
