%% Problem 3

%% DCM
clear all; close all; clc;
C3=@(a) [cos(a) sin(a) 0; -sin(a) cos(a) 0; 0 0 1];
C2=@(a) [cos(a) 0 -sin(a); 0 1 0; sin(a) 0 cos(a)];


%% Parameters
O_ba0= [0; 25* pi/180; 0];   % rad
ws_ba0= [0; 0; 10*pi];       % rad/s
x0=[O_ba0;ws_ba0];
tspan=[0 5];                 % s
g=9.81;                      % m/s^2
l=0.15;                      % m
s=8050;                      % kg/m^3
D=0.06;                      % m
h=0.005;                     % m
mB=pi*(D/2)^2*h*s;           % kg
Js_Bc=diag([1/12*mB*(3*(D/2)^2 + h^2), 1/12*mB*(3*(D/2)^2 + h^2), 1/2*mB*(D/2)^2]); % kg*m^2
rs_cw=[0;0;l];                % m
rs_cw_x=[0 -l 0;l 0 0; 0 0 0];
Js_mBw=-mB*rs_cw_x*rs_cw_x;   % kg*m^2

ms_Bw=@(theta,phi,gamma) cross(rs_cw,C3(gamma)*C2(phi)*C3(theta)*[0;0;-g*mB]); % Nm
Ss_sa=@(gamma,phi) [C3(gamma)*C2(phi)*[0;0;1], C3(gamma)*[0;1;0], [0;0;1]];

%% State-space simulation
options = odeset('RelTol',1e-10);
odef=@(t,x) [Ss_sa(x(3),x(2))\x(4:6); (Js_Bc+Js_mBw)\(ms_Bw(x(1),x(2),x(3))-cross(x(4:6),(Js_Bc+Js_mBw)*x(4:6)))];
[t, x]=ode45(odef,tspan,x0,options);

%% Plots for f)
figure('Name','Angle plot','NumberTitle','off','DefaultAxesFontSize',16)

subplot(3,1,1)
grid on; hold on;
plot(t,x(:,1)*180/pi,'LineWidth',1.3,'DisplayName','\theta');
title('\theta vs time'); xlabel('t [s]'); ylabel('\theta [°]');

subplot(3,1,2)
grid on; hold on;
plot(t,x(:,2)*180/pi,'LineWidth',1.3,'DisplayName','\phi');
title('\phi vs time'); xlabel('t [s]'); ylabel('\phi [°]');

subplot(3,1,3)
grid on; hold on;
plot(t,x(:,3)*180/pi,'LineWidth',1.3,'DisplayName','\gamma');
title('\gamma vs time'); xlabel('t [s]'); ylabel('\gamma [°]');

figure('Name','Angular Velocity plot','NumberTitle','off','DefaultAxesFontSize',16)

subplot(3,1,1)
grid on; hold on;
plot(t,x(:,4),'LineWidth',1.3,'DisplayName','\omega_{s1}^{sa}');
title('\omega_{s1}^{sa} vs time'); xlabel('t [s]'); ylabel('\omega_{s1}^{sa} [rad/s]');

subplot(3,1,2)
grid on; hold on;
plot(t,x(:,5),'LineWidth',1.3,'DisplayName','\omega_{s2}^{sa}');
title('\omega_{s2}^{sa} vs time'); xlabel('t [s]'); ylabel('\omega_{s2}^{sa} [rad/s]');

subplot(3,1,3)
grid on; hold on;
plot(t,x(:,6),'LineWidth',1.3,'DisplayName','\omega_{s3}^{sa}');
title('\omega_{s3}^{sa} vs time'); xlabel('t [s]'); ylabel('\omega_{s3}^{sa} [rad/s]');
ylim([0 12*pi]);

%% Part g)

TBwa=diag(1/2*x(:,4:6)*(Js_Bc+Js_mBw)*(x(:,4:6))');

UBw=[];
for i=1:size(t,1);
  UBw=[UBw; mB*g*l*(C3(x(i,3))*C2(x(i,2))*C3(x(i,1))*[0;0;1])'*[0;0;1]];   
end

EBwa=TBwa+UBw;
DEBwa=EBwa-ones(size(t,1),1)*EBwa(1);

%% Energy Plots

figure('Name','Energy','NumberTitle','off','DefaultAxesFontSize',16)
grid on; hold on;
title('Energy vs time'); xlabel('t [s]'); ylabel('Energy [J]');
plot(t,EBwa,'r','LineWidth',1.5,'DisplayName','E_{Bw/a}');
plot(t,DEBwa,'k--','LineWidth',2,'DisplayName','\DeltaE_{Bw/a}');
plot(t,DEBwa/EBwa(1),'c-','LineWidth',1,'DisplayName','\DeltaE_{Bw/a}/E_{Bw/a}(0)');
legend show;
