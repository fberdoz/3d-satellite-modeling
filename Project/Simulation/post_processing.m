%% Post processing
% This file uses the result of the simulation to compute additional data.

q_out=x_out(:,1:48)';
nu_hat_out=x_out(:,49:62)';


%% Energy of the system
i_max=length(t);
nu_out=NaN(24,i_max);

E_kin_sys=NaN(1,i_max);
E_kin_S=NaN(1,i_max);
E_kin_W1=NaN(1,i_max);
E_kin_W2=NaN(1,i_max);
E_kin_D=NaN(1,i_max);

for i=1:i_max
    M_i=mass_matrix(q_out(:,i));
    M_Sp_i=M_i(1:6,1:6);
    M_W1g_1_i=M_i(7:12,7:12);
    M_W2g_2_i=M_i(13:18,13:18);
    M_Dg_d_i=M_i(19:24,19:24);
    
    nu_out(:,i)=Pi_matrix(q_out(:,i))*nu_hat_out(:,i);
    
    E_kin_sys(i)=0.5*nu_out(:,i)'*M_i*nu_out(:,i);
    E_kin_S(i)=0.5*nu_out(1:6,i)'*M_Sp_i*nu_out(1:6,i);
    E_kin_W1(i)=0.5*nu_out(7:12,i)'*M_W1g_1_i*nu_out(7:12,i);
    E_kin_W2(i)=0.5*nu_out(13:18,i)'*M_W2g_2_i*nu_out(13:18,i);
    E_kin_D(i)=0.5*nu_out(19:24,i)'*M_Dg_d_i*nu_out(19:24,i);
end

E_kin_sys_0=E_kin_sys(1);
DE_kin_sys_abs=E_kin_sys-E_kin_sys_0;
DE_kin_sys_rel=DE_kin_sys_abs/E_kin_sys_0;



