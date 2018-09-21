for ii=81:200
G3 = 2*pi*6e6;
[T, p] = ode45(@fun_wgn,[0 50/G3],[0; 0; 1/3; 0; 0; 0; 2/3; 0; 0; 0; 0]);
pop1=p(:,3);%population in state 1
pop2=p(:,7);%population in state 2
pop3=p(:,11);%population in state 3

%plot(T,pop1,'r');
%hold on
%plot(T,pop2,'g');
plot(T,p(:,2),'m');
saveas(gcf,sprintf('FIG%d.png',ii));
hold on;
end;

%p(1)=p;p(2)=x;p(3)=rho11;p(4)=rho12;p(5)=rho13;
    %p(6)=rho21;p(7)=rho22;p(8)=rho23;p(9)=rho31;p(10)=rho32;p(11)=rho33;