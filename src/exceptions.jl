module ForecastsExceptions

export WindowLengthDomainError, WindowLengthMismatch, PeriodDomainError

abstract type WindowLengthException <: Exception end

"""
Thrown when the window length of an estiamtor is negative.
"""
struct WindowLengthDomainError <: WindowLengthException end

"""
Thrown when the window length of an estimator is greater than the length of the vector `y`.
"""
struct WindowLengthMismatch <: WindowLengthException end

"""
Thrown when the argument `period` of an estimator is negative.
"""
struct PeriodDomainError <: Exception end

end
