using LinearAlgebra
using Plots
using JLD
using HDF5


#save("Fig2a.jld","Time0",Time0,"PE0",PE0,"TimeX1",TimeX1,"PE1",PE1,"TimeX2",TimeX2,"PE2",PE2)
η=0.0
γ=0.5



AAA=load("Fig2a.jld")


Time0=AAA["Time0"]
TimeX1=AAA["TimeX1"]
TimeX2=AAA["TimeX2"]

PE0=AAA["PE0"] ### 微分方程
PE2=AAA["PE2"]  ### 2-Dilation
PE1=AAA["PE1"]  ### 1-Dilation





Ocircle = Shape([(2.5*cos(θ), 1.5*sin(θ)) for θ in range(0, 2π, length=100)])
Cred=RGB(210/255, 0/255, 0/255)
Cbule=RGB(64/255, 120/255, 235/255)
ColorS=[Cbule :black Cred]
LStyleS=[:solid :dot   Ocircle]
LabelS=[" LME" " 2D" " 1D"]



plot(framestyle = :box) # label=nothing 
plot!(Time0,PE0, label=LabelS[1],lw=8,color=ColorS[1],ls=LStyleS[1])
plot!(TimeX2,PE2, label=LabelS[2], lw=8,color=ColorS[2],ls=LStyleS[2])
# scatter!(TimeX1,PE1,ms=5,mcolor=ColorS[3],shape=LStyleS[3], label=LabelS[3],alpha=0.85) 
scatter!(TimeX1,PE1,label=LabelS[3], shape=LStyleS[3], markercolor=:transparent, markerstrokecolor=ColorS[3], markerstrokewidth=1.5, markerstrokealpha=0.7)
annotate!(
    title="η=$η",titlefont= (23, :black),
    # xlabel="t",xguidefont = (25, :darkgreen), 
    # ylabel="Pₑ",yguidefont = (25, :darkgreen),
    xtickfont =("Palatino Bold", 22 ),
    ytickfont =("Palatino Bold", 22),
    legendfont=( 15 ),
    #legend=:bottomleft,
    #xlims=(-0.05, 15.1),
    ylims=(-0.05, 1.1),
    #xticks=0:T÷4:T,xtickfont =15,
    #ytickfont =15
    #yticks=0:0.5:1, #ytickfont =15
    )



savefig("Exampke_Fig2a.png")








