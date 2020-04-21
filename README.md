# ConnectFourSolver

[![Build Status](https://travis-ci.com/findmyway/ConnectFourSolver.jl.svg?branch=master)](https://travis-ci.com/findmyway/ConnectFourSolver.jl)

This package provides a Julia wrapper for [PascalPons/connect4](https://github.com/PascalPons/connect4).

# Usage

```julia
using ConnectFourSolver

solver = Solver()
book = get_book()
load_book(solver, book)

p = Position()
solver(p)  # 1

for x in 0:6
    p′ = copy(p)
    p′(x)
    println(solver(p′))
end

# 2
# 1
# 0
# -1
# 0
# 1
# 2
```