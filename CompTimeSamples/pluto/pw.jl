### A Pluto.jl notebook ###
# v0.19.41

using Markdown
using InteractiveUtils

# ╔═╡ ca63731b-3eb9-4212-9894-227cd2703101
using CompTime, InteractiveUtils

# ╔═╡ 2615b13e-f24a-42f0-98a1-ba1175e1b8ac
function pw_rec(n, x)
    if iszero(n)
        one(x)
    else
        x * pw_rec(n - 1, x)
    end
end

# ╔═╡ 564a47cf-08a2-4417-8177-aba852fcd09a
pw_rec(3, "Abc")

# ╔═╡ e36bf4db-8c7c-4bcd-90d9-c62fdda91039
function pw_loop(n, x)
    r = one(x)
    for i in 1:n
        r = r * x
    end
    return r
end

# ╔═╡ 66dddcdb-ae80-46f1-a62f-591d2f3d609f
pw_loop(3, "Abc")

# ╔═╡ 7f5b3995-9ec7-4299-95a0-0d2beef2c713
@ct_enable function pw_ct(@ct(n), x)
    r = one(x)
    @ct_ctrl for i in 1:n
        r = r * x
    end
    return r
end

# ╔═╡ 3f2b7ab1-b1d7-4272-9fc3-9a1c0f732677
pw_ct(n, x) = pw_ct(Val{n}, x)

# ╔═╡ 870dff35-80c9-437a-8693-7b05ba4f79cc
pw_ct(3, "Abc")

# ╔═╡ 13cdfeb3-6153-4e88-a001-f2d431c9faea
runtime(pw_ct, 3, "Abc")

# ╔═╡ 3a67af9e-fe32-42ae-836b-dd0f551fed08
comptime(pw_ct, Val{3}, "Abc")

# ╔═╡ 3fd393fb-34f1-4a09-b6a9-27cb57ebaff7
@code_typed pw_ct(Val{3}, 10)

# ╔═╡ 3b0820d8-4108-4253-98e1-58fe602545ef
@code_lowered runtime(pw_ct, 3, 10)

# ╔═╡ 23df68f5-6be7-46f5-9a50-58d07b90edab
debug(pw_ct, Val{3}, 10) |> Base.remove_linenums!

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
# ╠═ca63731b-3eb9-4212-9894-227cd2703101
# ╠═2615b13e-f24a-42f0-98a1-ba1175e1b8ac
# ╠═564a47cf-08a2-4417-8177-aba852fcd09a
# ╠═e36bf4db-8c7c-4bcd-90d9-c62fdda91039
# ╠═66dddcdb-ae80-46f1-a62f-591d2f3d609f
# ╠═7f5b3995-9ec7-4299-95a0-0d2beef2c713
# ╠═3f2b7ab1-b1d7-4272-9fc3-9a1c0f732677
# ╠═870dff35-80c9-437a-8693-7b05ba4f79cc
# ╠═13cdfeb3-6153-4e88-a001-f2d431c9faea
# ╠═3a67af9e-fe32-42ae-836b-dd0f551fed08
# ╠═3fd393fb-34f1-4a09-b6a9-27cb57ebaff7
# ╠═3b0820d8-4108-4253-98e1-58fe602545ef
# ╠═23df68f5-6be7-46f5-9a50-58d07b90edab
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
