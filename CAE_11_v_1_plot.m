%CAE11 PLOT

% Traiettoria di accelerazione rettangolare
figure(1)
plot(ts,arif)
grid on
xlabel('time [s]')
ylabel('acceleration [rad/s^2]')
title('Andamento della Curva di riferimento della Accelerzaione')

figure(2)                                                      
plot(ts,tetarif,ts,tetam1,ts,tetam2)
grid on
xlabel('time [s]'), ylabel('motor position [rad]')       
legend('tetarif','tetaM indiretto','tetaM diretto')                          
                                                                 
figure(3)                                                       
plot(ts,tetarif-tetam1,ts,tetarif-tetam2)
grid on    
xlabel('time [s]'), ylabel('motor position error [rad]')       
legend('errore misura indiretta','errore misura diretta')  


figure(4)                                                     
plot(ts,tetarif,ts,tetal1,ts,tetal2)
grid on                                   
xlabel('time [s]'), ylabel('load position [rad]')                                    
legend('tetarif','tetaL indiretto','tetaL diretto')                          
                                                                 
figure(5)                                                       
plot(ts,tetarif-tetal1,ts,tetarif-tetal2)
grid on                                   
xlabel('time [s]'), ylabel('load position error [rad]')                              
legend('errore misura indiretta','errore misura diretta') 