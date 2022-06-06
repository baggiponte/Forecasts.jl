module Estimators

abstract type AbstractEstimator end
abstract type AbstractForecaster <: AbstractEstimator end

struct NaiveForecaster <: AbstractForecaster
    forecasting_horizon::Int32
    strategy::String
end

end # module