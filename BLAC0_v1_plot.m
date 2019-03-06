figure(1)
plot(ts,wrrif)
hold on
plot(ts,wr)
xlabel('time [s]')
ylabel('speed [rad/s]')
title('BLAC MOTOR SPEED RESPONSE')
legend('wr*','wr')

figure(2)
plot(ts,Cr)
hold on
plot(ts,Ce)
xlabel('time [s]')
ylabel('torque [Nm]')
title('BLAC MOTOR ELECTROMAGNETIC TORQUE')
legend('Cr','Ce')


Ces=Kc*PSIPM/Rs*(wrrif-wr);

figure(3)
plot(wr,Ce)
hold on
plot(wr,Cr)
hold on
plot(wr,Ces)
xlabel('speed [rad/s]')
ylabel('torque [Nm]')
title('Equazione di Macchina - Andamento Coppia Velocità')
legend('Ce','Cr','Caratteristica Stazionaria')

% Quanto deve aumentare la tensione quando applico la coppia di carico
figure(4)
plot(ts,vsqq)
hold on
plot(ts,vsqstar)
xlabel('time [s]')
ylabel('tensione [volt]')
title('Incremento della tensione alla applicazione del carico')
legend('Vsq','Vsq*')