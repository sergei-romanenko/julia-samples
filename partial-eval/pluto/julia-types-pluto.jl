### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ ca5ed873-5631-4b50-812f-94004249f58e
md"Dynamic typing"

# ╔═╡ 1b7097ce-6707-11ec-235a-8f4d0ab5b63b
sq(x) = x * x

# ╔═╡ 41ff9cd5-f2f6-49c1-b539-c23f39b719eb
function sq2(x)
	x * x
end

# ╔═╡ 81851928-547f-40a9-9e6f-cad75e806140
sq(3)

# ╔═╡ b2c14ae5-8f15-4543-9c9d-ca9df7be4bc6
sq("abc")

# ╔═╡ 91fb5801-dd3c-4499-858c-ba3d5d2fb0f1
@code_typed sq(3)

# ╔═╡ edd6f467-cee5-4def-8d6e-e53d29f2edd1
@code_typed sq("abc")

# ╔═╡ bf665fe3-9eca-4440-882b-8ccb2771442d
function pw(n, x)
	if iszero(n)
		one(x)
	else
		x * pw(n-1, x)
	end
end

# ╔═╡ 0a4d1abc-d7d2-4589-ae62-cb68913e8615
pw(4,2)

# ╔═╡ c23173d7-4c72-4d1f-8968-f809f12783a9
pw(4, "Ab")

# ╔═╡ 32aa3d71-b68f-49e5-bea5-72e2893b8040
iszero(0)

# ╔═╡ 68e7db4c-b664-43c7-9aa5-b47d4e4acc62
one("a")

# ╔═╡ cd9c044b-3f64-4571-8b2f-416a448d6871
one(25)

# ╔═╡ 7024de78-b572-4183-b5a2-4e0ac8c30cf0
one(25.0)

# ╔═╡ ba9db5f2-e750-48f5-8d03-a2cb43c84d44
typeof("a")

# ╔═╡ 647bc942-879e-4945-a833-007a3983a0db
typeof(10)

# ╔═╡ 5546cb43-c313-447a-8ea7-71429d66460c
function type_to_str(x)
	t = typeof(x)
	if t === Int64
		"Int64"
	elseif t === String
		"String"
	else
		"Unknown"
	end
end

# ╔═╡ c5cbd348-e118-4676-970d-0a223cad7bd8
type_to_str("a")

# ╔═╡ 958c5b96-2c94-4452-ba2e-8a18c2f6cdb4
type_to_str(3.14)

# ╔═╡ 6b1f1e2b-32f9-41d7-8ae6-86a51e042f6c
type_to_str2(x::Int64) = "Int64"

# ╔═╡ 638513f1-5e0a-46f5-abb0-bc2c099f792c
type_to_str2(x::String) = "String"

# ╔═╡ 2eb3bd9a-cb0b-49a7-aec8-e70a496d7799
type_to_str2(x) = "Unknown"

# ╔═╡ d7b26550-5093-4145-b85a-9ac29786733f
type_to_str2("a")

# ╔═╡ d77f74eb-fec6-49d2-8052-dfff7d09a70d
md"Multiple dispatch"

# ╔═╡ 831a0c6a-c7e0-4730-9b18-309f090c4863
abstract type Pet end

# ╔═╡ dbb5d816-9496-4db2-9c60-b5abc0010db4
struct Dog <: Pet; name::String end

# ╔═╡ efe8a3c3-e4bf-4b6c-980d-1e13fe8e6d86
struct Cat <: Pet; name::String end

# ╔═╡ bb2b1d4b-18a1-4121-b217-fb17214f41b3
rex = Dog("Rex")

# ╔═╡ 1b14c12b-8e20-4401-a066-1d37935238f4
fido = Dog("Fido")

# ╔═╡ e01b514f-ce09-450f-b52f-ce8ae9f5fd3a
kitty = Cat("Kitty")

# ╔═╡ 15bf8af4-afab-41d7-9e62-e4e0cfc1e506
simba = Cat("Simba")

# ╔═╡ fd642905-c94b-49b1-b442-b01b05b4ae0c
meets(a::Dog, b::Dog) = "sniffs"

# ╔═╡ 7a48ab2e-0e79-4181-a7fc-3bed2b9f35d0
meets(a::Dog, b::Cat) = "chases"

