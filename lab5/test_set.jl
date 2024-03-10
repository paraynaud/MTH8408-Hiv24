tol = 1e-3
@testset "Simple problem" begin
    n = 10
    nlp = ADNLPModel(x->dot(x, x), zeros(n),
                     x->[sum(x) - 1], zeros(1), zeros(1))

    stats = with_logger(NullLogger()) do
      quad_penalty(nlp, nlp.meta.x0, ϵ=1e-6)
    end
    dual, primal, status = stats.dual_feas, stats.primal_feas, stats.status
    @test norm(n * stats.solution - ones(n)) < tol
    @test dual < tol
    @test primal < tol
    @test status == :first_order
end

@testset "Rosenbrock with ∑x = 1" begin
    nlp = ADNLPModel(x->(x[1] - 1.0)^2 + 100 * (x[2] - x[1]^2)^2, 
                     [-1.2; 1.0],
                     x->[sum(x)-1], [0.0], [0.0])

    stats = with_logger(NullLogger()) do
      quad_penalty(nlp, nlp.meta.x0)
    end
    dual, primal, status = stats.dual_feas, stats.primal_feas, stats.status
    @test dual < tol#1e-6
    @test primal < tol
    @test status == :first_order
end

@testset "HS6" begin
    nlp = ADNLPModel(x->(1 - x[1])^2, [-1.2; 1.0],
                     x->[10 * (x[2] - x[1]^2)], [0.0], [0.0])

    stats = with_logger(NullLogger()) do
      quad_penalty(nlp, nlp.meta.x0)
    end
    dual, primal, status = stats.dual_feas, stats.primal_feas, stats.status
    @test dual < tol
    @test primal < tol
    @test status == :first_order
end

@testset "HS7" begin
    nlp = ADNLPModel(x->log(1 + x[1]^2) - x[2], 
                     [2.0; 2.0],
                     x->[(1 + x[1]^2)^2 + x[2]^2 - 4], [0.0], [0.0])

    stats = with_logger(NullLogger()) do
      quad_penalty(nlp, nlp.meta.x0)
    end
    dual, primal, status = stats.dual_feas, stats.primal_feas, stats.status
    @test dual < tol
    @test primal < tol
    @test status == :first_order
end
