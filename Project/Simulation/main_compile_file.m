%% MECH 642 - Project Simulation
% Frédéric Berdoz, March 2019. 
%
% This file allows to simulate the dynamics of the ADR spacecraft. In
% particular, it solves numerically the first order differential equation
% derived in the Project Dynamic.

clear all
close all
clc
format compact

% Constants
constants

% Mass properties
mass_prop_computation

%% Initial Conditions
r_e_po_0=[0;0;0];
q_se_0=[1; 0; 0;
        0; 1; 0;
        0; 0; 1];
alpha_0=0;
beta_0=0;
r_e_g_do_0=[0;0;0];
q_ds_0=[1; 0; 0;
        0; 1; 0;
        0; 0; 1];

v_e_po_e_0=[10;0;0];
w_s_se_0=[0;pi;10*pi];
dalphadt_0=100*pi;
dbetadt_0=50*pi;
v_e_g_do_e_0=[100;0;0];
w_d_ds_0=[10;0;0];

x_bar_0=[r_e_po_0;
        q_se_0;
        alpha_0;
        beta_0;
        r_e_g_do_0;
        q_ds_0;
        v_e_po_e_0;
        w_s_se_0;
        dalphadt_0;
        dbetadt_0;
        v_e_g_do_e_0;
        w_d_ds_0];
  
x_0=Sigma(x_bar_0);

%% Simulation 
t0=0;
tf=3;

options = odeset('AbsTol',1e-6,'RelTol',1e-6);

tic
[t,x_out] = ode45(@odefun,[t0 tf],x_0,options);
t_sim=toc


%% Post-processing
tic
post_processing
t_post_processing=toc

%% Data backup
save sim_data_v2

%% Plot generation
plot_script


