
G3 = 2*pi*6e6;
[T, p] = ode45(@fun,[0 10/G3],[0; 0; 1/2; 0; 0; 0; 1/2; 0; 0; 0; 0]);
figure
plot(T,p(:,1))
figure
plot(T,p(:,2))
figure
plot(T,p(:,3))
figure
plot(T,p(:,7))
figure
plot(T,p(:,11))

%p(1)=p;p(2)=x;p(3)=rho11;p(4)=rho12;p(5)=rho13;
    %p(6)=rho21;p(7)=rho22;p(8)=rho23;p(9)=rho31;p(10)=rho32;p(11)=rho33;