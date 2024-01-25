using Test

@testset "Test set for bfgs_quasi_newton_armijo" begin
	#Test problem:
	fH(x) = (x[2]+x[1].^2-11).^2+(x[1]+x[2].^2-7).^2
	x0H = [10., 20.]
	himmelblau = ADNLPModel(fH, x0H)

	problem2 = ADNLPModel(x->-x[1]^3 + x[2]^2 + x[3]^2, ones(3))

	roz(x) = 100 *  (x[2] - x[1]^2)^2 + (x[1] - 1.0)^2
	rosenbrock = ADNLPModel(roz, [-1.2, 1.0])

	f(x) = x[1]^2 * (2*x[1] - 3) - 6*x[1]*x[2] * (x[1] - x[2] - 1)
	pb_du_cours = ADNLPModel(f, [-1.001, -1.001]) #ou [1.5, .5] ou [.5, .5]


	######################################### bfgs_quasi_newton_armijo ##################

	#Unit/Validation Tests
	using Logging, Test
    ep1 = 1e-6 + norm(grad(himmelblau, himmelblau.meta.x0)) * 1e-6
	sol = bfgs_quasi_newton_armijo(himmelblau, himmelblau.meta.x0) 
	@test norm(grad(himmelblau, sol)) ≤ ep1

    ep4 = 1e-6 + norm(grad(pb_du_cours, [1.5, .5])) * 1e-6
	sol = bfgs_quasi_newton_armijo(pb_du_cours, [1.5, .5]) 
	@test norm(grad(pb_du_cours, sol)) ≤ ep4
	@test sol ≈ [1, 0] atol = ep4
	@show sol

    ep5 = 1e-6 + norm(grad(pb_du_cours, [.5, .5])) * 1e-6
	sol = bfgs_quasi_newton_armijo(pb_du_cours, [.5, .5]) 
	@test norm(grad(pb_du_cours, sol)) ≤ ep4
	@test sol ≈ [1, 0] atol = ep4
	@show sol
end
