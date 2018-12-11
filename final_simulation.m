%% LQR Model for Rocky
L = 0.0942; % Length to the center of mass of Rocky
g = -9.81; % Gravity
a = 14; b = 1/400; % linearization constants
delta_t = 0.1; % the timestep
A1 = [0 1 0 0;
    0 -a 0 0;
    0 0 0 1;
    0 a/L g/L 0]; % Our A matrix from our governing equations
A = eye(4)+delta_t*A1;
B = [0;a*b;0;-(a*b)/L]; % Our B matrix from our governing equations
B = B*delta_t;
Q = diag([1*10^5,1,1*10^5,1]); % Cost matrix for each state variable
R = 1000000000; % Cost for control, scalar, could be a matrix
[K,S,e] = dlqr(A,B,Q,R);
%% Simulation
tspan = [0 4];
desy = [0;0;pi;0];
y0 = [0;0;2.2;-0.5];
%  K = [0,0,0,0];
[t,y] = ode45(@(t,y)dode(y-desy,L,g,a,b,K),tspan,y0);
%% Plot
plotit(t,y,'test')