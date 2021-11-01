%% Problem 1 (c)
close all; clc; clear all;
% Parameters
k=1.1; 
m=0.5; 
dtheta=0.3;
g=9.81;
xb0=0.1;
dxb0=0;
w=sqrt(k/m-dtheta^2);

% Functions
xb=@(t) xb0*cos(w*t);
dxb=@(t) -xb0*w*sin(w*t);
ddxb=@(t) -xb0*w^2*cos(w*t);

a_b1_pwa=@(t) ddxb(t)-xb(t)*dtheta^2;
a_b2_pwa=@(t) 2*dxb(t)*dtheta;

f_b1_ps=@(t) -k*xb(t);
f_b2_ps=@(t) 0;
f_b3_ps=@(t) 0;

f_b3_pg=-m*g;

f_b1_pt=@(t) 0;
f_b2_pt=@(t) m*a_b2_pwa(t);
f_b3_pt=@(t) m*g;

% Plots
tspan=[0 10];
figure('Name','Assignment 1 - Problem 1 c)');
title('Assignment 1 - Problem 1 c)')
hold on
subplot(3,2,1)
title('f_{b1}^{ps} vs t');
hold on
grid on
fplot(f_b1_ps,tspan,'DisplayName','f_{b1}^{ps}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')

subplot(3,2,3)
title('f_{b2}^{ps} vs t');
hold on
grid on
fplot(f_b2_ps,tspan,'DisplayName','f_{b2}^{ps}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')

subplot(3,2,5)
title('f_{b3}^{ps} vs t');
hold on
grid on
fplot(f_b3_ps,tspan,'DisplayName','f_{b3}^{ps}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')

subplot(3,2,2)
title('f_{b1}^{pt} vs t');
hold on
grid on
fplot(f_b1_pt,tspan,'DisplayName','f_{b1}^{pt}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')

subplot(3,2,4)
title('f_{b2}^{pt} vs t');
hold on
grid on
fplot(f_b2_pt,tspan,'DisplayName','f_{b2}^{pt}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')

subplot(3,2,6)
title('f_{b3}^{pt} vs t');
hold on
grid on
fplot(f_b3_pt,tspan,'DisplayName','f_{b3}^{pt}','LineWidth',1.5)
xlabel('time [s]'); ylabel('force [N]')