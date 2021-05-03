%x = InvertedOLResponse{1}{1}.Values.Data;
%theta = InvertedOLResponse{1}{2}.Values.Data;
%timesteps = length(x);
%subplot(1,2,1);
%plot(x, linspace(0, 2, timesteps), '-r')
%subplot(1,2,2);
%polarplot(theta, x)
InitializeVariables;
[A, B, C, D] = linmod2('InvertedPendulumSystem');
[num, den] = ss2tf(A, B, C, D);
numTheta = num(2, :);
numX = num(1, :);

thetaOL = tf(numTheta, den)
PolesOL = pole(thetaOL)
thetaZerosOL = zero(thetaOL)

xOL = tf(numX, den)
xZerosOL = zero(xOL)
subplot(2, 2, [3 4])
impulse(thetaOL)
sys = feedback(xOL, 1)
axis([0 1 0 120]);
title("Open-Loop Impulse Response")
subplot(2, 2, 1);
impulse(sys);

subplot(2, 2, 2);
impulse(sys);

[A1, B1, C1, D1] = linmod2('ClosedLoopWithIntegratorResponse');
[num1, den1] = ss2tf(A1, B1, C1, D1);
numTheta1 = num1(2, :);
numX1 = num(1, :);
sys1 = feedback(xOL, 1)



%subplot(2, 2, 1)
%margin(xOL)
%legend
%
%subplot(2, 2, 2)
%margin(thetaOL)
%legend