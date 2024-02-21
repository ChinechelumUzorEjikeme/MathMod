using Plots
using DifferentialEquations

x0 = 400000
y0 = 100000
t0 = 0
tmax = 1

a = 0.31
b = 0.76
c = 0.8
d = 0.21

a2 = 0.21
b2 = 0.7
c2 = 0.56
d2 = 0.15

function P(t)
    return sin(3*t)
end

function Q(t)
    return cos(4*t)+2
end

function P2(t)
    return sin(10*t)
end

function Q2(t)
    return abscos(10*t)
end

function syst(dy, y, p, t)
    dy[1] = -a*y[1] - b*y[2] + P(t)
    dy[2] = -c*y[1] - d*y[2] + Q(t)
end

function syst2(dy, y, p, t)
    dy[1] = -a2*y[1] - b2*y[2] + P2(t)
    dy[2] = -c2*y[1]*y[2] - d2*y[2] + Q2(t)
end

prob = ODEProblem(syst, [x0; y0], (t0, tmax))
prob2 = ODEProblem(syst2, [x0; y0], (t0, tmax))
t = collect(LinRange(0, 1, 100))
sol = solve(prob, saveat=t)
sol2 = solve(prob2, saveat=t)

plot(sol)
savefig("03.png")

plot(sol2)
savefig("04.png")