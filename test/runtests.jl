using Forecasts
using Test

@testset "Forecasts.jl" begin

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
