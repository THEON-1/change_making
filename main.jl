#!/home/maxime/.julia/bin/julia

include("change_making.jl")

function main()
    if length(ARGS) < 2
        println("need at least 2 args")
        exit(1);
    end
    coinset = map(x -> parse(Int, x), unique(ARGS[2:end]))
    if ~(1 in coinset)
        println("coinset needs 1")
        exit(1);
    end
    target = parse(Int, ARGS[1])

    println(count_change(coinset, target))
end

main()

