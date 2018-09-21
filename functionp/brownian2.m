%BPATH2 Brownian path simulation: vectorized

randn('state',100);
T = 1; N = 500; dt = T/N;

dW = sqrt(dt)*randn(1,N);
W = cumsum(dW);

plot([(0:dt:T)],[0,W],'r-');
xlabel('t','FontSize',16);
ylabel('t','FontSize',16,'Rotation',0);
