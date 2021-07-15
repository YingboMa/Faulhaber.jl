using Faulhaber
using Documenter

DocMeta.setdocmeta!(Faulhaber, :DocTestSetup, :(using Faulhaber); recursive=true)

makedocs(;
    modules=[Faulhaber],
    authors="Yingbo Ma <mayingbo5@gmail.com> and contributors",
    repo="https://github.com/YingboMa/Faulhaber.jl/blob/{commit}{path}#{line}",
    sitename="Faulhaber.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://YingboMa.github.io/Faulhaber.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/YingboMa/Faulhaber.jl",
)
