function [I] = int_over_W2(f)
%INT_OVER_W2 This function integrate the function f(r_b,theta_b,z_b) over the body W2.
constants
f_int=@(r_b,theta_b,z_b) r_b.*f(r_b,theta_b,z_b);
I=integral3(f_int,0,rho_2,0,2*pi,0,l_2);
end