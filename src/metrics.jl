module RegressionMetrics

export mean_absolute_error, mean_squared_error

using Statistics: mean

"""
    mean_absolute_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real})

Computes the mean absolute error, defined as:

``
\\text{MAE}(y, \\hat{y}) = \\frac{1}{n_{\\text{samples}}} \\sum_{i=0}^{n_{\\text{samples}}-1} \\left| y_i - \\hat{y}_i \\right|
``

# Arguments

- `predictions::Vector{<:Real}`: the vector of predicted values.
Can be any subtype of Real - in other words, any integer or float.
- `ground_truth::Vector{<:Real}`: the vector of true values.
Can be any subtype of Real - in other words, any integer or float.

# Examples
```jldoctest
julia> mean_absolute_error([1, 1, 1], [0, 0, 0])
1.0

julia> mean_absolute_error([1.2, 0.8, 0.95], [1.1, 0.9, 1])
0.0833333333333333
```
"""
function mean_absolute_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real})
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_truth` should have the same length!"
    return mean(abs.(ground_truth .- predictions))
end

"""
    mean_squared_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real}, square::Bool=false)

Computes the mean squared error (MSE), defined as:
``
\\text{MSE}(y, \\hat{y}) = \\frac{1}{n_\\text{samples}} \\sum_{i=0}^{n_\\text{samples} - 1} (y_i - \\hat{y}_i)^2.
``

Can also return the root mean squared error (RMSE).

# Arguments

- `predictions::Vector{<:Real}`: the vector of predicted values.
Can be any subtype of Real - in other words, any integer or float.
- `ground_truth::Vector{<:Real}`: the vector of true values.
Can be any subtype of Real - in other words, any integer or float.
- `square::Bool`: whether to return the MSE or RMSE. Defaults to `false`.

# Examples
```jldoctest
julia> mean_squared_error([2, 2, 2], [0, 0, 0])
4.0

julia> mean_squared_error([2, 2, 2], [0, 0, 0], square=true)
2.0

julia> mean_absolute_error([1.2, 0.8, 0.95], [1.1, 0.9, 1])
0.007499999999999992

julia> mean_absolute_error([1.2, 0.8, 0.95], [1.1, 0.9, 1], square=true)
0.08660254037844382
"""
function mean_squared_error(predictions::Vector{<:Real}, ground_truth::Vector{<:Real}; square::Bool=false)
    @assert length(predictions) == length(ground_truth) "`predictions` and `ground_truth` should have the same length!"

    mse = mean((ground_truth .- predictions) .^ 2)

    if square == true
        return √mse
    else
        return mse
    end
end

end
