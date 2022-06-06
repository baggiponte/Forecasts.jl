module Metrics

function mean_squared_error(predictions::T, ground_truth::T; sqrt::Bool=false) where {T<:AbstractVector{<:Real}}
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_trut` should have the same length!"

    mse = sum((ground_truth .- predictions) .^ 2) / length(predictions)

    if sqrt == true
        return √mse
    else
        return mse
    end
end

function mean_absolute_error(predictions::T, ground_truth::T) where {T<:AbstractVector{<:Real}}
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_trut` should have the same length!"
    return (sum(abs.(ground_truth .- predictions)) / length(predictions))
end

end # module