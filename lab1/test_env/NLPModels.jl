using ADNLPModels 
using NLPModels 
using NLPModelsJuMP 
using NLPModelsIpopt 



#Initialize the objective function, and an initial guess
f(x) = (x[1] - 1)^2 + 100*(x[2] - x[1]^2)^2
x0 = [-1.2; 1.0]

#Create an ADNLPModel
nlp = ADNLPModel(f, x0)
stats = ipopt(nlp)
print(stats)