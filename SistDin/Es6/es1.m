clear
close all

eps = 1e-2;
tspan = [0 10];
y0 = [1.5; 1];

odefun = @(t, y) [1/eps*(-y(1)+y(2)/(1+y(2)))-y(2)/(1+y(2))^2; -y(2)];

[t113, y113] = ode113(odefun, tspan, y0);
numit113 = size(t113,1)
[t15s, y15s] = ode15s(odefun, tspan, y0);
numit15s = size(t15s,1)
[t45, y45] = ode45(odefun, tspan, y0);
numit45 = size(t45,1)

e = exp(1);
y = @(t) [(y0(1)-y0(2)/(1+y0(2)))*e.^((-t)/eps)+...
    y0(2)*e.^(-t)./(1+y0(2)*e.^(-t)) y0(2)*e.^(-t)];

figure(1)
subplot(2,2,1)
plot(t113, y(t113), 'r')
plot(t113, y113, 'o-')
subplot(2,2,2)
plot(t15s, y(t15s), 'r')
plot(t15s, y15s, 'o-')
subplot(2,2,3)
plot(t45, y(t45), 'r')
plot(t45, y45, 'o-')

%% Plot animati

ysol = y(t113);

figure(3)
h = animatedline;
axis([0, 10, 0 ,1.5])

for k=1:numit113
    addpoints(h, t113, ysol(1,:))
    drawnow
end











