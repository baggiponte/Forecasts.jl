module Learners

abstract type AbstractLearner end
abstract type AbstractForecaster <: AbstractLearner end

"""
    NaiveForecaster()

# Constructors

"""
struct NaiveForecaster <: AbstractForecaster
    forecasting_horizon::Int32
    strategy::String
end

end