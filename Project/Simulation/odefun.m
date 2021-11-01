function dxdt = odefun(t,x)
%ODEFUN is the function of the first order differential equation
%dxdt=odefun(t,x).

% Extraction of the parameters
constants
%mass_properties
load mass_prop

% Extraction of the variables
q=x(1:48);
nu_hat=x(49:62);

r_e_po=q(1:3);
s_e_1=q(4:6);
s_e_2=q(7:9);
s_e_3=q(10:12);
C_es=[s_e_1, s_e_2, s_e_3];
r_e_g_1o=q(13:15);
a_e_1=q(16:18);
a_e_2=q(19:21);
a_e_3=q(22:24);
C_ea=[a_e_1, a_e_2, a_e_3];
r_e_g_2o=q(25:27);
b_e_1=q(28:30);
b_e_2=q(31:33);
b_e_3=q(34:36);
C_eb=[b_e_1, b_e_2, b_e_3];
r_e_g_do=q(37:39);
d_e_1=q(40:42);
d_e_2=q(43:45);
d_e_3=q(46:48);
C_ed=[d_e_1, d_e_2, d_e_3];

v_e_po_e=nu_hat(1:3);
w_s_se=nu_hat(4:6);
dalphadt=nu_hat(7);
dbetadt=nu_hat(8);
v_e_g_do_e=nu_hat(9:11);
w_d_de=nu_hat(12:14);

w_a_as=[0;dalphadt;0];
w_b_bs=[0;0;dbetadt];

% Definion of the matrix Pi and dPidt
C_as=C_ea'*C_es;
C_bs=C_eb'*C_es;
r_s_g_1p_x=[0 -z_1 0; z_1 0 0; 0 0 0];
r_s_g_2p_x=[0 -z_2 0; z_2 0 0; 0 0 0];

Pi=[eye(6), zeros(6,8);
    eye(3), -C_es*r_s_g_1p_x, zeros(3,8);
    zeros(3), C_as, [0;1;0], zeros(3,7);
    eye(3), -C_es*r_s_g_2p_x, zeros(3,8);
    zeros(3), C_bs, zeros(3,1), [0;0;1], zeros(3,6);
    zeros(6,8),eye(6)];

dPidt=[zeros(6,14);
       zeros(3,3),-C_es*crossop(w_s_se)*r_s_g_1p_x,zeros(3,8);
       zeros(3,3),-crossop(w_a_as)*C_as,zeros(3,8);
       zeros(3,3),-C_es*crossop(w_s_se)*r_s_g_2p_x,zeros(3,8);
       zeros(3,3),-crossop(w_b_bs)*C_bs,zeros(3,8);
       zeros(6,14)];

% Computation of the augmented velocities nu
nu=Pi*nu_hat;

w_a_ae=nu(10:12);
w_b_be=nu(16:18);
w_d_de=nu(22:24);



% Omega
Omega=blkdiag(zeros(3),crossop(w_s_se),zeros(3),crossop(w_a_ae),zeros(3),crossop(w_b_be),zeros(3),crossop(w_d_de));

% Gamma
Gamma_s_se=[zeros(3,1), -s_e_3, s_e_2;
            s_e_3, zeros(3,1), -s_e_1;
            -s_e_2, s_e_1, zeros(3,1)];
Gamma_a_ae=[zeros(3,1), -a_e_3, a_e_2;
            a_e_3, zeros(3,1), -a_e_1;
            -a_e_2, a_e_1, zeros(3,1)];
Gamma_b_be=[zeros(3,1), -b_e_3, b_e_2;
            b_e_3, zeros(3,1), -b_e_1;
            -b_e_2, b_e_1, zeros(3,1)];
Gamma_d_de=[zeros(3,1), -d_e_3, d_e_2;
            d_e_3, zeros(3,1), -d_e_1;
            -d_e_2, d_e_1, zeros(3,1)];
Gamma=blkdiag(eye(3),Gamma_s_se,eye(3),Gamma_a_ae,eye(3),Gamma_b_be,eye(3),Gamma_d_de);

% Mass matrix
M=mass_matrix(q);

% Time derivative of the mass matrix
dM_Spdt=[zeros(3), -C_es*crossop(w_s_se)*crossop(c_s_Sp);
        crossop(c_s_Sp)*crossop(w_s_se)*C_es', zeros(3)];
dMdt=blkdiag(dM_Spdt,zeros(6),zeros(6),zeros(6));

% Mass matrix in the nu_hat space
M_hat=Pi'*M*Pi;

% Non linear forces 
a_non_hat=[zeros(3,1);-crossop(C_es'*v_e_po_e)*crossop(c_s_Sp)*w_s_se; zeros(18,1)];
f_non_hat=(-Pi'*M*dPidt-Pi'*dMdt*Pi-Pi'*Omega*M*Pi)*nu_hat+Pi'*a_non_hat;

% Forces
f_hat=zeros(14,1); %for now

% First order differential equation
dxdt=[Gamma*nu;
       M_hat\(f_non_hat+f_hat)];
 
end

