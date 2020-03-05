clc;
clear all;
close all;
t=[0 20];
[t,x]=ode45(@odeankit,t,[0 0]);
plot(t,x(:,1),'r')
hold on
grid on
plot(t,x(:,2),'b')
legend('Charge','Current');
xlabel('time(second)');
ylabel('charge and current');
