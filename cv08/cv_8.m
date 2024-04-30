data = load('velocity.mat','-ascii');
times = data(1,:);
velocity = data(2,:);
velocity = velocity / 3.6;
n = length(times);
a = zeros(1, n);
for i = 2:n-1
    h = times(i+1) - times(i-1);
    a(i) = (velocity(i+1) - velocity(i-1)) / h; 
end
a(1) = (velocity(2) - velocity(1)) / (times(2) - times(1));
a(end) = (velocity(end) - velocity(end-1)) / (times(end) - times(end-1));
yyaxis left
plot(times, velocity);
ylabel('Velocity (km/h)');
yyaxis right
plot(times, a);
ylabel('Acceleration (m/s^2)');
hold on
z_indexes = find(abs(a) <= 0.0537);
z = times(z_indexes)
for i = 1:length(z)
    xline(z(i), 'r');
end
hold off
xlabel('Time');
title('Velocity and Acceleration');
legend('Velocity','Acceleration');
saveas(gcf, 'graph_acceleration.png');