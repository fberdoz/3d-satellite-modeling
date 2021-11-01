function [Pi] = Pi_matrix(q)
%PI_MATRIX returns the matrix Pi associated with the general coordinates q.
constants

s_e_1=q(4:6);
s_e_2=q(7:9);
s_e_3=q(10:12);
C_es=[s_e_1, s_e_2, s_e_3];
a_e_1=q(16:18);
a_e_2=q(19:21);
a_e_3=q(22:24);
C_ea=[a_e_1, a_e_2, a_e_3];
b_e_1=q(28:30);
b_e_2=q(31:33);
b_e_3=q(34:36);
C_eb=[b_e_1, b_e_2, b_e_3];
C_as=C_ea'*C_es;
C_bs=C_eb'*C_es;
r_s_g_1p_x=[0 -z_1 0; z_1 0 0; 0 0 0];
r_s_g_2p_x=[0 -z_2 0; z_2 0 0; 0 0 0];

Pi=[eye(6), zeros(6,8);
    eye(3), -C_es*r_s_g_1p_x, zeros(3,8);
    zeros(3), C_as, [0;1;0], zeros(3,7);
    eye(3), -C_es*r_s_g_2p_x, zeros(3,8);
    zeros(3), C_bs, zeros(3,1) [0;0;1], zeros(3,6);
    zeros(6,8),eye(6)];
end

