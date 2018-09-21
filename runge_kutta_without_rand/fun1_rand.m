clear all;
%close all;
hold on
G3 = 2*pi*6e6;
[T, p] = ode45(@fun_rand,[0 100/G3],[0; 0; 1/2; 0; 0; 0; 1/2; 0; 0; 0; 0]);
momentum=p(:,1);%momentum
pop1=p(:,3);%population in state 1
pop2=p(:,7);%population in state 2
pop3=p(:,11);%population in state 3
%figure
plot(T,momentum,'b')
return
figure
plot(T,pop1,'r');
%hold on
figure
plot(T,pop2,'g');
figure
plot(T,pop3,'b');

%p(1)=p;p(2)=x;p(3)=rho11;p(4)=rho12;p(5)=rho13;
    %p(6)=rho21;p(7)=rho22;p(8)=rho23;p(9)=rho31;p(10)=rho32;p(11)=rho33;