%% PLOT PER LA BLAC1
% Calcolo di aMAX = ((Kc*np)/J)*20

% Esercizio 1

figure(1)
plot(ts,wr)
hold on
plot(ts,wref)
title('BLAC Motor speed response')
legend('wr','wr*')
xlabel('time [s]')
ylabel('speed [rad/s]')

figure(2)
plot(ts,isqm)
title('BLAC motor current isq')
xlabel('time [s]')
ylabel('isq [A]')