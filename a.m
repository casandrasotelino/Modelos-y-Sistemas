h = [0.5 0.1 0.05];
t0 = 2;
x0 = 2;
x = {};

for i=1:length(h)
    t=t0:h(i):5;
    x_(1)=x0;
    for j=1:length(t)-1
        x_(j+1)=x_(j)+h(i)*sqrt(x_(j));
    end
    x{end + 1} = x_; %borra
    %aca el grafico
end


    