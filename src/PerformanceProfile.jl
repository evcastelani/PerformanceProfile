module PerformanceProfile

using Plots

export perfomance_profile

function perfomance_profile(c)
    cmin = minimum(c,dims=2)
    R = c ./ cmin
    t = sort(unique(R))
    if t[end] == Inf
        pop!(t)
    end
    plot(xaxis=:log)
    for i = 1:size(c, 2)
        plot!(t, [sum(R[:,i] .<= ti)/size(c,1) for ti in t], label="Alg $i", t=:steppre, lw=2)
    end
    ylims!(0, 1)
end
end # module
