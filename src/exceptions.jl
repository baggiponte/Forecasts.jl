module ForecastsExceptions

export WindowLengthMismatch

"""
Error thrown when the window length of an estimator is greater than the length of the vector `y`
"""
struct WindowLengthMismatch <: Exception end

end
