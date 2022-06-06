module Forecast

export TimeSeries, NaiveForecaster, mean_squared_error, mean_absolute_error

include("TimeSeries.jl")
include("Estimators.jl")
include("Metrics.jl")

end
