using Test

function runtests(tests)
    n_passed = 0
    anynonpass = 0
    for (idx, filepath) in enumerate(all_tests)
        numbering = string(idx, /, length(all_tests))
        ts = @testset "$numbering $filepath" begin
            include(filepath)
        end
        n_passed += ts.n_passed
        anynonpass += ts.anynonpass
    end
    if iszero(anynonpass)
        printstyled("✅  ", color=:green)
        print("All ")
        printstyled(n_passed, color=:green)
        println(" tests have been completed.")
    end
end

all_tests = []
for (root, dirs, files) in walkdir(".")
    for filename in files
        !endswith(filename, ".jl") && continue
        "runtests.jl" == filename && continue
        filepath = joinpath(root, filename)[3:end]
        !isempty(ARGS) && !any(x->startswith(filepath, x), ARGS) && continue
        push!(all_tests, filepath)
    end
end
runtests(all_tests)
