%% PLOT PER LA BLAC1
% Calcolo di aMAX = ((Kc*np)/J)*20

% % Esercizio 2
figure(1)
plot(ts,isq)
hold on
plot(ts,isqr)
title('Dinamica della Corrente in risposta ad un ingresso a gradino')
xlabel('time [s]')
ylabel('isq [A]')
legend('isq','isq*')

figure(2)
bode(G0)
hold on
grid on