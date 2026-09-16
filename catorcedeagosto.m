% ========================================================================
%  TP - Metodo de Euler para sistemas de ecuaciones diferenciales
% ========================================================================
clear; clc; close all;

hs = [0.5, 0.1, 0.05];   % pasos a evaluar
t_ini = 0;                % inicio del intervalo [0,5]
t_fin = 5;                % fin del intervalo

% ------------------------------------------------------------------------
% (a) x' = sqrt(x), x(0)=2, aproximar x(t0=2)
% ------------------------------------------------------------------------
fa   = @(t,x) sqrt(x);
x0a  = 2;
t0a  = 2;

resultados_a = zeros(length(hs),2);
for i = 1:length(hs)
    h = hs(i);
    [t, X] = euler(fa, t_ini, t_fin, x0a, h);
    idx = round((t0a - t_ini)/h) + 1;
    resultados_a(i,:) = [h, X(1,idx)];
end

fprintf('\n--- Resultados ejercicio (a): x(t0=2) ---\n');
fprintf('%10s %15s\n', 'h', 'x(t0) aprox');
for i = 1:size(resultados_a,1)
    fprintf('%10.4f %15.6f\n', resultados_a(i,1), resultados_a(i,2));
end

% ------------------------------------------------------------------------
% (b) x' = y, y' = x - y, x(0)=1, y(0)=2, aproximar en t0=1
% ------------------------------------------------------------------------
fb   = @(t,x) [x(2); x(1) - x(2)];
x0b  = [1; 2];
t0b  = 1;

resultados_b = zeros(length(hs),3);
for i = 1:length(hs)
    h = hs(i);
    [t, X] = euler(fb, t_ini, t_fin, x0b, h);
    idx = round((t0b - t_ini)/h) + 1;
    resultados_b(i,:) = [h, X(1,idx), X(2,idx)];
end

fprintf('\n--- Resultados ejercicio (b): x(t0=1), y(t0=1) ---\n');
fprintf('%10s %15s %15s\n', 'h', 'x(t0) aprox', 'y(t0) aprox');
for i = 1:size(resultados_b,1)
    fprintf('%10.4f %15.6f %15.6f\n', resultados_b(i,1), resultados_b(i,2), resultados_b(i,3));
end

% ------------------------------------------------------------------------
% (c) x1' = x2, x2' = cos(10*pi*x1), y = x1
%     x1(0)=0, x2(0)=1, aproximar en t0=1
% ------------------------------------------------------------------------
fc   = @(t,x) [x(2); cos(10*pi*x(1))];
x0c  = [0; 1];
t0c  = 1;

resultados_c = zeros(length(hs),2);
for i = 1:length(hs)
    h = hs(i);
    [t, X] = euler(fc, t_ini, t_fin, x0c, h);
    idx = round((t0c - t_ini)/h) + 1;
    y = X(1,idx);   % y = x1
    resultados_c(i,:) = [h, y];
end

fprintf('\n--- Resultados ejercicio (c): y(t0=1) = x1(t0=1) ---\n');
fprintf('%10s %15s\n', 'h', 'y(t0) aprox');
for i = 1:size(resultados_c,1)
    fprintf('%10.4f %15.6f\n', resultados_c(i,1), resultados_c(i,2));
end

% ------------------------------------------------------------------------
% (d) x1'=x2, x2'=x3, x3'=-2x1-3x2-4x3, y=7x1-5x2
%     x1(0)=2, x2(0)=1, x3(0)=0, aproximar en t0=1
% ------------------------------------------------------------------------
fd   = @(t,x) [x(2); x(3); -2*x(1) - 3*x(2) - 4*x(3)];
x0d  = [2; 1; 0];
t0d  = 1;

resultados_d = zeros(length(hs),2);
for i = 1:length(hs)
    h = hs(i);
    [t, X] = euler(fd, t_ini, t_fin, x0d, h);
    idx = round((t0d - t_ini)/h) + 1;
    y = 7*X(1,idx) - 5*X(2,idx);
    resultados_d(i,:) = [h, y];
end

fprintf('\n--- Resultados ejercicio (d): y(t0=1) = 7x1-5x2 ---\n');
fprintf('%10s %15s\n', 'h', 'y(t0) aprox');
for i = 1:size(resultados_d,1)
    fprintf('%10.4f %15.6f\n', resultados_d(i,1), resultados_d(i,2));
end


% ========================================================================
%                       FUNCIONES LOCALES
% ========================================================================
function [t, X] = euler(f, t0, tf, x0, h)
    % Metodo de Euler generico para sistemas x' = f(t,x)
    % f  : function handle f(t,x) -> vector columna
    % t0 : tiempo inicial
    % tf : tiempo final
    % x0 : condicion inicial (vector columna)
    % h  : paso de integracion
    %
    % Devuelve:
    % t : vector de tiempos (1 x N+1)
    % X : matriz de estados, cada columna es x(t_k) (n x N+1)

    x0 = x0(:);
    N = round((tf - t0)/h);
    t = t0 + (0:N)*h;
    n = length(x0);
    X = zeros(n, N+1);
    X(:,1) = x0;

    for k = 1:N
        X(:,k+1) = X(:,k) + h * f(t(k), X(:,k));
    end
end