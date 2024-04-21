### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ 00be8f23-f179-49a1-8b1a-a663394384bb
using CompTime, InteractiveUtils

# ╔═╡ 6acc06ef-985b-4428-90d5-1f3d7e0610ef
function mult_vec(v::AbstractVector{T}) where {T}
    l = length(v)
    r = one(T)
    for i in 1:l
        r = r * v[i]
    end
    return r
end

# ╔═╡ c657f8e1-732f-4669-8ab9-abc9914dd512
mult_vec(["a", "b", "c"])

# ╔═╡ 895d6e84-572a-487f-9e1b-e19454ba2199
@ct_enable function mult_vec_ct(v::AbstractVector{T}, @ct(l)) where {T}
    r = one(T)
    @ct_ctrl for i in 1:l
        r = r * v[@ct(i)]
    end
    return r
end

# ╔═╡ 8e7f2b76-47e0-481d-80f5-6aa1e3d42d0c
mult_vec_ct(v::AbstractVector{T}) where {T} = mult_vec_ct(v, Val{length(v)})

# ╔═╡ 0fc46036-0ba1-4dc4-a248-211ee389d9fa
mult_vec_ct(["a", "b", "c"], Val{3})

# ╔═╡ 973ee136-c9e6-4853-a467-c884893707a3
mult_vec_ct(["a", "b", "c"])

# ╔═╡ b18a1bf8-8ed0-46a6-823f-3681bf8dc551
@code_typed mult_vec_ct([3, 4, 5], Val{3})

# ╔═╡ 86bc6358-50ce-496e-9101-9b2db1b308f2
debug(mult_vec_ct, [3, 4, 5], Val{3}) |> Base.remove_linenums!

# ╔═╡ efaececd-5012-46c3-8f4f-4ef2ec97965d
@ct_enable function mult_vec_adaptive(v::AbstractVector{T}, @ct(l)) where {T}
    r = one(T)
    @ct_ctrl if l < 5
        @ct_ctrl for i in 1:l
            r = r * v[@ct(i)]
        end
    else
        for i in 1:l
            r = r * v[i]
        end
    end
    return r
end

# ╔═╡ f1142e0f-5aa3-4702-a493-b56ce16736ca
mult_vec_adaptive(["a", "b", "c", "d","e"], Val{5})

# ╔═╡ 4f4c826e-69b4-429c-ae13-1c494673bb71
debug(mult_vec_adaptive, ["a", "b", "c", "d","e"], Val{5}) |> Base.remove_linenums!

# ╔═╡ 37381a83-5571-48a9-9a50-8fe9a2a07226
mult_vec_adaptive(["a", "b", "c"], Val{3})

# ╔═╡ 1bfc9a6a-8dd6-4b36-858b-459ac4040a5e
debug(mult_vec_adaptive, ["a", "b", "c"], Val{3}) |> Base.remove_linenums!

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
# ╠═00be8f23-f179-49a1-8b1a-a663394384bb
# ╠═6acc06ef-985b-4428-90d5-1f3d7e0610ef
# ╠═c657f8e1-732f-4669-8ab9-abc9914dd512
# ╠═895d6e84-572a-487f-9e1b-e19454ba2199
# ╠═0fc46036-0ba1-4dc4-a248-211ee389d9fa
# ╠═8e7f2b76-47e0-481d-80f5-6aa1e3d42d0c
# ╠═973ee136-c9e6-4853-a467-c884893707a3
# ╠═b18a1bf8-8ed0-46a6-823f-3681bf8dc551
# ╠═86bc6358-50ce-496e-9101-9b2db1b308f2
# ╠═efaececd-5012-46c3-8f4f-4ef2ec97965d
# ╠═f1142e0f-5aa3-4702-a493-b56ce16736ca
# ╠═4f4c826e-69b4-429c-ae13-1c494673bb71
# ╠═37381a83-5571-48a9-9a50-8fe9a2a07226
# ╠═1bfc9a6a-8dd6-4b36-858b-459ac4040a5e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
