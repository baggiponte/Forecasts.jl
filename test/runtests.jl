using Forecasts
using Test

@testset "RegressionMetrics" begin

    @testset "Mean Absolute Error" begin
        @test_throws DimensionMismatch mean_absolute_error([0, 0], [1, 1, 1])
        @test_throws DimensionMismatch mean_absolute_error([0, 0, 0], [1, 1])

        @test mean_absolute_error([0, 0, 0], [1, 1, 1]) == 1
    end

    @testset "Mean Squared Error" begin
        @test_throws DimensionMismatch mean_squared_error([0, 0], [1, 1, 1])
        @test_throws DimensionMismatch mean_squared_error([0, 0, 0], [1, 1])

        @test mean_squared_error([0, 0, 0], [1, 1, 1]) == 1
        @test mean_squared_error([0, 0, 0], [1, 1, 1], square=true) == 1
    end
end

@testset "Estimators" begin
    using Forecasts.ForecastsExceptions: WindowLengthDomainError
    using Forecasts.ForecastsExceptions: PeriodDomainError

    @testset "NaiveDrift" begin
        @test_throws WindowLengthDomainError NaiveDrift(-1)
    end

    @testset "NaiveSeasonal" begin
        @test_throws PeriodDomainError NaiveSeasonal(-1)
    end
end