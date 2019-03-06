%CAE14 PLOT
% Traiettoria di accelerazione rettangolare
% figure(1)
% plot(ts,arif)
% grid on
% xlabel('time [s]')
% ylabel('acceleration [rad/s^2]')
% title('Andamento della Curva di riferimento della Accelerzaione')


% figure(2)
% plot(ts,abs(tetar-tetal))
% hold on
% legend('Senza Filtro di Notch','d2=2*d1','d2=4*d1','d2=6*d1')
% xlabel('time [s]')
% ylabel('Errore Assoluto [rad]')

figure(3)
plot(ts,tetar,ts,tetal)
legend('riferimento','uscita')
xlabel('time [s]')
ylabel('Posizione del Carico [rad]')

figure(4)
plot(ts,tetar-tetal)

xlabel('time [s]')
ylabel('Errore sulla Posizione del Carico [rad]')