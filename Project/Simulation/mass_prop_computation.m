%% Mass properties
% This file computes the volume and the mass properties of each body.

% Volumes
One=@(x,y,z) ones(size(x));
V_s=int_over_S(One);
V_1=int_over_W1(One);
V_2=int_over_W2(One);
V_d=int_over_D(One);

% Masses
m_s=sigma_s*V_s;
m_1=sigma_1*V_1;
m_2=sigma_2*V_2;
m_d=sigma_d*V_d;

% First moments of mass
c_s_Sp=[0;0;1/2*l_s*m_s];

% Second moments of mass
% J_s^Sp
J_s_Sp_11=-sigma_s*int_over_S(@(r,t,z) -z.^2-r.^2.*sin(t).^2);
J_s_Sp_22=-sigma_s*int_over_S(@(r,t,z) -z.^2-r.^2.*cos(t).^2);
J_s_Sp_33=-sigma_s*int_over_S(@(r,t,z) -r.^2);
J_s_Sp_12=0; %-sigma_s*int_over_S(@(r,t,z) r.^2.*sin(t).*cos(t));
J_s_Sp_13=0; %-sigma_s*int_over_S(@(r,t,z) z.*r.*cos(t));
J_s_Sp_23=0; %-sigma_s*int_over_S(@(r,t,z) z.*r.*sin(t));
J_s_Sp=[J_s_Sp_11, J_s_Sp_12, J_s_Sp_13;
        J_s_Sp_12, J_s_Sp_22, J_s_Sp_23
        J_s_Sp_13, J_s_Sp_23, J_s_Sp_33];

% J_a^W1g_1
J_a_W1g_1_11=-sigma_1*int_over_W1(@(r,t,z) -z.^2-r.^2.*sin(t).^2);
J_a_W1g_1_22=-sigma_1*int_over_W1(@(r,t,z) -r.^2);
J_a_W1g_1_33=-sigma_1*int_over_W1(@(r,t,z) -z.^2-r.^2.*cos(t).^2);
J_a_W1g_1_12=0; %-sigma_1*int_over_W1(@(r,t,z) z.*r.*cos(t));
J_a_W1g_1_13=0; %-sigma_1*int_over_W1(@(r,t,z) r.^2.*sin(t).*cos(t));
J_a_W1g_1_23=0; %-sigma_1*int_over_W1(@(r,t,z) z.*r.*sin(t));
J_a_W1g_1=[J_a_W1g_1_11, J_a_W1g_1_12, J_a_W1g_1_13;
        J_a_W1g_1_12, J_a_W1g_1_22, J_a_W1g_1_23
        J_a_W1g_1_13, J_a_W1g_1_23, J_a_W1g_1_33];

% J_b^W2g_2
J_b_W2g_2_11=-sigma_2*int_over_W2(@(r,t,z) -z.^2-r.^2.*sin(t).^2);
J_b_W2g_2_22=-sigma_2*int_over_W2(@(r,t,z) -z.^2-r.^2.*cos(t).^2);
J_b_W2g_2_33=-sigma_2*int_over_W2(@(r,t,z) -r.^2);
J_b_W2g_2_12=0; %-sigma_2*int_over_W2(@(r,t,z) r.^2.*sin(t).*cos(t));
J_b_W2g_2_13=0; %-sigma_2*int_over_W2(@(r,t,z) z.*r.*cos(t));
J_b_W2g_2_23=0; %-sigma_2*int_over_W2(@(r,t,z) z.*r.*sin(t));
J_b_W2g_2=[J_b_W2g_2_11, J_b_W2g_2_12, J_b_W2g_2_13;
        J_b_W2g_2_12, J_b_W2g_2_22, J_b_W2g_2_23
        J_b_W2g_2_13, J_b_W2g_2_23, J_b_W2g_2_33];
    
% J_d^Dg_d
J_d_Dg_d_11=-sigma_d*int_over_D(@(x,y,z) -z.^2-y.^2);
J_d_Dg_d_22=-sigma_d*int_over_D(@(x,y,z) -z.^2-x.^2);
J_d_Dg_d_33=-sigma_d*int_over_D(@(x,y,z) -x.^2-y.^2);
J_d_Dg_d_12=0; %-sigma_d*int_over_D(@(x,y,z) x.*y);
J_d_Dg_d_13=0; %-sigma_d*int_over_D(@(x,y,z) x.*z);
J_d_Dg_d_23=0; %-sigma_d*int_over_D(@(x,y,z) y.*z);
J_d_Dg_d=[J_d_Dg_d_11, J_d_Dg_d_12, J_d_Dg_d_13;
        J_d_Dg_d_12, J_d_Dg_d_22, J_d_Dg_d_23
        J_d_Dg_d_13, J_d_Dg_d_23, J_d_Dg_d_33];

    
save mass_prop;
 