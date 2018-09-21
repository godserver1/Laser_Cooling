function rho23=drho23(t,x,rho21,rho22,rho23,rho33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rho23=-((G3)/2)*rho23+1i*(rho33-rho22)*Oc-2*1i*rho21*Op*cos(k*x);
end