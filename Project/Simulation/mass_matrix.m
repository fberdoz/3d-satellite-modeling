function [M] = mass_matrix(q)
%MASS_MATRIX computes the mass matrix M in function of q.
load mass_prop

s_e_1=q(4:6);
s_e_2=q(7:9);
s_e_3=q(10:12);
C_es=[s_e_1, s_e_2, s_e_3];


M_Sp=[m_s*eye(3), -C_es*crossop(c_s_Sp);
        crossop(c_s_Sp)*C_es', J_s_Sp];
M_W1g_1=[m_1*eye(3), zeros(3);
        zeros(3), J_a_W1g_1];
M_W2g_2=[m_2*eye(3), zeros(3);
        zeros(3), J_b_W2g_2];
M_Dg_d=[m_d*eye(3), zeros(3);
        zeros(3), J_d_Dg_d];

M=blkdiag(M_Sp,M_W1g_1,M_W2g_2,M_Dg_d);
end

