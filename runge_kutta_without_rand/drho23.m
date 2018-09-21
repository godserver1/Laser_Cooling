function rh23=drho23(t,xt,r21,r22,r23,r33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rh23=-((G3)/2)*r23+1i*(r33-r22)*Oc-2*1i*r21*Op*cos(k*xt);
end
