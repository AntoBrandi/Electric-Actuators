clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=1e-4;

%=========== PROGETTO DEL SISTEMA DI CONTROLLO =========================

Tt=0.010;       %Tempo di campionamento del controllo di posizione
tsigmaw=0.00185;%somma delle costanti di tempo dell'anello di velocità
Tew=4*tsigmaw;  %Costante di tempo equivalente dell'anello di velocità
Tfw=0.0088;       %Costante di tempo del filtro di smoothing
teqt=1.5*Tt+Tew+Tfw; %somma delle costanti di tempo dell'anello di posizione

%=========== PARAMETRI DELL'ACCOPPIAMENTO MECCANICO ===================

wom=8*2*pi; %pulsazione caratteristica dell'accoppiamento meccanico
dm=0.1;     %smorzamento dell'accoppiamento meccanico
wris=wom*sqrt(1-2*dm^2);

%=========== RIFERIMENTO DI POSIZIONE =====================================
tetarr=1;tetar0=0;

% per lo smorzamento critico
kpteta=1/(2*teqt);
% per la risonanza
kpteta= 15;

risp = 1/(sqrt( (1-((wris^2*teqt)/kpteta))^2 + (wris/kpteta)^2 )) * 1/(sqrt(4*dm^2-4*dm^4));

kpteta = 0.5*wris*sqrt(1+(teqt*wris)^2)*sqrt(4*dm^2-4*dm^4);

% Funzione di trasferimento del sistema di misura Indiretto
Gp = tf(kpteta,[teqt 1 0]);
Gteta = tf(1,[1/(wom^2) (2*dm)/wom 1]);
G0 = (Gp/(1+Gp))*Gteta;
G0D = (Gp*Gteta)/(1+Gp*Gteta);


