### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ cebd7545-6d82-4ed0-89b5-80d4bae4e0d8
using CompTime, InteractiveUtils

# ╔═╡ e479c76b-a9c8-465f-8c64-f5e7a31167d1
md"""
Polynomial:

$p(x) = a_1 + a_2 x + \cdots + a_n x^{n-1}$

"""

# ╔═╡ 9b0ad92e-73b8-4fd3-9872-56b868512645
md"""
Horner's method:

$p(x) = (((a_n x  + a_{n-1}) x + a_{n-2}) x + \cdots + a_{2})x + a_{1}$

"""

# ╔═╡ 9e70a350-2a1b-44a1-889d-022f156d0f5e
md"""
Evaluate a polynomial whose coefficients are given in ascending
order in `c`, at the point `x`, using Horner's rule.
"""

# ╔═╡ b637221d-8502-41ff-b5ad-b313277bb785
function horner(a, x)
    n = length(a)
    y = a[n]

    for k in n-1:-1:1
        y = x * y + a[k]
    end

    return y
end

# ╔═╡ 426fbe49-04a0-47a9-a5a1-e12773bfdef4
a = [11, 12, 13, 14]

# ╔═╡ af589346-a764-4d71-af72-26d6a63b7118
horner(a, 10)

# ╔═╡ b9ec0ea0-20b0-484e-94f5-41629be3358f
@code_lowered horner(a, 10)

# ╔═╡ 272ae93c-6ce9-422b-8f0b-c2f7ff64cb0c
function horner_tuple(c::NTuple{N,T}, x::T) where {N,T}
    y = c[N]

    for k in N-1:-1:1
        y = x * y + c[k]
    end

    return y
end

# ╔═╡ 03b26fc7-6b6b-44bc-803e-632078d46adc
t = (11, 12, 13, 14)

# ╔═╡ b1e75368-e048-4d66-9c68-07938ec07492
horner_tuple(t, 10)

# ╔═╡ f760d207-042b-40b4-9de3-59a9e429ac40
@code_lowered horner_tuple(t, 10)

# ╔═╡ d0e2a985-8495-4be6-ab66-f333d4b02d89
@generated function horner_gen_expr(c::NTuple{N,T}, x::T) where {N,T}
    y = :(c[$N])

    for k in N-1:-1:1
        y = :(x * $y + c[$k])
    end

    Core.println(string(y))
    return y
end

# ╔═╡ 4118ee5d-b3b2-4ee6-aab9-7dd73b3edc57
horner_gen_expr(t, 10)

# ╔═╡ c9b80449-3e9a-4480-ab45-34c21a07e47d
@generated function horner_gen(c::NTuple{N,T}, x::T) where {N,T}
    r = Expr[]
    push!(r, :(y = c[$N]))

    for k in N-1:-1:1
        push!(r, :(y = x * y + c[$k]))
    end
 
    r = :(begin $(r...) end)
    Core.println(string(Base.remove_linenums!(r)))
    return r
end

# ╔═╡ 16504c6a-7a4e-4dcc-9817-094df389ad1a
horner_gen(t, 10)

# ╔═╡ 577ec0ad-8607-414f-be5c-90e272b6a04f
@ct_enable function horner_ct(c::NTuple{N,T}, x::T) where {N,T}
    y = c[@ct(N)]

    @ct_ctrl for k in N-1:-1:1
        y = x * y + c[@ct(k)]
    end

    return y
end

# ╔═╡ eeb3d90a-0b82-474f-ad50-58f2b2332bca
horner_ct(t, 10)

# ╔═╡ 72bbf28c-c9c5-4084-8c35-299b0d48e2f1
debug(horner_ct, t, 10) |> Base.remove_linenums!

# ╔═╡ a06e9b7c-f9aa-41ee-8b42-622f9def2632
@generated function horner_gen_expr2(::Type{Val{c}}, x) where {c}
    N = length(c)
    r = :($(c[N]))

    for k in N-1:-1:1
        r = :(x * $r + $(c[k]))
    end

    Core.println(string(r))
    return r
end

# ╔═╡ 94089371-dd8f-4a4c-b4c0-47a62af12ae5
horner_gen_expr2(Val{t}, 10)

