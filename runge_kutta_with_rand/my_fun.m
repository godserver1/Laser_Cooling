clc;
clear all;
close all;

%-----------------------------------------------------------------------%
G3 = 2*pi*6e6;%gamma3
Oc = G3;% O_for_omega_D_for_delta
Op = G3;
Dp = G3;
Dc = G3;
lambda=780e-9;
k = (2*pi)/lambda;
m = 87*1.67e-27;
D = (4*(1.054*10^(-34)*k)^2*G3*Op^2*Dp^2)/((Oc^2-Dp^2)^2+(Dp*G3/2)^2);%diffusion_coeff
mu =0;%mean
sigma=1;%standard_deviation
N=1000; % no of time grid points
t=linspace(0,3*G3*1e-10,N); % time array in micro seconds
dt=t(2)-t(1); % step size in time

%---- initial conditions-------------
p(1:N)=0;
x(1:N)=0;
rho11(1:N)=1/2;
rho12(1:N)=0;
rho13(1:N)=0;
rho21(1:N)=0;
rho22(1:N)=1/2;
rho23(1:N)=0;
rho31(1:N)=0;
rho32(1:N)=0;
rho33(1:N)=0;
%----Runge Kutta 4th order ----------------------------------------------%

for ii=2:N
   a1 = dp(t(ii-1),x(ii-1),rho13(ii-1),rho31(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m,D,sigma,mu)*dt;
   b1 = dx(t(ii-1),p(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   c1 = drho11(t(ii-1),x(ii-1),rho13(ii-1),rho31(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   d1 = drho12(t(ii-1),x(ii-1),rho12(ii-1),rho13(ii-1),rho32(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   e1 = drho13(t(ii-1),x(ii-1),rho11(ii-1),rho12(ii-1),rho13(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   f1 = drho21(t(ii-1),x(ii-1),rho12(ii-1),rho13(ii-1),rho32(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   g1 = drho22(t(ii-1),rho23(ii-1),rho32(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   h1 = drho23(t(ii-1),x(ii-1),rho21(ii-1),rho22(ii-1),rho23(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   k1 = drho31(t(ii-1),x(ii-1),rho11(ii-1),rho12(ii-1),rho13(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   l1 = drho32(t(ii-1),x(ii-1),rho21(ii-1),rho22(ii-1),rho23(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   m1 = drho33(t(ii-1),x(ii-1),rho13(ii-1),rho23(ii-1),rho31(ii-1),rho32(ii-1),rho33(ii-1),G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   

   a2 = dp(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho13(ii-1)+0.5*e1,rho31(ii-1)+0.5*k1,G3,Oc,Op,Dp,Dc,lambda,k,m,D,sigma,mu)*dt;
   b2 = dx(t(ii-1)+0.5*dt,p(ii-1)+0.5*a1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   c2 = drho11(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho13(ii-1)+0.5*e1,rho31(ii-1)+0.5*k1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   d2 = drho12(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho12(ii-1)+0.5*d1,rho13(ii-1)+0.5*e1,rho32(ii-1)+0.5*l1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   e2 = drho13(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho11(ii-1)+0.5*c1,rho12(ii-1)+0.5*d1,rho13(ii-1)+0.5*e1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   f2 = drho21(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho12(ii-1)+0.5*d1,rho13(ii-1)+0.5*e1,rho32(ii-1)+0.5*l1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   g2 = drho22(t(ii-1)+0.5*dt,rho23(ii-1)+0.5*h1,rho32(ii-1)+0.5*l1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   h2 = drho23(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho21(ii-1)+0.5*f1,rho22(ii-1)+0.5*g1,rho23(ii-1)+0.5*h1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   k2 = drho31(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho11(ii-1)+0.5*c1,rho12(ii-1)+0.5*d1,rho13(ii-1)+0.5*e1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   l2 = drho32(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho21(ii-1)+0.5*f1,rho22(ii-1)+0.5*g1,rho23(ii-1)+0.5*h1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   m2 = drho33(t(ii-1)+0.5*dt,x(ii-1)+0.5*b1,rho13(ii-1)+0.5*e1,rho23(ii-1)+0.5*h1,rho31(ii-1)+0.5*k1,rho32(ii-1)+0.5*l1,rho33(ii-1)+0.5*m1,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   
   
   a3 = dp(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho13(ii-1)+0.5*e2,rho31(ii-1)+0.5*k2,G3,Oc,Op,Dp,Dc,lambda,k,m,D,sigma,mu)*dt;
   b3 = dx(t(ii-1)+0.5*dt,p(ii-1)+0.5*a2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   c3 = drho11(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho13(ii-1)+0.5*e2,rho31(ii-1)+0.5*k2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   d3 = drho12(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho12(ii-1)+0.5*d2,rho13(ii-1)+0.5*e2,rho32(ii-1)+0.5*l2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   e3 = drho13(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho11(ii-1)+0.5*c2,rho12(ii-1)+0.5*d2,rho13(ii-1)+0.5*e2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   f3 = drho21(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho12(ii-1)+0.5*d2,rho13(ii-1)+0.5*e2,rho32(ii-1)+0.5*l2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   g3 = drho22(t(ii-1)+0.5*dt,rho23(ii-1)+0.5*h2,rho32(ii-1)+0.5*l2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   h3 = drho23(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho21(ii-1)+0.5*f2,rho22(ii-1)+0.5*g2,rho23(ii-1)+0.5*h2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   k3 = drho31(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho11(ii-1)+0.5*c2,rho12(ii-1)+0.5*d2,rho13(ii-1)+0.5*e2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   l3 = drho32(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho21(ii-1)+0.5*f2,rho22(ii-1)+0.5*g2,rho23(ii-1)+0.5*h2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   m3 = drho33(t(ii-1)+0.5*dt,x(ii-1)+0.5*b2,rho13(ii-1)+0.5*e2,rho23(ii-1)+0.5*h2,rho31(ii-1)+0.5*k2,rho32(ii-1)+0.5*l2,rho33(ii-1)+0.5*m2,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;

   
   a4 = dp(t(ii-1)+dt,x(ii-1)+b3,rho13(ii-1)+e3,rho31(ii-1)+k3,G3,Oc,Op,Dp,Dc,lambda,k,m,D,sigma,mu)*dt;
   b4 = dx(t(ii-1)+dt,p(ii-1)+a3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   c4 = drho11(t(ii-1)+dt,x(ii-1)+b3,rho13(ii-1)+e3,rho31(ii-1)+k3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   d4 = drho12(t(ii-1)+dt,x(ii-1)+b3,rho12(ii-1)+d3,rho13(ii-1)+e3,rho32(ii-1)+l3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   e4 = drho13(t(ii-1)+dt,x(ii-1)+b3,rho11(ii-1)+c3,rho12(ii-1)+d3,rho13(ii-1)+e3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   f4 = drho21(t(ii-1)+dt,x(ii-1)+b3,rho12(ii-1)+d3,rho13(ii-1)+e3,rho32(ii-1)+l3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   g4 = drho22(t(ii-1)+dt,rho23(ii-1)+h3,rho32(ii-1)+l3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   h4 = drho23(t(ii-1)+dt,x(ii-1)+b3,rho21(ii-1)+f3,rho22(ii-1)+g3,rho23(ii-1)+h3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt; 
   k4 = drho31(t(ii-1)+dt,x(ii-1)+b3,rho11(ii-1)+c3,rho12(ii-1)+d3,rho13(ii-1)+e3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   l4 = drho32(t(ii-1)+dt,x(ii-1)+b3,rho21(ii-1)+f3,rho22(ii-1)+g3,rho23(ii-1)+h3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
   m4 = drho33(t(ii-1)+dt,x(ii-1)+b3,rho13(ii-1)+e3,rho23(ii-1)+h3,rho31(ii-1)+k3,rho32(ii-1)+l3,rho33(ii-1)+m3,G3,Oc,Op,Dp,Dc,lambda,k,m)*dt;
 
   
     
   p(ii) = p(ii-1)+((a1+2*(a2+a3)+a4)/6);
   x(ii) = x(ii-1)+((b1+2*(b2+b3)+b4)/6);
   rho11(ii) = rho11(ii-1)+((c1+2*(c2+c3)+c4)/6);
   rho12(ii) = rho12(ii-1)+((d1+2*(d2+d3)+d4)/6);
   rho13(ii) = rho13(ii-1)+((e1+2*(e2+e3)+e4)/6);
   rho21(ii) = rho21(ii-1)+((f1+2*(f2+f3)+f4)/6);
   rho22(ii) = rho22(ii-1)+((g1+2*(g2+g3)+g4)/6);
   rho23(ii) = rho23(ii-1)+((h1+2*(h2+h3)+h4)/6);
   rho31(ii) = rho31(ii-1)+((k1+2*(k2+k3)+k4)/6);
   rho32(ii) = rho32(ii-1)+((l1+2*(l2+l3)+l4)/6);
   rho33(ii) = rho33(ii-1)+((m1+2*(m2+m3)+m4)/6);
   
end

%--------plotting solutions------------------------------------------------

figure
plot(10*t*G3,p)
figure
plot(10*t*G3,x)
figure
plot(10*t*G3,rho11)
figure
plot(10*t*G3,rho22)
figure
plot(10*t*G3,rho33)
figure
plot(10*t*G3,(rho11+rho22+rho33))


%---------------------end-----------------------------------------------%
