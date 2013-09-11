
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab + Arduino - Telesketch                     %
% Author: Mario Pérez Esteso - Geeky Theory         %
% Blog: www.geekytheory.com                         %
% Facebook Page: www.facebook.com/geekytheory       %
% Twitter: @geekytheory                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clc;
x=zeros(1, 100000); %Vector donde se guardarán los datos X
y=zeros(1, 100000); %Vector donde se guardarán los datos Y


%Inicializo el puerto serial que utilizaré

% - Windows
% delete(instrfind({'Port'},{'COM6'}));
% puerto_serial=serial('COM6');

% - Linux
delete(instrfind({'Port'},{'/dev/ttyUSB1'}));
puerto_serial=serial('/dev/ttyUSB1');

puerto_serial.BaudRate=9600;

warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%Abro el puerto serial
fopen(puerto_serial); 

%Declaro el contador de muestras
contador_muestras=1;

%Creo una ventana para la gráfica
figure('Name','Telesketch - GEEKY THEORY')
title('Matlab + Arduino - Telesketch');
xlabel('X');
ylabel('Y');
grid off;
hold on;
ylim([0 5.0]); 
xlim([0 5.0]); 
lHandle = line(nan, nan);

%Bucle while para que tome y dibuje las muestras
while true
        valor_potenciometro_X=fscanf(puerto_serial,'%d')';
        valor_potenciometro_Y=fscanf(puerto_serial,'%d')';
        x(contador_muestras)=(valor_potenciometro_X(1))*5/1024;
        y(contador_muestras)=(valor_potenciometro_Y(1))*5/1024;
        
        X = get(lHandle, 'XData');
        Y = get(lHandle, 'YData');

        x = [X x(contador_muestras)];
        y = [Y y(contador_muestras)];

        set(lHandle, 'XData', x, 'YData', y);
        
        %DRAWNOW es muy importante para la representación en tiempo real
        drawnow
        contador_muestras=contador_muestras+1;
end

fclose(puerto_serial); 
delete(puerto_serial);
clear all;

