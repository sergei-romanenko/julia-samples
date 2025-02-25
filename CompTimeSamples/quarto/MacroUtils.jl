module MacroUtils

export cleanup

using MacroTools

function rmcst1(ex)
    isexpr(ex, :try) && error("rmcst: not implemented for try")
    isexpr(ex, :block) || return ex
    length(ex.args) > 1 || return ex
    r = Expr(:block)
    l = length(ex.args)
    for i in 1 : l - 1
        # @show ex.args[i]
        typeof(ex.args[i]) === Expr && push!(r.args, ex.args[i])
    end
    push!(r.args, ex.args[l])
    # Don't use `unblock` to preserve line nos.
    return length(r.args) == 1 ? r.args[1] : r
  end

rmcst(ex) = MacroTools.prewalk(rmcst1, ex)

cleanup = rmcst ∘ prettify

# using Test

# println(rmcst1(99))
# println(rmcst1(prettify(quote x=1; 99; x=2 end)))
# println(rmcst1(prettify(quote x=1; 91; x=2; 92 end)))

# println(rmlines(rmcst(quote x=1; 91; begin 81; x=2; 82 end; 92 end)))

# println(cleanup(quote x=1; 91; begin 81; x=2; 82 end; 92 end))

end
