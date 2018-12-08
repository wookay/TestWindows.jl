using Test
using TestWindows: greet

@testset "test" begin
    @test greet() isa Nothing
end
