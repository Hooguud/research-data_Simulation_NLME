#### Fig.3a

using LinearAlgebra
using Plots
using LaTeXStrings
using JLD
using HDF5


J=1.0
Δ=2.0
γ=0.5
L=5
dt=0.1
TrajN1=100
TrajN2=1000

#####  save("DataDoubleXXZ_L($L)_Δ($Δ)_γ($γ).jld","tlist",tlist,"n1_t",n1_t,"Czz_t",Czz_t,"rhoT",rhoT,"T",T,"J",J,"Δ",Δ,"γ",γ,"L",L,"UseTime",UseTime)
#####  save("DataOneXXZ_dt($dt)_Tj($TrajN)_L($L)_Δ($Δ)_γ($γ).jld","TX",TX,"Pl_mean",Pl_mean,"AC_mean",AC_mean,"PlSE",PlSE,"ACSE",ACSE,"dt",dt,"TrajN",TrajN,"T",T,"J",J,"Δ",Δ,"γ",γ,"L",L,"UseTime",UseTime)

AAA0=load("DataDoubleXXZ_L($L)_Δ($Δ)_γ($γ).jld")
AAA1=load("DataOneXXZ_dt($dt)_Tj($TrajN1)_L($L)_Δ($Δ)_γ($γ).jld")
AAA2=load("DataOneXXZ_dt($dt)_Tj($TrajN2)_L($L)_Δ($Δ)_γ($γ).jld")
### 标
tlist=AAA0["tlist"]
n1_t=AAA0["n1_t"]
Czz_t=AAA0["Czz_t"]

### 
dt=AAA1["dt"]
TrajN=AAA1["TrajN"]

TX1=AAA1["TX"]
Pl_mean1=AAA1["Pl_mean"]
AC_mean1=AAA1["AC_mean"]
PlSE1=AAA1["PlSE"]
ACSE1=AAA1["ACSE"]

TX2=AAA2["TX"]
Pl_mean2=AAA2["Pl_mean"]
AC_mean2=AAA2["AC_mean"]
PlSE2=AAA2["PlSE"]
ACSE2=AAA2["ACSE"]


plot(framestyle = :box) 
plot!(tlist,n1_t)
scatter!(TX1,Pl_mean1,yerror=PlSE1)
plot!(tlist,Czz_t)
scatter!(TX1,AC_mean1,yerror=ACSE1)
# annotate!(
#     ylims=(-0.05, 1.1),
#     )
savefig("DXXZ_L($L)_Δ($Δ)_γ($γ)_dt($dt)_Tj($TrajN1).png")


plot(framestyle = :box) 
plot!(tlist,n1_t,lw=4,ls=:dash, label="P₁")
scatter!(TX1,Pl_mean1,yerror=PlSE1, label="100")
scatter!(TX2,Pl_mean2,yerror=PlSE2,shape=:diamond, label="1000")
plot!(tlist,Czz_t,lw=4,ls=:solid, label=L"C_{zz}")
scatter!(TX1,AC_mean1,yerror=ACSE1, label="100")
scatter!(TX2,AC_mean2,yerror=ACSE2,shape=:diamond, label="1000")
annotate!(
    legend=:right,
    legendfontsize=10,
    ytickfont =12,
    xtickfont =12,
)
savefig("DXXZ_L($L)_Δ($Δ)_γ($γ)_dt($dt).png")



