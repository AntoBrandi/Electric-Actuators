clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=1e-4;

%=========== PROGETTO DEL SISTEMA DI CONTROLLO =========================

Tt=0.010;       %Tempo di campionamento del controllo di posizione
tsigmaw=0.00185;%somma delle costanti di tempo dell'anello di velocità
Tew=4*tsigmaw;  %Costante di tempo equivalente dell'anello di velocità
Tfw=0.0088;       %Costante di tempo del filtro di smoothing
teqt=1.5*Tt+Tew+Tfw; %somma delle costanti di tempo dell'anello di posizione
kteta=1/2/teqt;   %Valore massimo del kteta

%=========== PARAMETRI DELL'ACCOPPIAMENTO MECCANICO ===================

wom=8*2*pi; %pulsazione caratteristica dell'accoppiamento meccanico
dm=0.1;     %smorzamento dell'accoppiamento meccanico
wris=wom*sqrt(1-2*dm^2);

%=========== PARAMETRI DELLA LAVORAZIONE ==============================

r=50e-3;    % Raggio della traiettoria
dr=5e-6;    % Massimo scostamento ammesso
vmax=r*kteta*sqrt(sqrt(8*dr/r)); %Massima velocità ammessa
wref=vmax/r;    %Pulsazione del riferimento


Gp=tf(kteta,[teqt 1 0]);
Gteta=tf(1,[1/(wom^2) (2*dm)/wom 1]);

Gom=tf(1,[teqt/kteta 1/kteta 1]);
G0=series(Gom,Gteta);

UpperLimit = tf(1+(dr/r),1);
LowerLimit = tf(1-(dr/r),1);



% Velocità massima e pulsazione di riferimento
% ricalcolate considerando la presenza dell'accoppiamento
  vmax=r*wom*sqrt(dr/r); %Massima velocità ammessa considerando l'acc. elastico
  vmax=0.05;
  wref=vmax/r;    %Pulsazione del riferimento







