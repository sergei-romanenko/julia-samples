### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 98c40ace-6760-4465-b27c-9506eeb1870f
using StaticNumbers

# ╔═╡ e68578e0-64f1-11ec-0f13-0f15a1e7a60a
abstract type Peano end

# ╔═╡ 4d496de2-2e33-42a3-8f97-1d2956fe4b0b
struct Zero <: Peano end

# ╔═╡ 453ef133-b302-4088-beeb-8c389c978830
struct Succ <: Peano
	prev::Peano
end

# ╔═╡ bcc1bf85-af16-439a-9815-3a44e42e7e94
typeof(Peano)

# ╔═╡ d2a389b4-bfa4-4344-adaa-c9fd540876e0
p0 = Zero()

# ╔═╡ a977f118-619e-43d2-9a9c-bd26b53102ea
p1 = Succ(p0)

# ╔═╡ 590a891e-7e0a-46e0-b71a-a827be16dda7
typeof(p1)

# ╔═╡ 695708b6-e672-477b-b7fc-126db5b52852
p1.prev

# ╔═╡ 463f5cea-b88e-4ee2-b87f-cac4c90bb379
p2 = Succ(p1)

# ╔═╡ 62c18c17-35c9-43d1-94d2-eb705bec4b59
p3 = Succ(p2)

# ╔═╡ 67b4432f-bad2-4410-8cd1-c517d20514b8
Succ(Zero()) == p1

# ╔═╡ 6063a09d-5725-4657-ae15-68eede3ad8ec
add(x::Zero, y::Peano) = y

# ╔═╡ 6e7ab652-dad4-4708-a927-eb38adf0b713
add(x::Succ, y::Peano) = Succ(add(x.prev, y))

# ╔═╡ 0508e086-2abb-4ea4-9dc4-8d7ebae2e46c
add(p2, p3)

# ╔═╡ 65a7f0f1-e9c5-4da6-8ac1-2cbf2474b41b
@code_typed add(p1, p2)

# ╔═╡ e979fae3-c4fb-41b5-9403-a074fc0adb7d
repeat(n::Zero, a) = a

# ╔═╡ c200d081-d837-42ec-a374-fc475ed46065
repeat(n::Succ, a) = (a, repeat(n.prev, a))

# ╔═╡ bca31ce7-03d0-4c54-b161-b62eb0c036ee
repeat(p3, "a")

# ╔═╡ 847e1776-217e-4027-a436-eeb897be6661
@code_typed repeat(p3, "a")

# ╔═╡ 62a5fe50-706f-4d92-b943-b58c778e8f82
@code_native repeat(p2, "a")

# ╔═╡ c68c8a24-b7b2-4f3a-b0a9-8589d8402e21
pw(n::Zero, x) = one(x)

# ╔═╡ 5f0074fe-3b81-4d72-8cc2-49d0627ade3d
pw(n::Succ, x) = x * pw(n.prev, x)