# ╔═╡ e994a237-2d21-489f-8524-57d0726b0bc0
meets(a::Cat, b::Dog) = "hisses"

# ╔═╡ 33fb612e-df93-40a6-bca0-8b3876820d81
meets(a::Cat, b::Cat) = "slinks"

# ╔═╡ f98c29dc-902d-41d4-9283-bb5f2a72c5a7
function encounter(a::Pet, b::Pet)
	verb = meets(a, b)
	"$(a.name) meets $(b.name) and $verb"
end

# ╔═╡ 5f797ceb-aeab-488f-ad49-56cf93b84a4f
encounter(rex, fido)

# ╔═╡ ded2fbac-06c9-4746-84cd-2172af333277
encounter(rex, kitty)

# ╔═╡ 9e828a85-9d54-4dea-93c6-59a50646bc14
encounter(kitty, rex)

# ╔═╡ e5c5bb8f-7d6d-4ebe-b723-26800a47056f
encounter(kitty, simba)

# ╔═╡ Cell order:
# ╟─ca5ed873-5631-4b50-812f-94004249f58e
# ╠═1b7097ce-6707-11ec-235a-8f4d0ab5b63b
# ╠═41ff9cd5-f2f6-49c1-b539-c23f39b719eb
# ╠═81851928-547f-40a9-9e6f-cad75e806140
# ╠═b2c14ae5-8f15-4543-9c9d-ca9df7be4bc6
# ╠═91fb5801-dd3c-4499-858c-ba3d5d2fb0f1
# ╠═edd6f467-cee5-4def-8d6e-e53d29f2edd1
# ╠═bf665fe3-9eca-4440-882b-8ccb2771442d
# ╠═0a4d1abc-d7d2-4589-ae62-cb68913e8615
# ╠═c23173d7-4c72-4d1f-8968-f809f12783a9
# ╠═32aa3d71-b68f-49e5-bea5-72e2893b8040
# ╠═68e7db4c-b664-43c7-9aa5-b47d4e4acc62
# ╠═cd9c044b-3f64-4571-8b2f-416a448d6871
# ╠═7024de78-b572-4183-b5a2-4e0ac8c30cf0
# ╠═ba9db5f2-e750-48f5-8d03-a2cb43c84d44
# ╠═647bc942-879e-4945-a833-007a3983a0db
# ╠═5546cb43-c313-447a-8ea7-71429d66460c
# ╠═c5cbd348-e118-4676-970d-0a223cad7bd8
# ╠═958c5b96-2c94-4452-ba2e-8a18c2f6cdb4
# ╠═6b1f1e2b-32f9-41d7-8ae6-86a51e042f6c
# ╠═638513f1-5e0a-46f5-abb0-bc2c099f792c
# ╠═2eb3bd9a-cb0b-49a7-aec8-e70a496d7799
# ╠═d7b26550-5093-4145-b85a-9ac29786733f
# ╟─d77f74eb-fec6-49d2-8052-dfff7d09a70d
# ╠═831a0c6a-c7e0-4730-9b18-309f090c4863
# ╠═dbb5d816-9496-4db2-9c60-b5abc0010db4
# ╠═efe8a3c3-e4bf-4b6c-980d-1e13fe8e6d86
# ╠═bb2b1d4b-18a1-4121-b217-fb17214f41b3
# ╠═1b14c12b-8e20-4401-a066-1d37935238f4
# ╠═e01b514f-ce09-450f-b52f-ce8ae9f5fd3a
# ╠═15bf8af4-afab-41d7-9e62-e4e0cfc1e506
# ╠═f98c29dc-902d-41d4-9283-bb5f2a72c5a7
# ╠═fd642905-c94b-49b1-b442-b01b05b4ae0c
# ╠═7a48ab2e-0e79-4181-a7fc-3bed2b9f35d0
# ╠═e994a237-2d21-489f-8524-57d0726b0bc0
# ╠═33fb612e-df93-40a6-bca0-8b3876820d81
# ╠═5f797ceb-aeab-488f-ad49-56cf93b84a4f
# ╠═ded2fbac-06c9-4746-84cd-2172af333277
# ╠═9e828a85-9d54-4dea-93c6-59a50646bc14
# ╠═e5c5bb8f-7d6d-4ebe-b723-26800a47056f
