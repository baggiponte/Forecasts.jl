module TimeSeriesArrays

using Dates

abstract type AbstractTimeSeries{T,N,D} end

"""
    TimeArray{T,N,D<:TimeType,A<:AbstractArray{T,N}} <: AbstractTimeSeries{T,N,D}

Creates a TimeSeries with an index (either a Date/DateTime or an Int32) and an Array of values.

# Constructors

# Arguments

- `index::Vector{<:TimeType}`: a vector of sorted timestamps,
- `values::AbstractArray`: a data vector or matrix. Its number of rows should match the length of `timestamp`.
- `colnames::Vector{Symbol}`: the column names. Its length should match the column of `values`.
"""
struct TimeSeries{T,N,D<:TimeType,A<:AbstractArray{T,N}} <: AbstractTimeSeries{T,N,D}
  index::Vector{D}
  values::A
  colnames::Vector(Symbol)
end

end