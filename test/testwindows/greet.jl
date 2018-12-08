module test_testwindows_greet

using Test
using TestWindows: greet

@test greet() isa Nothing

end # module test_testwindows_greet
