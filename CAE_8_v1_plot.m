% CAE8 PLOTTING 

% figure(1)
% plot(ts,tetarif,':k',ts,tetam1,'--k',ts,tetam2,'k','linewidth',2)
% xlabel('time [s]')
% ylabel('motor position [rad]') 
% legend('reference','indirect','direct') 
% 
% figure(2)
% plot(ts,tetarif,':k',ts,tetal1,'--k',ts,tetal2,'k','linewidth',2)
% xlabel('time [s]') 
% ylabel('load position [rad]') 
% legend('reference','indirect','direct') 

figure(1)
plot(ts,tetarif,ts,tetam1)
xlabel('time [s]')
ylabel('motor position [rad]') 
legend('ingresso','uscita')


figure(2)
bode(G0D)
grid on

figure(3)
plot(ts,tetarif,ts,tetal1)
xlabel('time [s]')
ylabel('load position [rad]') 
legend('ingresso','uscita')