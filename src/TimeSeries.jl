module TimeSeries

abstract type AbstractTimeSeries end

struct TimeSeriesArray <: AbstractTimeSeries
    index::Vector{Int32}
    values::Vector{Float64}
end

end