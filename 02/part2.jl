using DelimitedFiles

scoringDict = Dict("A X" => 3, "A Y" => 4, "A Z" => 8, "B X" => 1, "B Y" => 5, "B Z" => 9, "C X" => 2, "C Y" => 6, "C Z" => 7)

println(string("Reading data from file ", ARGS[1]))
playlog = readdlm(ARGS[1], '\t', Any, '\n')

println(sum(replace(r->get(scoringDict, r, missing), playlog)))