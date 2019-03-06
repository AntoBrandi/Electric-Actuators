%CAE10 PLOT

figure(1)
plot(xref,yref,xm,ym) 
axis equal     
figure(2)  
plot(tout,abs(r-sqrt(xm.^2+ym.^2)))


figure(2)
plot(xref,yref,xl,yl)
axis equal
figure(2)
plot(tout,abs(r-sqrt(xl.^2+yl.^2)))

figure(3)
bode(Go1)
hold on
bode(UpperLimit)
hold on
bode(LowerLimit)

figure(4)
bode(G0,[0.1:0.001:0.5])
hold on
bode(UpperLimit)
hold on
bode(LowerLimit)
legend('fdt','Upper Bound','Lower Bound')

