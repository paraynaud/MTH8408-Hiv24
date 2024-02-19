@testset "Test set for LM" begin
    FH(x) = [x[2]+x[1].^2-11, x[1]+x[2].^2-7]
    x0H = [10., 20.]
    himmelblau_nls = ADNLSModel(FH, x0H, 2)

    F1(x) = [x[1], 0., 0.]
    problem2_nls = ADNLSModel(F1, ones(3), 3)

    Froz(x) = [10 * (x[2] - x[1]^2), x[1] - 1.0]
    rosenbrock_nls = ADNLSModel(Froz, [-1.2, 1.0], 2)

    n = 10
    F_larger(x) = [[10 * (x[i+1] - x[i]^2) for i = 1:n-1]; [x[i] - 1 for i = 1:n-1]]
    x0_larger = 0.9 * ones(n)
    larger_nls = ADNLSModel(F_larger, x0_larger, length(F_larger(x0_larger)))

    for nls in [rosenbrock_nls, problem2_nls, himmelblau_nls, larger_nls]
        x = 4*ones(nls.meta.nvar)
        @time stats2 = lm_param(nls, x, 1e-6)
        @test stats.status == :first_order
    end
end