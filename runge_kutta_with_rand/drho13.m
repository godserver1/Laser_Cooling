function rho13=drho13(t,x,rho11,rho12,rho13,rho33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rho13=1i*Dp*rho13-((G3)/2)*rho13-1i*rho12*Oc+2*1i*(rho33-rho11)*Op*cos(k*x);

end