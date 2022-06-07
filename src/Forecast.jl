module Forecast

include("timeseries.jl") # imports TimeSeries module
using .TimeSeriesArrays
export TimeSeries

include("learners.jl") # imports Estimators module
using .Learners
export NaiveForecaster

include("metrics.jl") # imports Metrics module
using .RegressionMetrics
export mean_absolute_error, mean_squared_error

end