using JuMP
using Ipopt
using MathOptInterface

MonModel = Model(Ipopt.Optimizer)
@variable(MonModel, x₁) #on peut avoir plusieurs types de variables
@variable(MonModel, x₂)
@objective(MonModel, Min, 100*((x₂ - x₁^2)^2)+(1-x₁)^2)
JuMP.optimize!(MonModel)

@show JuMP.value(x₁)              
@show JuMP.value(x₂)            
@show JuMP.objective_value(MonModel)