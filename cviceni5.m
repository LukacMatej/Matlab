%Lukáč
clear
%1
figure(1);
fi = 0:pi/3:2*pi;
x = 3*sin(fi);
y = 3*cos(fi);
plot(x,y);
clear
%3
%a
figure(2);
x=-5:0.05:5;
hold on;
plot(f(x),'DisplayName','f(x)','Color','Red')
plot(f(x,1),'DisplayName','f(x,1)','Color','Blue')
plot(f(x,2),'DisplayName','f(x,2)','Color','Black')
xlabel('x');
ylabel('y');
title('x*e^(-x^2-y^2) + tanh(x*y)')
legend;



figure(3)
x=-5:0.05:5;
hold on;
t = -10:0.1:10;

ax1 = subplot(3,1,1);
plot(f(x),'DisplayName','f(x)','Color','Red')
legend;
ax1.XLabel.String = 'x';
ax1.YLabel.String = 'y';

%b
ax2 = subplot(3,1,2);
plot(f(x,1),'DisplayName','f(x,1)','Color','Blue')
legend;
ax2.XLabel.String = 'x';
ax2.YLabel.String = 'y';

ax3 = subplot(3,1,3);
plot(f(x,2),'DisplayName','f(x,2)','Color','Black')
legend;
ax3.XLabel.String = 'x';
ax3.YLabel.String = 'y';

title(ax1,'f(x)')
title(ax2,'f(x,1)')
title(ax3,'f(x,2)')
linkaxes([ax1 ax2 ax3], 'x')

%4
figure(4)
[X Y]=meshgrid(-5:0.1:5,-6:0.2:6);
mesh(X,Y,f(X,Y))
