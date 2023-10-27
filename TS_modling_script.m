clc
clear all


%data
x0=[0.5;-0.5];

x1=-1:0.001:1;
x2=-1:0.001:1;

z1=x1.*x2.^2;
z2=(3+x2).*x1.^2;

A1=[-1 max(z1)
    max(z2) -1];
A2=[-1 max(z1)
    min(z2) -1];
A3=[-1 min(z1)
    max(z2) -1];
A4=[-1 min(z1)
    min(z2) -1];

B=[1;1];

%%

%plotting
t0=0;
tf=10;
delta=0.001;

tt=[];tx=[];ty=[];
x0=[-0.7;1];
x=x0;%X initial
u=0;
y=0;
for t=t0:delta:tf
    tt=[tt t];
    tx=[tx x];
    ty=[ty y];
    F=[-x(1)+x(1)*x(2)^3;-x(2)+(3+x(2))*x(1)^3];
    x=x+delta*F;
    y=x(1);
end

plot(tt,tx)
grid on
title("Système NL x0=(0.5,0.5)', u=0")
%hold on
%plot(tt,ty)
legend("x1","x2")