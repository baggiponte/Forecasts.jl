module Metrics

"""
    mean_absolute_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real})


"""
function mean_absolute_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real})
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_truth` should have the same length!"
    return (sum(abs.(ground_truth .- predictions)) / length(predictions))
end
"""
    mean_squared_error
"""
function mean_squared_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real}; sqrt::Bool=false)
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_truth` should have the same length!"

    mse = sum((ground_truth .- predictions) .^ 2) / length(predictions)

    if sqrt == true
        return √mse
    else
        return mse
    end
end


end
