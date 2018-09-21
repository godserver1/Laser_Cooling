function rh12=drho12(t,xt,r12,r13,r32,G3,Oc,Op,Dp,Dc,lambda,k,m)

rh12=1i*(Dp-Dc)*r12-1i*r13*Oc+2*1i*r32*Op*cos(k*xt); 

end
