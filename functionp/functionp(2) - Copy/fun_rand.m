function dp = fun(t,p)
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
dp = zeros(11,1);    % a column vector
    dp(1,1) = 4*sin(k*p(2))*Op*(p(5)-conj(p(5)));
    dp(2,1) = p(1)/m;
    dp(3,1) = +G3/2*p(11)-2*1i*(p(5)-p(9))*Op*cos(k*p(2));
    dp(4,1) = 1i*(Dp-Dc)*p(4)-1i*p(5)*Oc+2*1i*p(10)*Op*cos(k*p(2)); 
    dp(5,1) = 1i*Dp*p(5)-((G3)/2)*p(5)-1i*p(4)*Oc+2*1i*(p(11)-p(3))*Op*cos(k*p(2));
    dp(6,1) = conj(dp(4));
    dp(7,1) = -1i*Oc*(p(8)-p(10))+G3/2*p(11);
    dp(8,1) = -((G3)/2)*p(8)+1i*(p(11)-p(7))*Oc-2*1i*p(6)*Op*cos(k*p(2));
    dp(9,1) = conj(dp(5));
    dp(10,1) = conj(dp(8));
    dp(11,1) = -G3*p(11)+1i*Oc*(p(8)-p(10))+2*1i*(p(5)-p(9))*Op*cos(k*p(2));
    
    
    %p(1)=p;p(2)=x;p(3)=rho11;p(4)=rho12;p(5)=rho13;
    %p(6)=rho21;p(7)=rho22;p(8)=rho23;p(9)=rho31;p(10)=rho32;p(11)=rho33;
    
    
    
    
    
    
    
    
   