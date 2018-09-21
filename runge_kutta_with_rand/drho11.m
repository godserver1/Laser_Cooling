function rho11=drho11(t,x,rho13,rho31,rho33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rho11=+G3/2*rho33-2*1i*(rho13-rho31)*Op*cos(k*x);

end