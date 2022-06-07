# Forecasts: a PoC for Time Series Forecasting in Julia

[![Coverage](https://codecov.io/gh/baggiponte/Forecast.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/baggiponte/Forecast.jl)

## Installation

Forecast is not yet registered, so you can install it with:

```
julia> using Pkg
julia> Pkg.add(url="https://github.com/baggiponte/Forecasts.jl")
```

## Credits and References

This PoC draws inspiration for several Julia packages and frameworks:

- [TSx](https://github.com/xKDR/TSx.jl) by xKDR.
- [TSML](https://github.com/IBM/TSML.jl) by IBM.
- [Pythia](https://github.com/ababii/Pythia.jl) by ababii.
- [TimeSeries](https://github.com/JuliaStats/TimeSeries.jl) from the JuliaStats framework.

For the API interface philosophy, please refer to the followings:

- [scikit-learn](https://github.com/scikit-learn/scikit-learn)
- [sktime](https://github.com/alan-turing-institute/sktime/)
- [darts](https://github.com/unit8co/darts)