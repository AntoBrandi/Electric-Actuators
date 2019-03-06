clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=50e-6;
 
%===========PARAMETRI MODELLO PMSM=========================================
 
Rs=1;Lsd=0.005;Lsq=Lsd;np=4;J=0.001;B=0;lambdam=0.1;ms=3;Kc=ms*np*lambdam/2;
 
%===========CALCOLO COEFFICIENTI EQUAZIONI DIFFERENZIALI===================
krs=1;klambda=1;kj=1;
A1=-krs*Rs/Lsd;A2=Lsq/Lsd;A3=1/Lsd;
A4=-Lsd/Lsq;A5=-krs*Rs/Lsq;A6=-2*Kc*klambda/ms/np/Lsq;A7=1/Lsq;
A8=Kc*klambda*np/(kj*J);A9=ms*np^2*(Lsd-Lsq)/2/(kj*J);A10=-B/(kj*J);A11=-np/(kj*J);
 
%===========PARAMETRI INVERTER E FILTRI ===================================
 
Vdc=300;    % Tensione del bus in continua
Tc=200e-6;  % Tempo di campionamento del controllo di corrente e velocità
%Filtri
kT=1;                       %trasduttore di posizione/velocità
kA=Vdc/sqrt(3); 
tA=Tc/2;    %convertitore
kf=.1;         
tf=160e-6;    %filtro sulle correnti (circa 1000Hz)
 
%Encoder
ppr=5000;
 
%===========RIFERIMENTO DI VELOCITA' E DI COPPIA DI CARICO=================
wrr=300;
Crn=.6;Cr0=0;
 
%===========VALORI INIZIALI DELLE VARIABILI STATO==========================
 
wr0=0;                                         %velocità iniziale
wdq0=0;tetadq0=0;                              %velocità e posizione elettriche
isd0=0;
isq0=(-A10*wdq0-A11*Cr0)/(A8+A9*isd0);         %corrente iniziale lungo l'asse q
teta0=0;                                        %posizione iniziale di rotore
           
%===========PARAMETRI REGOLATORI E FILTRO DI SMOOTING======================
In=Crn/Kc;       %corrente nominale 


%Progetto 1
tsigmai=4*tA+tf;
%Regolatore isq
tiisq=(Lsq/Rs);
kpisq=Rs*tiisq/(2*kf*kA*tsigmai);
kiisq=kpisq/tiisq;
%Regolatore isd
tiisd=(Lsd/Rs);
kpisd=Rs*tiisd/(2*kf*kA*tsigmai);
kiisd=kpisd/tiisd;
%Regolatore wr
tsigmaw=-tf+2*tsigmai;
tiw=4*tsigmaw;
kpwr=J*kf/(kT*np*Kc*2*tsigmaw);
kiwr=kpwr/tiw;


% %Progetto 2
 Tx=0.002;   %ctd desiderata per la risposta di corrente
 tsigmai=4*tA+tf+(Lsq/Rs);
% %Regolatore isq
 tiisq=tsigmai;
 kpisq=tiisq*Rs/(kA*kf*Tx);
 kiisq=kpisq/tiisq;
% %Regolatore isd
 tiisd=tsigmai;
 kpisd=tiisd*Rs/(kA*kf*Tx);
 kiisd=kpisd/tiisd;
% %Regolatore wr
 tsigmaw=-tf+Tx;
 tiw=4*tsigmaw;
 kpwr=J*kf/(kT*np*Kc*2*tsigmaw);
 kiwr=kpwr/tiw;
 
%Filtro di smoothing
tsm=tsigmaw*4*1.2;


% Plant
%Gplant = tf(kf/Rs,[(tsigmai*Lsq/Rs) (tsigmai+Lsq/Rs) 1]);
