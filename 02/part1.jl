using DelimitedFiles

decoderDict = Dict("A" => -1, "B" => -2, "C" => -3, "X" => 1, "Y" => 2, "Z" => 3)
scorerDict = Dict(0 => 3, -1 => 0, -2 => 6, 1 => 6, 2 => 0)

println(string("Reading data from file ", ARGS[1]))
playlog = readdlm(ARGS[1])

score = sum(replace(r -> get(scorerDict, r, missing), sum.(eachrow(replace(t -> get(decoderDict, t, missing), playlog))))) + sum(replace(t -> get(decoderDict, t, missing), playlog[:,2]))

println(score)