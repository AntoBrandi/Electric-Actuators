figure(1)                                                       
plot(ts,tetarif-tetal2)
legend('Senza Filtro di Notch','d2=2*dmecc','d2=4*dmecc','d2=6*dmecc')
grid on                                   
xlabel('time [s]'), ylabel('load position error [rad]') 
hold on
