clc
clear all
close all

% PRIMER PUNTO Y SEGUNDO PUNTO

Fm=360;Tm=1/Fm;%Frecuencia y periodo de la señal
ECG=importdata('ECGClean1.txt');N=length(ECG);%cargar la señal
t=0:Tm:Tm*(N-1);%Tiempo de muestreo
ECG=ECG-mean(ECG);%quitar nivel DC
ECG1=ECG;
ECG2=ECG;
subplot(4,1,1);plot(ECG);title('SEÑAL ECG');

%QRS                         FRECUENCIAS DE QRS ENTRE (15.47:40)
ECG(1:85)=0; ECG(135:375)=0; ECG(423:663)=0; ECG(711:951)=0; ECG(1000:1240)=0; ECG(1287:1527)=0; 
ECG(1574:1814)=0; ECG(1862:2102)=0; ECG(2146:2386)=0; ECG(2434:2674)=0; ECG(2721:2961)=0;
subplot(4,1,2); plot(ECG,'r');title('SEGMENTO QRS');
[Px,Fx]=pwelch(ECG,[],[],2^8,Fm);

%P
ECG1(1:42)=0; ECG1(68:329)=0; ECG1(356:615)=0; ECG1(643:902)=0; ECG1(931:1189)=0; ECG1(1218:1476)=0; 
ECG1(1504:1763)=0; ECG1(1791:2050)=0; ECG1(2078:2337)=0; ECG1(2365:2624)=0; ECG1(2652:2911)=0; ECG1(2939:3000)=0;
subplot(4,1,3); plot(ECG1,'m');title('SEGMENTO P');
[Px1,Fx1]=pwelch(ECG1,[],[],2^8,Fm);

%ST
ECG2(1:175)=0; ECG2(226:461)=0; ECG2(513:749)=0; ECG2(800:1036)=0; ECG2(1087:1323)=0; ECG2(1374:1611)=0; 
ECG2(1661:1897)=0; ECG2(1948:2184)=0; ECG2(2235:2470)=0; ECG2(2522:2758)=0; ECG2(2809:3000)=0;
subplot(4,1,4); plot(ECG2,'b');title('SEGMENTO ST');
[Px2,Fx2]=pwelch(ECG2,[],[],2^8,Fm);

figure(2)
plot(Fx,Px,'r');hold on;
plot(Fx1,Px1,'m');hold on;
plot(Fx2,Px2,'b');hold on;title('PWELCH');

%%

% TERCER PUNTO Y CUARTO PUNTO

clc
clear all
close all
% 
% delete(instrfind({'Port'},{'COM10'})); %borrar previos
% s = serial('COM10','BaudRate',9600,'Terminator','CR/LF');%crear objeto serie
% warning('off','MATLAB:serial:fscanf:unsuccessfulRead');%puerto serial matlab
% fopen(s); %abrir puerto

Fm=360;Tm=1/Fm;%Frecuencia y periodo de la señal
ECG=importdata('ECGClean1.txt');N=length(ECG);%cargar la señal
t=0:Tm:Tm*(N-1);%Tiempo de muestreo
ECG=ECG-mean(ECG);%quitar nivel DC
ECGF=ECG;

j=1;
k=1;
for i=300:1:N
    x=((i-299):i);
    [Pxf,Fxf]=pwelch(ECGF(x),[],[],2^8,Fm);
    z=[Pxf, Fxf];
    subplot(2,1,1);plot(Fxf,Pxf);axis([0 180 0 500]);
    subplot(2,1,2);plot(x,ECGF(x),'b');axis([0 3000 -200 500]),hold on
    drawnow
    if (Pxf<=300)
%         disp('qrs detectado'), disp(i)
%         fwrite(s,Pxf,'uint8');      
        y(j)=i;Y=length(y);
        j=j+1;
    end
    K=1+(k*29);
    if (j==K)
        Fc=60/((y(j-1)*Tm)-(y(j-28)*Tm));
        disp('FRECUENCIA CARDIACA'), disp(Fc)
        k=k+1;
    end
end

% fclose(s);%cierra puerto serial
% delete(s)%borra datos del puerto serial
% clear s %borra la variable s
% disp('STOP')
