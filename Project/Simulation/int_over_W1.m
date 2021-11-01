function [I] = int_over_W1(f)
%INT_OVER_W1 This function integrate the function f(r_a,theta_a,z_a) over the body W1.
constants
f_int=@(r_a,theta_a,z_a) r_a.*f(r_a,theta_a,z_a);
I=integral3(f_int,0,rho_1,0,2*pi,0,l_1);
end