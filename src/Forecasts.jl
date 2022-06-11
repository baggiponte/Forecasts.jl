module Forecasts

include("exceptions.jl")

# include("timeseries.jl")
# using .TimeSeriesArrays
# export TimeSeries

include("estimators.jl")
using .Estimators
export NaiveDrift, NaiveSeasonal

include("metrics.jl")
using .RegressionMetrics
export mean_absolute_error, mean_squared_error

end
