function [x] = Sigma(x_bar)
%Sigma computes the augmented states of the system x in funtion of the
%measurables q_bar.
constants
r_s_g_1p=[0;0;z_1];
r_s_g_2p=[0;0;z_2];

I_1=[1;0;0];
I_2=[0;1;0];
I_3=[0;0;1];

r_e_po=x_bar(1:3);
s_e_1=x_bar(4:6);
s_e_2=x_bar(7:9);
s_e_3=x_bar(10:12);
alpha=x_bar(13);
beta=x_bar(14);
r_e_g_do=x_bar(15:17);
d_s_1=x_bar(18:20);
d_s_2=x_bar(21:23);
d_s_3=x_bar(24:26);
v_e_po_e=x_bar(27:29);
w_s_se=x_bar(30:32);
dalphadt=x_bar(33);
dbetadt=x_bar(34);
v_e_g_do_e=x_bar(35:37);
w_d_ds=x_bar(38:40);

C_es=[s_e_1, s_e_2, s_e_3];
C_sd=[d_s_1, d_s_2, d_s_3];
C_as=[cos(alpha), 0, -sin(alpha);
        0,        1,        0;
      sin(alpha), 0, cos(alpha)];
C_bs=[cos(beta), sin(beta), 0 ;
     -sin(beta), cos(beta), 0 ;
     0 ,            0,      1];
 
  
x=[ r_e_po;
    s_e_1;
    s_e_2;
    s_e_3;
    r_e_po+C_es*r_s_g_1p;
    C_es*C_as'*I_1;
    C_es*C_as'*I_2;
    C_es*C_as'*I_3;
    r_e_po+C_es*r_s_g_2p;
    C_es*C_bs'*I_1;
    C_es*C_bs'*I_2;
    C_es*C_bs'*I_3;
    r_e_g_do;
    C_es*C_sd*I_1;
    C_es*C_sd*I_2;
    C_es*C_sd*I_3;
    v_e_po_e;
    w_s_se;
    dalphadt;
    dbetadt;
    v_e_g_do_e;
    w_d_ds+C_sd'*w_s_se];
end

