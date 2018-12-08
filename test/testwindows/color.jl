module test_testwindows_color

using Test

@test Base.JLOptions().color == 1

printstyled("red ", color=:red)
printstyled("green ", color=:green)
printstyled("blue", color=:blue)
println()

end # module test_testwindows_color
