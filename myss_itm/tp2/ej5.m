%{
Dibujar en la misma ventana gr´afica las soluciones correspondientes a la ley lineal
y′ = −y + t
en el intervalo [0, 20] considerando distintos valores de y(0) entre −10 y 10. Analizar
los resultados.
%}
y0 = -10 : 1 : 10; %y0, paso, yf; y de 21 valores
tspan = [0 , 20];
f=@(t, y) -y + t;
for i = y0
    [t, y] = ode45(f, tspan, i);
    figure(1)
    hold on
    plot(t,y,'Linewidth',2,'DisplayName', ['y0 = ' num2str(i)])
    legend show; 

end
xlabel('t')
ylabel('y(t)')
title('Soluciones de dy/dt = -y + t para diferentes y0')
grid on