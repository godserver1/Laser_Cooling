%BPATH1 Brownian path simulation 

randn('state',100)     % set the state of randn 
T = 1; N = 500;dt = T/N;
dw = zeros(1,N);       % preallocate arrays ... 
w = zeros(1,N);     % for efficiency 

dw(1) = sqrt(dt)*randn; % first approximation outside the loop ...
w(1) = dw(1); % since W(O) = 0 is not allowed 
for j = 2:N
dw(j) = sqrt(dt)*randn; % general increment 
w(j) = w(j-1)+ dw(j); 
end
plot([0:dt:T],[0,w],'r-') % plot W against
t xlabel('t','FontSize',16)
ylabel('W(t)','FontSize',16,'Rotation',0)