# ╔═╡ e9b7cff0-c928-4658-80c3-2b3edd942822
@generated function horner_gen2(::Type{Val{c}}, x) where {c}
    N = length(c)
    r = Expr[]
    push!(r, :(y = $(c[N])))

    for k in N-1:-1:1
        push!(r, :(y = x * y + $(c[k])))
    end
 
    r = :(begin $(r...) end)
    Core.println(string(Base.remove_linenums!(r)))
    return r
end

# ╔═╡ 1abc4779-9c0b-4e28-9380-a3614d643a77
horner_gen2(Val{t}, 10)

# ╔═╡ 779091e1-8684-4769-abc7-45e2e4eb4049
@ct_enable function horner_ct2(@ct(c), x)
    @ct(N = length(c))
    y = @ct(c[N])

    @ct_ctrl for k in N-1:-1:1
        y = x * y + @ct(c[k])
    end

    return y
end

# ╔═╡ c0055026-2c6c-4c2e-97e0-61e171131391
runtime(horner_ct2, t, 10)

# ╔═╡ bde86d01-95e1-4d4c-ad5d-b77d0967f167
@code_lowered runtime(horner_ct2, t, 10)

# ╔═╡ 03920375-6245-4d13-be19-153fc10cb0a2
debug(horner_ct2, Val{t}, 10) |> Base.remove_linenums!

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CompTime = "0fb5dd42-039a-4ca4-a1d7-89a96eae6d39"
InteractiveUtils = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[compat]
CompTime = "~0.1.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.2"
manifest_format = "2.0"
project_hash = "a14d3788b60e6456ac28d5694edac9759a9dd47e"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CompTime]]
deps = ["MLStyle", "MacroTools"]
git-tree-sha1 = "8c05059bc293a17f71cae4cd58b1fc18d4ede271"
uuid = "0fb5dd42-039a-4ca4-a1d7-89a96eae6d39"
version = "0.1.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.MLStyle]]
git-tree-sha1 = "bc38dff0548128765760c79eb7388a4b37fae2c8"
uuid = "d8e11817-5142-5d16-987a-aa16d5891078"
version = "0.4.17"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"
"""

# ╔═╡ Cell order:
# ╠═cebd7545-6d82-4ed0-89b5-80d4bae4e0d8
# ╟─e479c76b-a9c8-465f-8c64-f5e7a31167d1
# ╟─9b0ad92e-73b8-4fd3-9872-56b868512645
# ╠═9e70a350-2a1b-44a1-889d-022f156d0f5e
# ╠═b637221d-8502-41ff-b5ad-b313277bb785
# ╠═426fbe49-04a0-47a9-a5a1-e12773bfdef4
# ╠═af589346-a764-4d71-af72-26d6a63b7118
# ╠═b9ec0ea0-20b0-484e-94f5-41629be3358f
# ╠═272ae93c-6ce9-422b-8f0b-c2f7ff64cb0c
# ╠═03b26fc7-6b6b-44bc-803e-632078d46adc
# ╠═b1e75368-e048-4d66-9c68-07938ec07492
# ╠═f760d207-042b-40b4-9de3-59a9e429ac40
# ╠═d0e2a985-8495-4be6-ab66-f333d4b02d89
# ╠═4118ee5d-b3b2-4ee6-aab9-7dd73b3edc57
# ╠═c9b80449-3e9a-4480-ab45-34c21a07e47d
# ╠═16504c6a-7a4e-4dcc-9817-094df389ad1a
# ╠═577ec0ad-8607-414f-be5c-90e272b6a04f
# ╠═eeb3d90a-0b82-474f-ad50-58f2b2332bca
# ╠═72bbf28c-c9c5-4084-8c35-299b0d48e2f1
# ╠═a06e9b7c-f9aa-41ee-8b42-622f9def2632
# ╠═94089371-dd8f-4a4c-b4c0-47a62af12ae5
# ╠═e9b7cff0-c928-4658-80c3-2b3edd942822
# ╠═1abc4779-9c0b-4e28-9380-a3614d643a77
# ╠═779091e1-8684-4769-abc7-45e2e4eb4049
# ╠═c0055026-2c6c-4c2e-97e0-61e171131391
# ╠═bde86d01-95e1-4d4c-ad5d-b77d0967f167
# ╠═03920375-6245-4d13-be19-153fc10cb0a2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
