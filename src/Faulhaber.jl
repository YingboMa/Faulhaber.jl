module Faulhaber

"""
    faulhaber(m, ::Val{p})

Compute the summation `sum(i->i^p, 1:m)`. When `m` is an integer, the function
returns an exact integer solution assuming integer overflows don't occur. When
`m` is a floating-point number, then it returns a less accurate float solution.
"""
@generated function faulhaber(m, ::Val{p}) where p
    @assert p >= 0
    T = m
    IT = typeof(Integer(zero(m)))
    k = p + 1
    A = Rational{IT}[m > n ? zero(IT) : (-1)^(m+n) * binomial(IT(n), m-1)  for n in 1:k, m in 1:k]
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
