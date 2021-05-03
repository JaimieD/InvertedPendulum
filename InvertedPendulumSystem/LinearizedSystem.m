InitializeVariables; % Set up Variables
[A, B, C, D] = linmod2('InvertedPendulumSystem');
[num, den] = ss2tf(A, B, C, D);
numTheta = num(2, :); % Numerator for Theta, the output
numPosition = num(1, :);
thetaOL = tf(numTheta, den) % Create transfer functio,
positionOL = tf(numPosition, den)

PolesOL = pole(thetaOL) % Find Poles of open-loop TF
thetaZerosOL = zero(thetaOL) % Find Zeros of open-loop TF

impulse(thetaOL)
%impulse(positionOL)
axis([0 1.5 0 40]);
title("Open-Loop Impulse Response")