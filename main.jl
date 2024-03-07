#!/home/maxime/.julia/bin/julia

function main()
    if length(ARGS) < 2
        println("need at least 2 args")
        exit(1);
    end
    coinset = map(x -> parse(Int, x), unique(ARGS))
    if ~(1 in coinset)
        println("coinset needs 1")
        exit(1);
    end
end

main()

