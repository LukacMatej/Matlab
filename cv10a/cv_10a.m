% a = -2;
% f=@(x) x^2-2;
% fp=@(x) 2*x;
% [x,res,k] = bisection(f,-2,0,1e-7,100);
% [x,res,k] = newton(f,fp,1,1e-7,100);
% [x,res,k] = newton_diff(f,-2,0,1e-7,100);
hold on
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
g = @(x) log(x + 0.5);
a = 1;
b = 0.5;
elips = @(x,y) x.^2 / a^2 + y.^2 / b^2 - 1;

x = -0.5:0.01:5;
y = g(x);
plot(x, y, 'b');
fimplicit(elips, 'r');
% y = log(x + 0.5);
intersection = @(x) x.^2 / a^2 + log(x + 0.5).^2 / b^2 - 1;
interder = @(x) 2 * x / a^2 + 2 * log(x + 0.5) / b^2;
plot(x,intersection(x), 'g');
fimplicit(intersection, 'black');

inter1_1 = bisection(intersection, 0, 0.4, 1e-7, 1000);
inter1_2 = newton(intersection, interder, 0, 1e-7, 1000);
inter1_3 = newton_diff(intersection, 0, 0.4,1e-7,1000);

x1 = (inter1_1 + inter1_2 + inter1_3)/3;

inter2_1 = bisection(intersection, 0.5, 1, 1e-7, 1000);
inter2_2 = newton(intersection, interder, 0.5, 1e-7, 1000);
inter2_3 = newton_diff(intersection,0.5,1,1e-7,1000);
x2 = (inter2_1 + inter2_2 + inter2_3)/3;

saveas(gcf, 'graph.png');