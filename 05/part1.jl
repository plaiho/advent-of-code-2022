using DelimitedFiles, Printf

function parse_command(command)
    from = parse(Int, split(command, ' ')[4])
    to = parse(Int, split(command, ' ')[6])
    no = parse(Int, split(command, ' ')[2])
    return [no, from, to]
end

function execute_move(stacks, command)
    (no, from, to) = parse_command(command)
    for i in 1:min(length(stacks[from]), no)
        insert!(stacks[to], 1, popfirst!(stacks[from]))
    end 
    return
end

raw_input = readdlm(ARGS[1],'\t')
a = [row[1][2] for row in eachrow(raw_input)]

labelrow = [i for i in 1:size(a,1) if a[i] == '1'][1]
raw_stacks = permutedims(reduce(vcat, permutedims.(collect.(raw_input[1:labelrow-1]))))
commands = raw_input[labelrow+1:end]

inds = [i for (i,v) in enumerate(collect(raw_input[labelrow])) if v != ' ']
raw_stacks = [c[:] for c in eachrow(raw_stacks[inds,:])]

stacks = raw_stacks

for i in eachindex(raw_stacks)
    stacks[i] = [c for c in raw_stacks[i] if c != ' ']
end

for command in commands
    execute_move(stacks, command)
end

println(String([stack[1] for stack in stacks]))






