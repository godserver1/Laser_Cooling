function rho21=drho21(t,x,rho12,rho13,rho32,G3,Oc,Op,Dp,Dc,lambda,k,m)

rho21=-1i*(Dp-Dc)*rho12+1i*rho13*Oc-2*1i*rho32*Op*cos(k*x); 

end