clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=50e-6;

%===========PARAMETRI MODELLO PMSM=========================================

Rs=1;Lsd=0.005;Lsq=Lsd;np=4;J=0.001;Jl=J;
B=0;lambdam=0.1;ms=3;Kc=ms*np*lambdam/2;

%===========CALCOLO COEFFICIENTI EQUAZIONI DIFFERENZIALI===================
krs=1;klambda=1;kj=1;
A1=-krs*Rs/Lsd;A2=Lsq/Lsd;A3=1/Lsd;
A4=-Lsd/Lsq;A5=-krs*Rs/Lsq;A6=-2*Kc*klambda/ms/np/Lsq;A7=1/Lsq;
A8=Kc*klambda*np/(kj*J);A9=ms*np^2*(Lsd-Lsq)/2/(kj*J);A10=-B/(kj*J);A11=-np/(kj*J);

%===========PARAMETRI INVERTER E FILTRI ===================================

Vdc=300;    % Tensione del bus in continua
Tc=200e-6;  % Tempo di campionamento del controllo di corrente e velocità
Tt=10e-3;   % Tempo di campionamento del controllo di posizione
%Filtri
kT=1;                       % trasduttore di posizione/velocità
kA=Vdc/sqrt(3); tA=Tc/2;    % convertitore
kf=.1;          tf=160e-6;  % filtro sulle correnti (circa 1000Hz)

%Encoder
ppr=5000;

%===========RIFERIMENTO DI POSIZIONE E DI COPPIA DI CARICO=================
tetarr=1;tetar0=0;
Crn=.6;Cr0=0;

%===========VALORI INIZIALI DELLE VARIABILI STATO==========================

wr0=0;                                          %velocità iniziale
wdq0=0;tetadq0=0;                               %velocità e posizione elettriche
isd0=0;
isq0=(-A10*wdq0-A11*Cr0)/(A8+A9*isd0);          %corrente iniziale lungo l'asse q
teta0=0;                                        %posizione iniziale di rotore
           
%========== PARAMETRI REGOLATORI E FILTRO DI SMOOTING ====================
In=Crn/Kc;       %corrente nominale         

Tx=0.002;   %ctd desiderata per la risposta di corrente
tsigmai=4*tA+tf+(Lsq/Rs);
%Regolatore isq
tiisq=tsigmai;
kpisq=tiisq*Rs/(kA*kf*Tx);
kiisq=kpisq/tiisq;
%Regolatore isd
tiisd=tsigmai;
kpisd=tiisd*Rs/(kA*kf*Tx);
kiisd=kpisd/tiisd;
%Regolatore wr
tsigmaw=-tf+Tx;
tiw=4*tsigmaw;
%kpwr=kf*J/(kT*Kc*np*2*0.0149);
kpwr=J*kf/(kT*np*Kc*2*tsigmaw);
kiwr=kpwr/tiw;
%Filtro di smoothing
tsm=tsigmaw*4*1.2;
%=========== PARAMETRI DELL'ACCOPPIAMENTO MECCANICO ===================

wom=8*2*pi;     %pulsazione caratteristica dell'accoppiamento meccanico
dm=0.1;         %smorzamento dell'accoppiamento meccanico
wris=wom*sqrt(1-2*dm^2); %pulsazione di risonanza
kt=wom^2*Jl;    % costante elastica
dw=dm*2*kt/wom; % coefficiente di attrito viscoso

%Regolatore tetar
teqt=tsm+4*tsigmaw+Tt*1.5;
%massimo valore di kteta ammesso con acc. elastico e misura diretta
kteta=sqrt(1+(teqt*wris)^2)*wris*sqrt(dm^2-dm^4);
%=========== PARAMETRI TRAIETTORIA ===================================
wrmax=300;          %velocità massima
amax=0.5*Crn*np/(J+Jl);    %accelerazione massima
tr=.0;              %tempo di salita dell'accelerazione
t1=.2;              %metà del tempo di spostamento
tl=0.4;             %tempo di lavorazione