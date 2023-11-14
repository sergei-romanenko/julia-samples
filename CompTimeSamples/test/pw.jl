module PW

using Test
using CompTime
using InteractiveUtils

function pw_rec(n, x)
    if iszero(n)
        one(x)
    else
        x * pw_rec(n - 1, x)
    end
end

@info "Testing pw_rec"

@testset "pw_rec" begin
    @test pw_rec(3, "Abc") == "AbcAbcAbc"
end

function pw_loop(n, x)
    r = one(x)
    for i in 1:n
        r = r * x
    end
    return r
end

@info "Testing pw_loop"

@testset "pw_loop" begin
    @test pw_loop(3, "Abc") == "AbcAbcAbc"
end

@ct_enable function pw_ct(@ct(n), x)
    r = one(x)
    @ct_ctrl for i in 1:n
        r = r * x
    end
    return r
end

pw_ct(n, x) = pw_ct(Val{n}, x)

@testset "pw_loop ct" begin
    @test pw_ct(3, "Abc") == "AbcAbcAbc"
    @test pw_ct(3, "Abc") == runtime(pw_ct, 3, "Abc")
end

println(@code_typed pw_ct(Val{3}, 10))
# println(@code_typed (runtime(pw_ct, 3, 10)))
# println(@code_typed (comptime(pw_ct, Val{3}, 10)))
println(debug(pw_ct, Val{3}, 10))

end
