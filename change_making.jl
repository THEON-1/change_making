
function ordered_count_change(coinset::Vector{Int}, target::Int)
    sort!(coinset)
    buffer_size = coinset[end]
    buffer_offset = 0
    buffer = zeros(Int, buffer_size)

    buffer[1] = 1
    for i ∈ 1:target
        sum = 0
        for j ∈ coinset
            if j <= i
                increment = buffer_get(buffer, buffer_offset, j)
                sum += increment
            end
        end
        buffer_offset = buffer_append(buffer, buffer_offset, sum)
    end
    return buffer_get(buffer, buffer_offset, 1)
end

function buffer_append(buffer::Vector{Int}, offset::Int, value::Int)
    offset = mod(offset-1, length(buffer))
    buffer[offset+1] = value
    return offset
end

function buffer_get(buffer::Vector{Int}, offset::Int, index::Int)
    return buffer[shifted_mod(index+offset, length(buffer), 1)]
end

function buffer_set(buffer::Vector{Int}, offset::Int, index::Int, value::Int)
    buffer[shifted_mod(index+offset, length(buffer), 1)] = value
end

function shifted_mod(divisor::Int, dividend::Int, shift::Int)
    return mod(divisor - shift, dividend) + shift
end

