module Faulhaber

"""
    faulhaber(m, ::Val{p})

Compute the summation `sum(i->i^p, 1:m)` in ``O(p)`` time. When `m` is an
integer, the function returns an exact integer solution assuming integer
overflows don't occur. When `m` is a floating-point number, then it returns a
less accurate float solution.

Examples:
```julia
julia> using BenchmarkTools, Faulhaber

julia> @btime faulhaber(Ref(Int128(2000))[], Val(7))
  1.143 ns (0 allocations: 0 bytes)
32064037333328666667000000

julia> @btime sum(i->i^7, 1:Int128(2000))
  12.282 μs (0 allocations: 0 bytes)
32064037333328666667000000

julia> @btime faulhaber(Ref(2000.0)[], Val(7))
  1.134 ns (0 allocations: 0 bytes)
3.2064037333328662e25
```
"""
@generated function faulhaber(m, ::Val{p}) where p
    p >= 0 || throw(ArgumentError("The exponent must be non-negative! Got $p."))
    T = m
    IT = typeof(Integer(zero(m)))
    k = p + 1
    A = Rational{IT}[m > n ? zero(IT) : (-1)^(m+n) * binomial(IT(n), IT(m)-1)  for n in 1:k, m in 1:k]
    cc = A' \ [i==k for i in 1:k]
    zz = zero(T)
    if m <: Integer
        factor = lcm(denominator.(cc)...)
        coeffs = T.(factor * cc)
        :(@evalpoly(m, $zz, $(coeffs...)) ÷ $factor)
    else
        coeffs = T.(cc)
        :(@evalpoly(m, $zz, $(coeffs...)))
    end
end

export faulhaber

end
