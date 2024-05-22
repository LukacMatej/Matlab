% y0 = 3;
% h = 0.1;
% rovnice = @(t,y) -2*y + t;
% [t,y] = euler_exp(rovnice,0,5,y0,h);
xlim([0 100])
ylim([0 30])
hold on
P = 20;
m = 85;
v = 30;
k = 0.516;
h = 1;
diff = @(t,y) (P - k*y^2) / m;
[t1,y1] = euler_exp(diff,0,400,30,h);
[t2,y2] = euler_imp(diff,0,400,30,h);
v_end = 0;
for i = 1:length(t1)-1
    if abs((y1(i) - y1(i+1))) < 0.001
        bodT = t1(i);
        v = y1(i+1);
        break;
    end
end
scatter(bodT,v,'g')
for i = 1:length(t2)-1
    if abs((y2(i) - y2(i+1))) < 0.001
        bodT = t2(i);
        v = y2(i+1);
        break;
    end
end
v_end = v * 3.6;
scatter(bodT,v,'r')
[t3,y3] = ode45(diff,[0 250],30);
plot(t1,y1)
plot(t2,y2)
plot(t3,y3)
legend('Nulovy bod explicitni','Nulovy bod implicitni','Eulerova metoda explicitni','Eulerova metoda implicitní','ode45')
saveas(gcf,'graph.png')
