using Test

@testset "Test set for newton_ldlt_armijo" begin
	#Test problem:
	fH(x) = (x[2]+x[1].^2-11).^2+(x[1]+x[2].^2-7).^2
	x0H = [10., 20.]
	himmelblau = ADNLPModel(fH, x0H)

	problem2 = ADNLPModel(x->-x[1]^3 + x[2]^2 + x[3]^2, ones(3))

	roz(x) = 100 *  (x[2] - x[1]^2)^2 + (x[1] - 1.0)^2
	rosenbrock = ADNLPModel(roz, [-1.2, 1.0])

	f(x) = x[1]^2 * (2*x[1] - 3) - 6*x[1]*x[2] * (x[1] - x[2] - 1)
	pb_du_cours = ADNLPModel(f, [-1.001, -1.001]) #ou [1.5, .5] ou [.5, .5]

	#Unit/Validation Tests
    ep1 = 1e-6 + norm(grad(himmelblau, himmelblau.meta.x0)) * 1e-6
	sol = newton_ldlt_armijo(himmelblau, himmelblau.meta.x0, verbose = false) 
	@test norm(grad(himmelblau, sol)) ≤ ep1
	@test sol ≈ [3, 2] atol = ep1

    ep2 = 1e-6 + norm(grad(problem2, problem2.meta.x0)) * 1e-6
	sol = newton_ldlt_armijo(problem2, problem2.meta.x0, verbose = false) 
	# @test stats.status == :unbounded
    @test obj(problem2, sol) ≤ -1e15

    ep2 = 1e-6 + norm(grad(rosenbrock, rosenbrock.meta.x0)) * 1e-6
	sol = newton_ldlt_armijo(rosenbrock, rosenbrock.meta.x0, verbose = false) 
	@test sol ≈ [1., 1.] atol = ep2

    ep3 = 1e-6 + norm(grad(pb_du_cours, [-1.001, -1.001])) * 1e-6
	sol = newton_ldlt_armijo(pb_du_cours, [-1.001, -1.001], verbose = false) 
	@test norm(grad(pb_du_cours, sol)) ≤ ep3 || obj(pb_du_cours, sol) <= -1e15

    ep4 = 1e-6 + norm(grad(pb_du_cours, [1.5, .5])) * 1e-6
	sol = newton_ldlt_armijo(pb_du_cours, [1.5, .5], verbose = false) 
	@test norm(grad(pb_du_cours, sol)) ≤ ep4 || obj(pb_du_cours, sol) <= -1e15

    ep5 = 1e-6 + norm(grad(pb_du_cours, [.5, .5])) * 1e-6
	sol = newton_ldlt_armijo(pb_du_cours, [.5, .5], verbose = false) 
	@test norm(grad(pb_du_cours, sol)) ≤ ep5 || obj(pb_du_cours, sol) <= -1e15
end
