%BPATH3 Function along a Brownian path

randn('state',100);
T = 1; N = 500; dt = T/N; t = [dt:dt:1];

M = 1000;
dW = sqrt(dt)*randn(M,N);
W = cumsum(dW,2);
U = exp(repmat(t,[M,1]) + 0.51*W);
Umean = mean(U);

plot([0,t],[1,Umean],'b-');
hold on;
plot([0,t],[ones(5,1),U(1:5,:)],'r--');
hold off;
xlabel('t','FontSize',16);
ylabel('U(t)','FontSize' ,16, 'Rotation',0, 'HorizontalAlignment', 'right');
legend('mean of 1000 paths','5 individual paths' ,2);

averr = norm((Umean - exp(9*t/8)),'inf');