%2. En ciertas circunstancias, el n´umero de individuos en determinadas poblaciones de
%bacterias se rige por la ley
%y′ = 0.2y.
%Si al comienzo del experimento hay 30.000 bacterias,
%(a) Cu´antas habr´a 10 horas m´as tarde?
%(b) En qu´e instante habr´a 100.000 bacterias?
y0 = 30000;
tspan = [0 12]; % ampliamos para cubrir todo el crecimiento
f = @(t, y) 0.2 * y; %@ define que es una funcion; @(var ind, var dep)
[t , y] = ode45(f, tspan, y0);
%plot(t, y)
%respuestas sacadas de las tablas: a.[221882.693895505] b.[6.10475457260383]
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
