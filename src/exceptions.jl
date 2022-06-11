module ForecastsExceptions

abstract type RangeDomainError <: Exception end
abstract type VectorsLengthError <: Exception end

"""
Thrown when the window length of an estiamtor is negative.
"""
struct WindowLengthDomainError <: RangeDomainError
    msg::String
end

"""
Thrown when the argument `period` of an estimator is negative.
"""
struct PeriodDomainError <: RangeDomainError
    msg::String
end

"""
Thrown when the window length of an estimator is greater than the length of the series `y`.
"""
struct WindowLengthMismatch <: VectorsLengthError
    msg::String
end

"""
Thrown when the argument `period` of an estimator is greated than the length of the series `y`.
"""
struct PeriodLengthError <: VectorsLengthError
    msg::String
end

end
