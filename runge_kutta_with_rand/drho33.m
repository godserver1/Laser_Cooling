function rho33=drho33(t,x,rho13,rho23,rho31,rho32,rho33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rho33=-G3*rho33+1i*Oc*(rho23-rho32)+2*1i*(rho13-rho31)*Op*cos(k*x);
end