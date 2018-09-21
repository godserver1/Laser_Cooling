function rh11=drho11(t,xt,r13,r31,r33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rh11=+G3/2*r33-2*1i*(r13-r31)*Op*cos(k*xt);

end
