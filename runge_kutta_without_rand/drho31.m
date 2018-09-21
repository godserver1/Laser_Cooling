function rh31=drho31(t,xt,r11,r12,r13,r33,G3,Oc,Op,Dp,Dc,lambda,k,m)

rh31=-1i*Dp*r13-((G3)/2)*r13+1i*r12*Oc-2*1i*(r33-r11)*Op*cos(k*xt);

end
