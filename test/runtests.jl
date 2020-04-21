using ConnectFourSolver
using Test

@testset "ConnectFourSolver.jl" begin
    solver = Solver()
    book = get_book()
    load_book(solver, book)

    open(joinpath(@__DIR__, "Test_L1_R1")) do f
        for line in eachline(f)
            p = Position()
            moves, score = split(line)
            for x in moves
                p(parse(Int, x) - 1)  # starts from 0
            end
            @test solver(p) == parse(Int, score)
        end
    end
end
