var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Faulhaber","category":"page"},{"location":"#Faulhaber","page":"Home","title":"Faulhaber","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Faulhaber.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Faulhaber]","category":"page"},{"location":"#Faulhaber.faulhaber-Union{Tuple{p}, Tuple{Any, Val{p}}} where p","page":"Home","title":"Faulhaber.faulhaber","text":"faulhaber(m, ::Val{p})\n\nCompute the summation sum(i->i^p, 1:m) in O(p) time. When m is an integer, the function returns an exact integer solution assuming integer overflows don't occur. When m is a floating-point number, then it returns a less accurate float solution.\n\nExamples:\n\njulia> using BenchmarkTools, Faulhaber\n\njulia> @btime faulhaber(Ref(Int128(2000))[], Val(7))\n  1.143 ns (0 allocations: 0 bytes)\n32064037333328666667000000\n\njulia> @btime sum(i->i^7, 1:Int128(2000))\n  12.282 μs (0 allocations: 0 bytes)\n32064037333328666667000000\n\njulia> @btime faulhaber(Ref(2000.0)[], Val(7))\n  1.134 ns (0 allocations: 0 bytes)\n3.2064037333328662e25\n\n\n\n\n\n","category":"method"}]
}