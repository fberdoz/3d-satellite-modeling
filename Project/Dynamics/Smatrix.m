clear all
close all
clc

dSdq=zeros(12,156);
dqdq=eye(3);

o=zeros(1,3);
oo=zeros(3,9);
s=@(x1,x2,x3) [o x3' o; o o x1'; x2' o o];
S=@(s1,s2,s3,d1,d2,d3)  [s(s1,s2,s3) oo o' o'; s(s1,s2,s3) oo s2 o'; s(s1,s2,s3) oo o' s3; oo s(d1,d2,d3) o' o'];

 for j=1:3
        s=dqdq(j,:)';
        dSdq=[dSdq S(s,o',o',o',o',o')];
 end
 for j=1:3
        s=dqdq(j,:)';
        dSdq=[dSdq S(o',s,o',o',o',o')];
 end
  for j=1:3
        s=dqdq(j,:)';
         dSdq=[dSdq S(o',o',s,o',o',o')];
  end
  for j=1:3
        s=dqdq(j,:)';
        dSdq=[dSdq S(o',o',o',s,o',o')];
  end
  for j=1:3
        s=dqdq(j,:)';
        dSdq=[dSdq S(o',o',o',o',s,o')];
  end
  for j=1:3
        s=dqdq(j,:)';
        dSdq=[dSdq S(o',o',o',o',o',s)];
  end
 dSdq=[dSdq zeros(12,52)];