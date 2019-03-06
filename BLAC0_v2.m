%Plotting controllo di coppia
figure(1)
plot(ts,Cer)
hold on
plot(ts,Ce)
title('BLAC motor electromagnetic torque')
legend('Ce*','Ce')
xlabel('time [s]')
ylabel('Electromagnetic Torque [Nm]')


figure(2)
plot(ts,wr)
title('BLAC motor speed response')
xlabel('Time [s]')
ylabel('Spped [rad/s]')

figure(3)
plot(wr,Ce)
hold on 
plot(wr,Cr)
hold on
plot(wr,Cr+B*wr/np)
hold on
plot(wr,B*wr/np)
title('BLAC motor electromagnetic torque')
legend('Ce','Cr','Cr+B*wr/np','B*wr/np')
xlabel('electric speed [rad/s]')
ylabel('Electromagnetic Torque and Load Torque [Nm]')
