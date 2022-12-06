f = open(ARGS[1])
s = read(f, String)
close(f)

for i in 1:length(s)-3
    if length(s[i:i+3]) == length(Set(s[i:i+3]))
        println(i+3)
        break
    end
end
