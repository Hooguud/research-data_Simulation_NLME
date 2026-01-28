#### Fig3b
using LinearAlgebra
using Plots
using JLD
using HDF5
using LsqFit


J=1.0
Δ=2.0
γ=0.5
L=5
TrajN=100000

dtS=[1.0,0.5,0.2,0.1,0.05,0.02,0.01]

#####  save("DataErorr_dt($dt)_TrajN($TrajN)_L($L)_Δ($Δ)_γ($γ).jld","Ero",Ero,"dt",dt,"TrajN",TrajN,"T",T,"L",L,"J",J,"Δ",Δ,"γ",γ,"UseTime",UseTime)

ErorrS=zeros(Float64,length(dtS))
for j=1:length(dtS)
    local AAA=load("DataErorr_dt($(dtS[j]))_TrajN($TrajN)_L($L)_Δ($Δ)_γ($γ).jld")
    global ErorrS[j]=AAA["Ero"]
end



#### z=1/dt， log(E)=p2*log(z)+p1
### E=e^p1 * z^p2=C*dt^(-p2) 
z=ones(length(dtS))./dtS 

@. model(x, p) = p[1] + p[2]*x
p0 = [0.0, -2.0]
fit = curve_fit(model, log.(z), log.(ErorrS), p0)
p = fit.param 
yfit=x-> exp(p[1])*x^p[2]



plot([0.5;200],yfit.([0.5;200]),lw=2,label="y=-0.81x-2.86")
scatter!(z,ErorrS,markersize=6,marker=:circle,label=nothing)
annotate!(
    xscale=:log10, 
    yscale=:log10,
    xlabel="1/δt",
    ylabel="Error",
    #legend=:right,
    legendfontsize=12,
    ytickfont =15,
    xtickfont =15,
    size=(800, 400),
    )
savefig("ErrorS_L($L)_Δ($Δ)_γ($γ)_TN($TrajN).png")

 





