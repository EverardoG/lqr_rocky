function derivatives = dode(y,L,g,a,b,k)
%inputs:
% vector of current state variables - y
% all constants in our ODEs - L
% k matrix - k

%returns a vector of time derivatives of state variables

p = -k*y;
if p >= 300
    p = 300;
elseif p <=-300
    p = -300;
end
dxdt = y(2);
dvdt = a*b*p-a*y(2);
dTdt = y(4);
dwdt = -((a*b*p)/L)*cos(y(3))+((a/L)*y(2))*cos(y(3))+(g/L)*sin(y(3));

if y(3)>=(1/2)*pi
    dTdt = 0;
    dwdt = 2*-y(4);
elseif y(3)<=-(1/2)*pi
    dTdt = 0;
    dwdt = 2*-y(4);
end

derivatives = [dxdt; dvdt; dTdt; dwdt];
end