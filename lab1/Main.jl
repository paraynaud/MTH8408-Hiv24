using LinearAlgebra

function poly(a,b,c)
    Δ = (b^2) - 4*a*c
    if Δ > 0
        r_1 = (-b-sqrt(Δ))/(2*a)
        r_2 = (-b+sqrt(Δ))/(2*a)
        println("Les solutions réelles sont $r_1 et $r_2")
    elseif Δ == 0
        r_0 = -b/(2*a)
        println("La solution unique est $r_0")
    else
        r_1 = (-b-im*sqrt(-Δ))/(2*a)
        r_2 = (-b+im*sqrt(-Δ))/(2*a)
        println("Les solutions complexes sont $r_1 et $r_2")
    end
 end

 
function sym_def_pos(A)
    if  !(A == A')
        return false, "$A n'est pas symétrique"
    end

    try
        inv(A)
        return true, "$A est symétrique défini positive"
    catch
        return false, "$A n'est pas symétrique défini positive"
    end
end

A = [1 0;0 0]