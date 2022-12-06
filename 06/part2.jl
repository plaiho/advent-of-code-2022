f = open(ARGS[1])
s = read(f, String)
close(f)

for i in 1:length(s)-13
    if length(s[i:i+13]) == length(Set(s[i:i+13]))
        println(i+13)
        break
    end
end
