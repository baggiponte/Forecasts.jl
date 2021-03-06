module Estimators

export NaiveDrift, NaiveSeasonal

using ..ForecastsExceptions: WindowLengthDomainError, WindowLengthMismatch
using ..ForecastsExceptions: PeriodDomainError, PeriodLengthError

abstract type AbstractEstimator end
abstract type AbstractForecaster <: AbstractEstimator end
abstract type AbstractNaiveForecaster <: AbstractForecaster end

"""
    NaiveDrift()

Fits a line between two points of the (training) series `y`, and extends it in the future.

# Constructors

    NaiveDrift()
    NaiveDrift(0)
    NaiveDrift(7)

The first two methods are equivalent and will use the whole series `y` when the `fit` function is called.
The last constructor specifies a window length of 7. 

# Arguments

- `window_length<:Integer`: the number of elements used to compute the trend.
It must be a positive integer. If no argument is passed, or set to `0`, the whole length of the 
series will be used.
"""
struct NaiveDrift{T<:Integer} <: AbstractNaiveForecaster
    window_length::T
    NaiveDrift{T}(window_length) where {T<:Integer} = window_length < 0 ? throw(WindowLengthDomainError("`window_length` must be non-negative!")) : new(window_length)
end

NaiveDrift(window_length::T) where {T<:Integer} = NaiveDrift{T}(window_length)
NaiveDrift() = NaiveDrift(0)

function fit(forecaster::NaiveDrift, forecasting_horizon::F, y::T) where {F<:Integer} where {T<:AbstractVector{<:Real}}
    forecaster.window_length <= length(y) || throw(WindowLengthMismatch("`$forecaster`'s window length is greater than `y`"))

    if forecaster.window_length == 0 || forecaster.window_length == len(y)
        slope::Float64 = (y[end] - y[1]) / length(y)
    else
        slope = (y[end] - y[end-forecaster.window_length]) / forecaster.window_length
    end

    return [y[end] + slope * step for step in Vector(1:forecasting_horizon)]
end

"""
    NaiveSeasonal(T<:Int)

The prediction is always the value of S time steps ago.
When T=1, this model predicts the last value of the training set.
When T>1, it repeats the last K values of the training set.

# Constructors

    NaiveSeasonal(T<:Int)
    NaiveSeasonal()

# Arguments
- `period<:Int`: the period of the seasonality. Defaults to 1.
"""
struct NaiveSeasonal{T<:Integer} <: AbstractNaiveForecaster
    period::T
    NaiveSeasonal{T}(period) where {T<:Integer} = period < 0 ? throw(PeriodDomainError("`period` must be non-negative!")) : new(period)
end

NaiveSeasonal(period::T) where {T<:Integer} = NaiveSeasonal{T}(period)
NaiveSeasonal() = NaiveSeasonal(0)

function fit(forecaster::NaiveSeasonal, forecasting_horizon::F, y::T) where {F<:Integer} where {T<:AbstractVector{<:Real}}
    forecaster.period <= length(y) || throw(PeriodLengthError("`$forecaster`'s period length is greater than `y`"))
    if forecaster.period == 1
        return fill(y[end], forecasting_horizon)
    else
        return y[end-forecaster.period:end-forecaster.period+forecasting_horizon]
    end

end

end
