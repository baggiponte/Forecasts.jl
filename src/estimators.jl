module Estimators

abstract type AbstractEstimator end
abstract type AbstractForecaster <: AbstractEstimator end
abstract type AbstractNaiveForecaster <: AbstractForecaster end

"""
    NaiveSeasonal(S<:Int)

The prediction is always the value of S time steps ago.
When S=1, this model predicts the last value of the training set.
When S>1, it repeats the last K values of the training set.

# Constructors

    NaiveSeasonal(S<:Int)
    NaiveSeasonal()

# Arguments
- `period<:Int`: the period of the seasonality. Defaults to 1.
"""
struct NaiveSeasonal{T<:Integer} <: AbstractNaiveForecaster
    period::T
    NaiveSeasonal(period) = new(period)
end

NaiveSeasonal() = NaiveSeasonal{<:Integer}(1)

function fit(forecaster::NaiveSeasonal, forecasting_horizon::F, y::T) where {F<:Integer} where {T<:AbstractVector{<:Real}}
    @assert forecaster.period <= length(y) "Seasonal periodicity `period` is greater than `y`!"
    if forecaster.period == 1
        return fill(y[end], forecasting_horizon)
    else
        return y[end-forecaster.period:end-forecaster.period+forecasting_horizon]
    end

end

"""
    NaiveDrift()

Fits a line between the first and last point of the training series, and extends it in the future.

# Arguments

- `window_length<:Int`: the number of elements used to compute the trend.
If `-1`, the trend will be computed on the whole series.
"""
@kwdef struct NaiveDrift{T<:Integer} <: AbstractNaiveForecaster
    window_length::T = 1
    NaiveDrift(window_length) = new(window_length)
end

NaiveDrift() = NaiveDrift{<:Integer}(-1)

function fit(forecaster::NaiveDrift, forecasting_horizon::F, y::T) where {F<:Integer} where {T<:AbstractVector{<:Real}}
    @assert forecaster.window_length <= length(y) "`window_length` is greater than `y`!"

    if forecaster.window_length == -1
        slope::Float64 = (y[end] - y[1]) / length(y)
    else
        slope = (y[end] - y[end-forecaster.window_length]) / forecaster.window_length
    end

    return [y[end] + slope * step for step in Vector(1:forecasting_horizon)]
end

end
