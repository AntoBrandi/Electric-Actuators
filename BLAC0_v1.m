%% BLAC 0 - 13/01/2019

clear all;

% DICHIARAZIONI VARIABILI PER LA SIMULAZIONE
% Parametri del motore PMSM (Macchina Sincrona a Magneti Permanenti)
Rs = 3.1/2;
Lsd=0.005/2;
Lsq=Lsd;
np=2;
J=0.0000251;
B=3.8e-005;
lambdaf=0.09;
PSIPM=lambdaf;
ms=3;
Kc=ms*np*lambdaf/2;
Rfe=1100;

% Riferimento di Velocità e di Coppia di Carico
% Riferimento di Velocità
wrr=1256.6;
% Riferimento di Coppia
Crn=0.6;
Cr0=0;

% Calcolo di Corrente e Tensione nominale
% Corrente Nominale
iqn=Crn/Kc; 
Vdn=-1256.6*Lsq*iqn;
Vqn=Rs*iqn+1256.6*lambdaf;
Vn=sqrt(Vdn^2+Vqn^2);

% Parametri e Simulazione
% Ritardo nella applicazione della coppia
Tc=1e-4;
