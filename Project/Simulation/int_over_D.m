function [I] = int_over_D(f)
%INT_OVER_D This function integrate the function f(x_d,y_d,z_d) over the body D.
constants
lowlim=-l_d/2;
uplim=l_d/2;
f_int=@(x_d,y_d,z_d) f(x_d,y_d,z_d);
I=integral3(f_int,lowlim,uplim,lowlim,uplim,lowlim,uplim);
end
