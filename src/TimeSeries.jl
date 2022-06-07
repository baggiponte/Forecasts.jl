module TimeSeriesArrays

abstract type AbstractTimeSeries{T,N,D} end

struct TimeSeries{T,N,D<:TimeType,A<:AbstractArray{T,N}} <: AbstractTimeSeries{T,N,D}
    index::Vector{D}
    values::A
    colnames::Vector(Symbol)
end

end