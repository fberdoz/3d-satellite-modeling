%% Problem 6 b)
% Assignment 1, Frédéric Berdoz, 260867318
close all; clear all; clc

% Definition of the parameters
M=[1 0;0 1.5]; K=[11 -6; -6 6];
x0=[0.1;0.05;1;2]; tspan=[0 10];
A=[zeros(2) eye(2);-inv(M)*K zeros(2)];
f=@(t,x) A*x;

% Integration
[t,x] = ode45(f,tspan,x0);

% Plot
figure
title('Problem 6 b)');
hold on; grid on
plot(t,x(:,1),'k-','LineWidth',1.3,'DisplayName','x1');
plot(t,x(:,2),'r-','LineWidth',1.3,'DisplayName','x2');
plot(t,x(:,3),'b-','LineWidth',1.3,'DisplayName','x3');
plot(t,x(:,4),'m-','LineWidth',1.3,'DisplayName','x4');
xlabel('t [s]'); ylabel('x'); legend show