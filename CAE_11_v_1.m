clear all
%========== CONFIGURATION PARAMETERS - Solver - =======================
fixed_step_size=1e-4;

%===========PARAMETRI MODELLO PMSM=========================================

Rs=1;Lsd=0.005;Lsq=Lsd;np=4;J=0.001;Jl=J;
B=0;lambdam=0.1;ms=3;Kc=ms*np*lambdam/2;

%===========VALORI INIZIALI DELLE VARIABILI STATO==========================

wr0=0;                                          %velocità iniziale
teta0=0;                                        %posizione iniziale di rotore

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
Crn=.6;Cr0=0;

%=========== PARAMETRI TRAIETTORIA 1 ===================================
wrmax=300;          %velocità massima
amax=600;           %accelerazione massima
tr=.0001;              %tempo di salita dell'accelerazione
t1=.2;              %metà del tempo di spostamento
tl=0.4;             %tempo di lavorazione

%=========== PARAMETRI TRAIETTORIA 2 ===================================
 %wrmax=300;          %velocità massima
%  amax=1200;           %accelerazione massima
%  tr=.1;              %tempo di salita dell'accelerazione
%  t1=.2001;              %metà del tempo di spostamento
%  tl=0.4;             %tempo di lavorazione

 coeff=1;