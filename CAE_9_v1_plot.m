% CAE 9 PLOT

figure(1)
plot(xref,yref,xm,ym) 
axis equal     
figure(2)  
plot(tout,abs(r-sqrt(xm.^2+ym.^2))) 


figure(1)
plot(xref,yref,xl,yl)
axis equal
figure(2)
plot(tout,abs(r-sqrt(xl.^2+yl.^2)))

figure(3)
bode(G0)
hold on
bode(UpperLimit)
hold on
bode(LowerLimit)
legend('fdt','Upper Bound','Lower Bound')

figure(4)
bode(G0,[0.2:0.001:0.8])
hold on
bode(UpperLimit)
hold on
bode(LowerLimit)
legend('fdt','Upper Bound','Lower Bound')
