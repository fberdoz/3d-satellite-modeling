%% Plot script
%PLOT_SCRIPT generates figures using the simulation results and the post-processed
%data

close all

% Plot parameter
line_width=1.5;
format='png';

% Kinetic Energy of each Body
Energy_plot_per_body=figure('IntegerHandle','off','Name','Kinetic Energy of each Body');

subplot(4,1,1)
hold on
grid on
title('Kinetic Energy of $\mathcal{S}$ vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$T_{\mathcal{S}o/e}$ [J]','Interpreter','Latex');
plot(t,E_kin_S);

subplot(4,1,2)
hold on
grid on
title('Kinetic Energy of W1 vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$T_{W1o/e}$ [J]','Interpreter','Latex');
plot(t,E_kin_W1);

subplot(4,1,3)
hold on
grid on
title('Kinetic Energy of W2 vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$T_{W2o/e}$ [J]','Interpreter','Latex');
plot(t,E_kin_W2);

subplot(4,1,4)
hold on
grid on
title('Kinetic Energy of $\mathcal{D}$ vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$T_{\mathcal{D}o/e}$ [J]','Interpreter','Latex');
ylim([0, 2*E_kin_D(1)]);
plot(t,E_kin_D);



% Whole system
Energy_plot_sys=figure('Name','Kinetic energy of the system');
subplot(3,1,1)
hold on
grid on
title('Kinetic Energy of the system vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$T_{\mathcal{A}o/e}$ [J]','Interpreter','Latex');
ylim([0, 2*E_kin_sys(1)]);
plot(t,E_kin_sys);


subplot(3,1,2)
hold on
grid on
title('Absolute Deviation of the Kinetic Energy vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$\Delta T_{\mathcal{A}o/e}$ [J]','Interpreter','Latex');
DE_kin_sys_abs_max=max([abs(min(DE_kin_sys_abs)), abs(max(DE_kin_sys_abs))]);
ylim([-2*DE_kin_sys_abs_max 2*DE_kin_sys_abs_max]);
plot(t,DE_kin_sys_abs);

subplot(3,1,3)
hold on
grid on
title('Relative Deviation of the Kinetic Energy vs. time','Interpreter','Latex');
xlabel('$t$ [s]','Interpreter','Latex');
ylabel('$\Delta T_{\mathcal{A}o/e}/{T_{\mathcal{A}o/e}}_0$ [-]','Interpreter','Latex');
%ylim([-1 1]);
plot(t,DE_kin_sys_rel);

% Export of figures
exportfig(Energy_plot_per_body,'plots/Energy_plot_per_body_1e-6','Format',format,'width',15,'Height',20,'fontmode','fixed','fontsize',10,'Color','cmyk','LineMode','fixed','LineWidth',line_width);
exportfig(Energy_plot_sys,'plots/Energy_plot_sys_1e-6','Format',format,'width',15,'Height',15,'fontmode','fixed','fontsize',10,'Color','cmyk','LineMode','fixed','LineWidth',line_width);
