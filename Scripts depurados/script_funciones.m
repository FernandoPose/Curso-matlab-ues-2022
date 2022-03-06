%% Estudio caso: Presion sistolica
%  Estudiamos una base de datos de presiones sistolicas

%% Preparo el entorno
close all;  % Cierro figuras existentes abiertas
clear;      % Limpio el Workspace
clc;        % Limpio el Command Windows

%% Cargo en Workspace el archivo covid19.csv
tabla       = readtable('presion_sistolica.csv'); % Leo los datos y los guardo en formato tabla

%% Obtengo datos de las tablas
% Datos de la tabla:
edad    = tabla{:,1};   % Guardo en confirmados todas las filas de la primer columna
presion	= tabla{:,2};   % Guardo en confirmados todas las filas de la segunda columna

%% Grafico datos
%  Esto se hace a fin de conocer la distribucion de los datos de los cuales partimos

figure(1);                          % Armo una figura donde van los histogramas
subplot(1,2,1);                     % Indico que el histograma a continuacion ocupa la posicion 1 
hist(presion);                      % Grafico el histograma en la posicion 1 de la matriz 1x2 de la figura
xlabel('Presion sistolica [mmHg]'); % Agrego label al eje x del histograma 1
ylabel('Frecuencia');               % Agrego label al eje y del histograma 1
subplot(1,2,2);                     % Indico que el histograma a continuacion ocupa la posicion 2 
hist(edad);                         % Grafico el histograma en la posicion 2 de la matriz 1x2 de la figura
xlabel('Edad [anos]');              % Agrego label al eje x del histograma 1
ylabel('Frecuencia');               % Agrego label al eje y del histograma 2


%% Calculo maximos y minimos

[presion_max, pos_max]	= max(presion);     % Calculo presion maxima y posicion en el vector de presion
[presion_min, pos_min]  = min(presion);     % Calculo presion minima y posicion en el vector de presion

%% Grafico de presion con maximo y minimo

figure(2);                              % Armo una figura donde va el grafico
plot(presion);                          % Grafico la presion
hold on;                                % Hold para graficar otro plot en misma figura de forma superpuesta
ylabel('Presion sistolica [mmHg]');     % Agrego label al eje y

% plot(pos_max, presion_max, 'sr', 'LineWidth',2);  
% plot(pos_min, presion_min, 'sr', 'LineWidth',2);  


vec_aux = nan(length(presion),1);       % Armo un vector de Na del tamano del vector presion
vec_aux(pos_max) = presion_max;         % En la posicion de maximo (indice del vector) le agrego el valor de la curva presion
vec_aux(pos_min) = presion_min;         % En la posicion del minimo (indice del vector) le agrego el valor de la curva presion
plot(vec_aux, 'sr', 'LineWidth',2);     % Grafico los dos puntos. Donde hay NA no grafica


%% Calculo estadisticos: Media, Desvio estandar, varianza, mediana y moda

presion_media       = mean(presion);    % Calculo media de presion
presion_desvio      = std(presion);     % Calculo desvio estandar de presion
presion_varianza    = var(presion);     % Calculo la varianza
presion_mediana     = median(presion);  % Calculo la mediana
presion_moda        = mode(presion);    % Calculo la moda


%% Grafico histograma junto a media, mediana y moda

figure(3);                                              % Armo una figura donde va el grafico
hist(presion);                                          % Grafico el histograma en la figura 3
xlabel('Presion sistolica [mmHg]');                     % Agrego label al eje x 
ylabel('Frecuencia');                                   % Agrego label al eje y 
hold on;
line([presion_media presion_media], [0 6],...           % Grafico linea en presion media
        'LineWidth',0.5,'Color','r','LineStyle','--');

% xline(presion_media);
    
line([presion_mediana presion_mediana], [0 6],...       % Grafico linea en mediana de la presion
    'LineWidth',0.5,'Color','y','LineStyle','--');

% xline(presion_mediana);

line([presion_moda presion_moda], [0 6],...             % Grafico linea en moda de la presion
    'LineWidth',0.5,'Color','g','LineStyle','--');

% xline(presion_moda);

%% Grafico de dispersion - scatter

figure(4);                  % Armo una figura donde va el grafico
scatter(edad, presion);     % Grafico dispersion entre variable edad y presion

%% Regresion lineal

% Realizo la recta de regresion lineal
coefs       = polyfit(edad, presion, 1);    % Obtengo los coeficientes de un polinomio de primer orden (recta)
presion_aj  = polyval(coefs, edad);         % Obtengo los valores de presion respecto a la recta de ajuste

figure(5);                  % Armo una figura donde va el grafico
scatter(edad, presion);     % Grafico dispersion entre variable edad y presion
hold on;                    % Hold para graficar otro plot en misma figura de forma superpuesta
plot(edad, presion_aj);     % Grafico las presiones de la rregresion respecto a la edad
hold off;                   % Desactivo el hold on (en este caso no es necesario)

%% Coeficiente de correlacion
R = corrcoef(edad,presion); % Calculo el coeficiente de correlacion de Pearson

%% Datos finales:
m = coefs(1);       % Obtengo la pendiente de la recta de regresion
b = coefs(2);       % Obtengo la ordenada al origen de la recta de regresion

res = strcat('y=', num2str(m), '*x', num2str(b));   % Armo string para mostrar en consola
disp(res)                                           % Muestro recta de regresion

% disp(['y=', num2str(m), '*x', num2str(b)])













%% INTERPOLACION


% SENO SINTETIZADO
x = 0:0.001:12*pi;
y = sin(x);

plot(x,y)

nSEN = y;

for i=1:100:length(x)-100
    r = randi([50 100], 1, 1);
    nSEN(i:i+r) = NaN;
end


nSEN_i = interp1(nSEN,1:length(nSEN), 'spline'); 

plot(y); hold on; plot(nSEN_i, 'r');


% SEÑAL REAL

load('ECG');

ecg = signal;
plot(ecg);

ecg_n = ecg;

for i=1:100:length(ecg)-100
    r = randi([1 25], 1, 1);
    ecg_n(i:i+r,1) = NaN;
end

plot(ecg); hold on; plot(ecg_n, 'r');

ecg_n_i = interp1(ecg_n,1:length(ecg_n), 'spline'); 

plot(ecg); hold on; plot(ecg_n_i, 'r');







