%% EJERCIO 2 
%Parámetros
y0 = 30000;
tspan = [0 12];  % ampliamos para cubrir todo el crecimiento

% Definimos la función diferencial
f = @(t, y) 0.2 * y;

% Resolver con ode45
[t, y] = ode45(f, tspan, y0);

% Parte (a): valor en t = 10
y_10 = interp1(t, y, 10);  % interpolamos si no cae exactamente

fprintf('(a) A las 10 horas hay aproximadamente %.0f bacterias.\n', y_10);

% Parte (b): buscar el instante donde y = 100000
idx = find(y >= 100000, 1);  % primer índice donde se supera ese valor
t_100k = t(idx);

fprintf('(b) Se alcanzan 100000 bacterias aproximadamente a las %.2f horas.\n', t_100k);

% (Opcional) Graficar
figure;
plot(t, y, 'b', 'LineWidth', 2); hold on;
yline(100000, 'r--');
xline(10, 'k--');
xline(t_100k,'r--');
yline(y_10,'k--');
xlabel('Tiempo (horas)');
ylabel('Número de bacterias');
title('Crecimiento bacteriano con ode23');
grid on;

%% EJERCICIO 5

tspan = [0 20];
% Definición de la EDO
f = @(t, y) -y + t;
% Valores iniciales entre -10 y 10 (por ejemplo, en pasos de 5)
y0_vals = -10:5:10;

% Resolver y graficar para cada y0
for y0 = y0_vals
    [t, y] = ode23(f, tspan, y0);
    figure(1)
    hold on
    plot(t,y,'Linewidth',2,'DisplayName', ['y0 = ' num2str(y0)])
    legend show;
end
xlabel('t')
ylabel('y(t)')
title('Soluciones de dy/dt = -y + t para diferentes y0')
grid on

%% EJERCICIO 8
%Ejercicio 8 del amortiguador
%Ecuación diferencial: 
% x''(t) = -200 x'(t) -150 x(t) + (1/5) u(t)
% con condiciones iniciales x(0) = 1 y x'(0) = 0.5

% Reescribimos como sistema de primer orden haciendo u(t) = 0:
% x1 = x(t)
% x2 = x'(t)
% x1' = x2
% x2' = -200*x2 -150*x1
% y = x1;

% Parámetros del sistema
m = 5;
c = 1000;
k = 750;

% Función del sistema: [x1'; x2'] = [x2; -(c/m)*x2 - (k/m)*x1]
f = @(t, x) [x(2); -(c/m)*x(2) - (k/m)*x(1)];

% Condiciones iniciales: y(0) = 1, y'(0) = 0.5
x0 = [1; 0.5];

% Intervalo de integración
tspan = [0 10];  % sistema rígido

% Resolver con ode45 (o usar ode15s si se necesita)
[t, x] = ode45(f, tspan, x0);

% Calcular aceleración (segunda derivada)
% a = -(c/m)*x(:,2) - (k/m)*x(:,1);

% Graficar los resultados
figure
plot(t, x(:,1), 'b', 'LineWidth', 2)    % y(t)
hold on
plot(t, x(:,2), 'r', 'LineWidth', 2)    % y'(t)
%plot(t, a, 'g', 'LineWidth', 2)         % y''(t)
legend('Desplazamiento x(t)', 'Velocidad x''(t)');%, 'Aceleración x''''(t)', 'Location', 'northeast')
xlabel('Tiempo (s)')
ylabel('Magnitud')
title('Sistema resorte-amortiguador')
grid on

%%
clear all
% Parámetros del sistema
m = 5;
c = 1000;
k = 750;
% m = 1;
% c = 0.5;
% k = 2;

%Ecuación diferencial: 
% x''(t) = -200 x'(t) -150 x(t) + (1/5) u(t)
% con condiciones iniciales x(0) = 1 y x'(0) = 0.5

% Reescribimos como sistema de primer orden:
% x1 = x(t)
% x2 = x'(t)
% x1' = x2
% x2' = -200*x2 -150*x1 + (1/5)*u(t)

% Para resolver con ode45:

u = @(t) 1;  % entrada escalón unitario (puede ser otra función)
sys = @(t, X) [X(2); -(c/m)*X(2) - (k/m)*X(1) + (1/5)*u(t)];

% Condiciones iniciales
x0 = [1; 0.5];

% Intervalo de tiempo
tspan = [0 20];

% Resolver
[t, X] = ode45(sys, tspan, x0);

% Extraer soluciones
x = X(:,1);
xdot = X(:,2);

% Graficar
figure;
plot(t, x, 'b', 'LineWidth', 2); hold on;
plot(t, xdot, 'r--', 'LineWidth', 2);
xlabel('Tiempo (s)');
ylabel('Respuesta');
legend('x(t)', 'x''(t)');
title('Respuesta de x(t) y x''(t) al escalón unitario');
grid on;