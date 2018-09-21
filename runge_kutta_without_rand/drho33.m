function rh33=drho33(t,xt,r13,r23,r31,r32,r33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rh33=-G3*r33+1i*Oc*(r23-r32)+2*1i*(r13-r31)*Op*cos(k*xt);
end
