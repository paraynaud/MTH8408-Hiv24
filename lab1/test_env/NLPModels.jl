using ADNLPModels #Pkg.add("ADNLPModels")
using NLPModels #Pkg.add("NLPModels")
using NLPModelsJuMP #Pkg.add("NLPModelsJuMP")
using NLPModelsIpopt #Pkg.add("NLPModelsIpopt")



#Initialize the objective function, and an initial guess
f(x) = (x[1] - 1)^2 + 100*(x[2] - x[1]^2)^2
x0 = [-1.2; 1.0]

#Create an ADNLPModel
nlp = ADNLPModel(f, x0)
x = zeros(2)
obj(nlp, x)
hess(nlp, x)