# ╔═╡ b1ad5ab3-35b9-45be-a3c2-68be7b5dd44c
md"```
ackermann(Z, n) = S(n);
ackermann(S(m), Z) = ackermann(m, S(Z));
ackermann(S(m), S(n)) = ackermann(m, a(S(m), n));
```"

# ╔═╡ ff8b3d01-c745-4177-8555-adf4af1562c6
ackerman(m::Zero, n::Peano) = Succ(n)

# ╔═╡ d4d55ca6-b26a-4ff9-a73a-bfa7937ce32b
ackerman(m::Succ, n::Zero) = ackerman(m.prev, Succ(Zero()))

# ╔═╡ 7fe8815e-4455-478c-a9e8-df348b2ef7fa
ackerman(m::Succ, n::Succ) = ackerman(m.prev, ackerman(m, n.prev))

# ╔═╡ f05474ae-44f7-4045-8061-ccdf9e7646ca
ackerman(p3, p1)

# ╔═╡ 98b38c8d-ab76-4a55-a358-b59dd31bf1a0
(@which ackerman(p3, p1)).specializations

# ╔═╡ d24d8a74-5724-43f8-b05a-35cb4eabeccc
typeof(Val(99))

# ╔═╡ 9584b973-84ba-4421-83c4-0fb340d94635
supertype(typeof(99))

# ╔═╡ 7b5f12e8-dd34-42c8-8fcd-824ab57e7139
supertype(typeof(Val(99)))

# ╔═╡ c4553a69-01ec-4b96-8c95-25d3391e0ed6
typeof(Val((1,2,(3,4))))

# ╔═╡ ad26e335-3284-4a6b-bc36-974e7ce05fd5
get_val(::Val{n}) where {n} = n

# ╔═╡ 493f15cb-e066-42e3-8e76-01ad237d2b35
get_val(Val(99))

# ╔═╡ 0f163aa8-7785-4d78-b12f-2f2e1c82da17
get_val(Val((1,2,(3,4))))

# ╔═╡ d8ef6679-f634-4bbb-a10f-06079ce42eb3
get_val(Val((:L,:D)))

# ╔═╡ f631a6d0-c2e4-4243-9702-3be2a7237d1d
pw(::Val{0}, x) = one(x)

# ╔═╡ 9d731d6b-5180-4f11-a966-51fa7de0a251
pw(::Val{n}, x) where {n} = x * pw(Val(n-1), x)

# ╔═╡ 9b5de860-368d-42d9-ba4f-cebc1d3610ad
pw(n::Integer, x) = pw(Val(n), x)

# ╔═╡ 776a9346-07f5-4f39-8b9a-e4a2e13c8961
pw(p2, 2.0)

# ╔═╡ fffb41f7-1fde-44d3-8523-d81190763afc
@code_typed pw(p2, 2.0)

# ╔═╡ 7f2602cc-5d85-45ab-9827-5e58556d39ec
pw(Val(3), "a")

# ╔═╡ ef819a93-64e5-4611-9bb9-80382a726fc9
@code_typed pw(Val(5), 10)

# ╔═╡ b54a9098-d4e2-4c1b-a3e7-20a116605a8d
pw(3, "a")

# ╔═╡ f46790cd-c972-488a-8a0d-4ddc68f33f1f
function pw_d(n, x)
	if iszero(n)
		one(x)
	else
		x* pw_d(n-1, x)
	end
end

# ╔═╡ f15650d2-40ed-4e9a-a13d-db07e254a23c
pw_d(3, 2)

# ╔═╡ a9d270fa-991e-4855-a878-0ab219ba11a7
@code_typed pw_d(3,2)

# ╔═╡ b00e15fc-cc2a-43b4-9cee-298e0513ea21
function pw_s(n, x)
	if iszero(n)
		one(x)
	else
		x* pw_s(static(n-1), x)
	end
end

# ╔═╡ 0d8fc9cf-91e6-4aad-a2b0-a7f377410c8b
pw_s(static(3),2)

# ╔═╡ 49fc67bd-abc5-4af4-afaa-138deec140f0
@code_typed pw_s(static(3),2)

# ╔═╡ cb88ed96-2134-4c78-9a42-3e9b2243e4db
function tail(a::NTuple{N,T})::NTuple{N-1,T} where {N,T}
    ntuple(i -> a[i+1], Val(N-1))
end

# ╔═╡ 68591fc5-91fb-40ac-a18c-23325f65a24f
function one_of1(::Val{s}, x) where {s}
	if s == ()
		return false
	elseif x == first(s)
		return true
	else
		one_of1(Val(tail(s)), x)
	end
end

# ╔═╡ 20aeba94-ea4c-4c41-93b1-76be02c9aec9
one_of1(s::NTuple{N,T}, x::T) where {N,T} = one_of1(Val(s), x)

# ╔═╡ 4344c5ef-3090-40a0-bee1-106d318f314f
one_of1((:A, :B, :C), :D)

# ╔═╡ 77f3818a-6a2c-4d67-91ba-ff0bbac0981a
@code_typed one_of1(Val((:A, :B, :C)), :D)

# ╔═╡ 66051b55-dbe3-4c0a-9df9-fbfcfecbd5cb
function one_of(::Val{s}, ::Val{k}, x) where {s, k}
	if k == 0
		false
	elseif s[length(s) - k + 1] == x
		true
	else
		one_of(Val(s), Val(k-1), x)
	end
end

# ╔═╡ 77709bc8-866b-4ac6-a878-b40023e0d80a
one_of(s::NTuple, x) = one_of(Val(s), Val(length(s)), x)

# ╔═╡ 46183568-4cfd-424c-9732-4f2196ee0156
one_of((:A, :B, :C), :B)

# ╔═╡ 06d32139-d917-43f2-abc9-97cbbfc87632
@code_typed one_of(Val((:A, :B, :C)), Val(3), :D)

# ╔═╡ 3422e457-2b7a-4866-9cdc-fbac7d926cb9
@code_typed one_of(Val((:A, :B)), Val(2), :D)

# ╔═╡ 14422809-0fec-4479-b75b-edc617687f04
(@which one_of(Val((:A, :B, :C)), Val(3), :D)).specializations

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
StaticNumbers = "c5e4b96a-f99f-5557-8ed2-dc63ef9b5131"

[compat]
StaticNumbers = "~0.3.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "8f82019e525f4d5c669692772a6f4b0a58b06a6a"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.2.0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[StaticNumbers]]
deps = ["Requires"]
git-tree-sha1 = "a0df7d5ade3fd0f0e6c93ad63facc05b12c40e6a"
uuid = "c5e4b96a-f99f-5557-8ed2-dc63ef9b5131"
version = "0.3.3"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
"""

# ╔═╡ Cell order:
# ╠═e68578e0-64f1-11ec-0f13-0f15a1e7a60a
# ╠═4d496de2-2e33-42a3-8f97-1d2956fe4b0b
# ╠═453ef133-b302-4088-beeb-8c389c978830
# ╠═bcc1bf85-af16-439a-9815-3a44e42e7e94
# ╠═d2a389b4-bfa4-4344-adaa-c9fd540876e0
# ╠═a977f118-619e-43d2-9a9c-bd26b53102ea
# ╠═590a891e-7e0a-46e0-b71a-a827be16dda7
# ╠═695708b6-e672-477b-b7fc-126db5b52852
# ╠═463f5cea-b88e-4ee2-b87f-cac4c90bb379
# ╠═62c18c17-35c9-43d1-94d2-eb705bec4b59
# ╠═67b4432f-bad2-4410-8cd1-c517d20514b8
# ╠═6063a09d-5725-4657-ae15-68eede3ad8ec
# ╠═6e7ab652-dad4-4708-a927-eb38adf0b713
# ╠═0508e086-2abb-4ea4-9dc4-8d7ebae2e46c
# ╠═65a7f0f1-e9c5-4da6-8ac1-2cbf2474b41b
# ╠═e979fae3-c4fb-41b5-9403-a074fc0adb7d
# ╠═c200d081-d837-42ec-a374-fc475ed46065
# ╠═bca31ce7-03d0-4c54-b161-b62eb0c036ee
# ╠═847e1776-217e-4027-a436-eeb897be6661
# ╠═62a5fe50-706f-4d92-b943-b58c778e8f82
# ╠═c68c8a24-b7b2-4f3a-b0a9-8589d8402e21
# ╠═5f0074fe-3b81-4d72-8cc2-49d0627ade3d
# ╠═776a9346-07f5-4f39-8b9a-e4a2e13c8961
# ╠═fffb41f7-1fde-44d3-8523-d81190763afc
# ╟─b1ad5ab3-35b9-45be-a3c2-68be7b5dd44c
# ╠═ff8b3d01-c745-4177-8555-adf4af1562c6
# ╠═d4d55ca6-b26a-4ff9-a73a-bfa7937ce32b
# ╠═7fe8815e-4455-478c-a9e8-df348b2ef7fa
# ╠═f05474ae-44f7-4045-8061-ccdf9e7646ca
# ╠═98b38c8d-ab76-4a55-a358-b59dd31bf1a0
# ╠═d24d8a74-5724-43f8-b05a-35cb4eabeccc
# ╠═9584b973-84ba-4421-83c4-0fb340d94635
# ╠═7b5f12e8-dd34-42c8-8fcd-824ab57e7139
# ╠═c4553a69-01ec-4b96-8c95-25d3391e0ed6
# ╠═ad26e335-3284-4a6b-bc36-974e7ce05fd5
# ╠═493f15cb-e066-42e3-8e76-01ad237d2b35
# ╠═0f163aa8-7785-4d78-b12f-2f2e1c82da17
# ╠═d8ef6679-f634-4bbb-a10f-06079ce42eb3
# ╠═f631a6d0-c2e4-4243-9702-3be2a7237d1d
# ╠═9d731d6b-5180-4f11-a966-51fa7de0a251
# ╠═7f2602cc-5d85-45ab-9827-5e58556d39ec
# ╠═ef819a93-64e5-4611-9bb9-80382a726fc9
# ╠═9b5de860-368d-42d9-ba4f-cebc1d3610ad
# ╠═b54a9098-d4e2-4c1b-a3e7-20a116605a8d
# ╠═98c40ace-6760-4465-b27c-9506eeb1870f
# ╠═f46790cd-c972-488a-8a0d-4ddc68f33f1f
# ╠═f15650d2-40ed-4e9a-a13d-db07e254a23c
# ╠═a9d270fa-991e-4855-a878-0ab219ba11a7
# ╠═b00e15fc-cc2a-43b4-9cee-298e0513ea21
# ╠═0d8fc9cf-91e6-4aad-a2b0-a7f377410c8b
# ╠═49fc67bd-abc5-4af4-afaa-138deec140f0
# ╠═cb88ed96-2134-4c78-9a42-3e9b2243e4db
# ╠═68591fc5-91fb-40ac-a18c-23325f65a24f
# ╠═20aeba94-ea4c-4c41-93b1-76be02c9aec9
# ╠═4344c5ef-3090-40a0-bee1-106d318f314f
# ╠═77f3818a-6a2c-4d67-91ba-ff0bbac0981a
# ╠═66051b55-dbe3-4c0a-9df9-fbfcfecbd5cb
# ╠═77709bc8-866b-4ac6-a878-b40023e0d80a
# ╠═46183568-4cfd-424c-9732-4f2196ee0156
# ╠═06d32139-d917-43f2-abc9-97cbbfc87632
# ╠═3422e457-2b7a-4866-9cdc-fbac7d926cb9
# ╠═14422809-0fec-4479-b75b-edc617687f04
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
