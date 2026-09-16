syms T I V 

s = 10; %s puede ser una entrada, hay que analizar el comportamiento del sistema si esta variable varía
beta = 2.4 * 10^(-5);
delta = 0.7; 
p = 100;
d = 0.01;
c = 2.4;
tspan = [0 100];
N = 5000;
eqs = [s - d*T - beta * T * V == 0, beta * T * V - delta * I == 0, p * I - c * V];
S = solve(eqs,[T I V],'Real',true);
F = @(t,T,I,V)[s - d*T - beta * T *V ; beta * T * V - delta * I ; p * I - c * V];
Xcrit = double([S.T, S.I, S.V]);
%%Evaluo el jacobiano en Xcrit
J_ = subs(J, [T, I, V], Xcrit(1, :));
%J_ = subs(J, [T, I, V], Xcrit)
[AVE , AVA] = eig(J_);
X0= [1000 0.1 1];
X_Xcrit = [T, I, V] - Xcrit(1, :);
J_eval = subs(J, [T, I, V], [T, I, V] - Xcrit(1, :))
