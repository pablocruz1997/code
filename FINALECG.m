clear all
clc
clear image
FC=input('Frecuencia cardiaca: ');
NC=input('Ciclos: ');
%% Valores normales amplitudes
AmpP=input('Amplitud onda P (normal: 0.1): ');
AmpQ=input('Amplitud onda Q (normal: -0.09): ');
AmpR=input('Amplitud onda R (normal: 1): ');
AmpS=input('Amplitud onda S (normal: -0.3): ');
AmpT=input('Amplitud onda T (normal: 0.2): ');
%% Generación de la señal
[bpm,ECG]=senalECG(FC,AmpP,AmpQ,AmpR,AmpS,AmpT);
%Tiempo
muestra=(1/length(ECG))*bpm;
T=0:muestra:muestra*(length(ECG)-1);
S=0;
%% Siulación en tiempo real
h = animatedline;
title('ECG Simulado')
xlabel('Tiempo s')
ylabel('Amplitud mV')
axis([(0) (bpm*NC) -0.5 1.5])
n=0;
for j=1:NC   
for i=1:length(ECG)   
addpoints(h,T(i)+n,ECG(i));    
drawnow 
    end
    n=n+bpm;

end
