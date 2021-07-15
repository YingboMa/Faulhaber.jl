using Faulhaber
using Test

@testset "Faulhaber.jl" begin
    @test_throws ArgumentError faulhaber(10, Val(-7))

    for m in 1:200, p in 0:7, T in [Int, Int128, Float64]
        if T == Float64
            @test faulhaber(float(m), Val(p)) ≈ sum(i->i^p, 1:big(m))
        else
            @test faulhaber(T(m), Val(p)) === T(sum(i->i^p, 1:big(m)))
        end
    end
    for m in 1:13, p in 8:15
        @test faulhaber(m, Val(p)) == sum(i->i^p, 1:big(m))
    end
end
