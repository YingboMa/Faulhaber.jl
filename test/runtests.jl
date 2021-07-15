using Faulhaber
using Test

@testset "Faulhaber.jl" begin
    for m in 1:200, p in 1:7
        @test faulhaber(m, Val(p)) == sum(i->i^p, 1:big(m))
        @test faulhaber(float(m), Val(p)) ≈ sum(i->i^p, 1:big(m))
    end
    for m in 1:13, p in 8:15
        @test faulhaber(m, Val(p)) == sum(i->i^p, 1:big(m))
    end
end
