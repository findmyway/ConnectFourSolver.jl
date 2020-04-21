module ConnectFourSolver

using CxxWrap
using ConnectFourSolver_jll
using Pkg.Artifacts

export Solver, Position, load_book, get_book

@wrapmodule libconnect4jl

function get_book(book="7x6.book")
    book = joinpath(artifact"books", "books", book)
    !isfile(book) && error("book not found: $book")
    book
end

Base.copy(p::Position) = clone(p)

"move starts with 0"
(p::Position)(move::Int) = play(p, move)

"the returned score is negmax"
(solver::Solver)(p::Position, is_weak=false) = solve(solver, p, is_weak)

function __init__()
    @initcxx
end

end # module