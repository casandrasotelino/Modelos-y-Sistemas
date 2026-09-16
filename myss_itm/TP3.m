syms t
% x´(t) = Ax(t) + Bu(t)
a=[exp(-t) 0; 0 exp(-2*t)];
S=[-1 1; 1 -2];
%S_i=[-2 -1; -1 -1];

%phi_t=S*a*S^-1 %matriz de traansición

%AVA = [-1 0; 0 -2];

%A = S * AVA * S^-1;

%ph = expm(A*t) %CALCULA LA MATRIZ DE TRANSICION
%eig devuelve los autovalores y autovectores
%------------------------------------------------------------------------%
%A=[1 0 0; 0 -2 0 ; 0 0 3];
%[AVE , AVA] = eig(A);
%PHI = expm(A*t);
%X0=[4; -1; 2];
%M_f_S = AVE * PHI * AVE^-1;
%Sol = M_f_S * X0 %con input = 0
%------------------------------------------------------------------------%
%Ejercicio 4
A=[0 2 ; 2 3]
x0=[1 ; -1]
[AVE, AVA]=eig(A);
PHI=expm(AVA*t)

