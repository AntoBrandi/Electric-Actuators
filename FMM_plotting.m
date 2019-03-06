u0 = 1.2566375e-6;
z = 0.02;
h = 0.02;
xg = 0.001;
NI = 2500;
x=0:1:10;

i=1;


%% Forza - Traferro con xg variabile
while xg<0.01
   % Ideale
   x(i)= (u0*0.02*0.02*(NI^2))/(4*(xg^2));   
   xg = xg+0.001;
   i=i+1;
end

plot(x)
title('Forza - Dimensione Traferro')
xlabel('Traferro [mm]')
ylabel('Forza [N]')

%% Flusso - Corrente con Ia variabile

xg = 0.002;
z=0.02;
h=0.02;
NI = 0;
j=1;
wb=0:1:8;
r = 0:1:8;

while NI<=8000
 %ideale
wb(j) = ((u0*z*h*NI)/(2*xg))*1000;
 % Reale
r(i) = 
NI = NI+1000;
j=j+1;
end

plot(wb)
title('Flusso - Corrente')
xlabel('Corrente [kA]')
ylabel('Flusso [mWb]')