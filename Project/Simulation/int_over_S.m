function [I] = int_over_S(f)
%INT_OVER_S This function integrate the function f(r_s,theta_s,z_s) over the body S.
constants
f_int=@(r_s,theta_s,z_s) r_s.*f(r_s,theta_s,z_s);
I=integral3(f_int,0,rho_o,0,2*pi,0,t_s,'AbsTol',1e-10) ...
    +integral3(f_int,rho_o-t_s,rho_o,0,2*pi,t_s,l_s-t_s,'AbsTol',1e-10) ...
    +integral3(f_int,0,rho_o,0,2*pi,l_s-t_s,l_s,'AbsTol',1e-10);
end

