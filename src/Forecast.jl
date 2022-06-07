module Forecast

include("TimeSeries.jl") # imports TimeSeries module
using .TimeSeriesArrays
export TimeSeries

include("Estimators.jl") # imports Estimators module
using .Estimators
export NaiveForecaster

include("Metrics.jl") # imports Metrics module
using .Metrics
export mean_absolute_error, mean_squared_error

end