clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=1e-3;

%=========== PARAMETRI DEL SISTEMA DI CONTROLLO =========================

Tt=0.010;       %Tempo di campionamento del controllo di posizione
tsigmaw=0.00185;%somma delle costanti di tempo dell'anello di velocità
Tew=4*tsigmaw;  %Costante di tempo equivalente dell'anello di velocità
Tfw=0.0088;       %Costante di tempo del filtro di smoothing
teqt=1.5*Tt+Tew+Tfw; %somma delle costanti di tempo dell'anello di posizione

%=========== PARAMETRI DELLA LAVORAZIONE ==============================

r=50e-3;    % Raggio della traiettoria
dr=5e-6;    % Massimo scostamento ammesso

%=========== PARAMETRI DELL'ACCOPPIAMENTO MECCANICO ===================

wom=8*2*pi; %pulsazione caratteristica dell'accoppiamento meccanico
dm=0.1;     %smorzamento dell'accoppiamento meccanico
wris=wom*sqrt(1-2*dm^2);

%=========== PROGETTO DEL SISTEMA DI CONTROLLO =========================

kteta=sqrt(1+wris^2*teqt^2)*wris*sqrt(dm^2-dm^4);%Valore massimo del kteta
wref=0.55; %calcolare wref utilizzando il diagramma di bode in anello chiuso
Go1=tf(1,[teqt/kteta/wom^2 (teqt*2*dm/wom^2+1/wom)/kteta (teqt+2*dm/wom)/kteta 1/kteta 1]);

Gp=tf(kteta,[teqt 1 0]);
Gteta=tf(1,[1/(wom^2) (2*dm)/wom 1]);
G0=(Gp*Gteta)/(1+Gp*Gteta);

UpperLimit = tf(1+(dr/r),1);
LowerLimit = tf(1-(dr/r),1);
