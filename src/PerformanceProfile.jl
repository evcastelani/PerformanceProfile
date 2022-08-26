module PerformanceProfile

using Plots

export perfomance_profile

function perfomance_profile(c, method = ["Alg $(i)" for i=1:size(c,2)], color = [:black,:gray])
    cmin = minimum(c,dims=2)
    R = c ./ cmin
    t = sort(unique(R))
    if t[end] == NaN
        pop!(t)
    end
    plot!(title = " ", xlabel = "Perfomance Ratio", ylabel = "Problems solved")
    plot!(xaxis=:log)
    for i = 1:size(c, 2)
        plot!(t, [sum(R[:,i] .<= ti)/size(c,1) for ti in t], label=method[i], t=:steppre, lw=2,linecolor = color[i])
    end
    ylims!(0, 1)
end
end # module
