%% Estudio caso: COVID19
%  Estudiamos en base a graficos la situacion de la pandemia en Argentina.
%  Datos actualizados a: octubre 6 (Fuente wikipedia)

%% Preparo el entorno
close all;  % Cierro figuras existentes abiertas
clear;      % Limpio el Workspace
clc;        % Limpio el Command Windows

%% Cargo en Workspace el archivo covid19.csv
tabla       = readtable('covid19.csv');	% Leo los datos y los guardo en formato tabla

%% Obtengo datos de las tablas y vector de tiempos

% Datos de la tabla:
confirmados = tabla{:,1}; % Guardo en confirmados todas las filas de la primer columna
fallecidos	= tabla{:,2}; % Guardo en confirmados todas las filas de la segunda columna
recuperados = tabla{:,3}; % Guardo en confirmados todas las filas de la tercera columna

% Vector de dias:
dias(:,1)	= 1:1:length(confirmados);  % Creo vector de dias 1,2,3,4,..., tamano vector confirmados

%% Grafico de recuperados

% Grafico (dias, recuperados):
%figure(1);
plot(dias, recuperados);    % Grafico de recuperados vs. dias continuo

% Grafico (dias, recuperados) discretizado:
%figure(2);
stem(dias, recuperados);    % Grafico de recuperados vs. dias discretizado

%% Editando grafico de recuperados 

figure(1);                                      % Armo una figura donde va el grafico
plot(dias, recuperados);                        % Grafico recuperados vs. dias
title('Enfermos COVID19 recuperados 10-06');    % Agrego titulo
xlabel('Tiempo [dias]');                     	% Agrego label al eje x
ylabel('Recuperados');                          % Agrego label al eje y

%xlim([0 recuperados(end,1)]);                  % Este no funciona porque es contenido de recuperados(218,1) 
xlim([0 length(recuperados)]);                  % Agrego limite de la escala en el eje x

grid on;                                        % Activo grilla (grid off) para desactivar.


%% Grafico de enfermos, recuperados y fallecidos
figure(2);                      % Armo una figura donde va el grafico
plot(dias, confirmados);        % Grafico confirmados vs. dias
hold on;                        % Hold on para continuar graficando sin perder los graficos anteriores
plot(dias, recuperados);        % Grafico recuperados vs. dias
plot(dias, fallecidos);         % Grafico fallecidos vs. dias
hold off;                       % Desactivo hold
title('Casos COVID19 OCT-06');  % Agrego titulo
xlabel('Tiempo [dias]');      	% Agrego label al eje x
grid on;                        % Activo grilla


%% Editando grafico de enfermos, recuperados y fallecidos
figure(3);                      % Armo una figura donde va el grafico
plot(dias, confirmados, '--+r');% Grafico confirmados vs. dias
hold on;                        % Hold on para continuar graficando sin perder los graficos anteriores
plot(dias, recuperados, '-+m');	% Grafico recuperados vs. dias
plot(dias, fallecidos, 'b');    % Grafico fallecidos vs. dias
hold off;                       % Desactivo hold
title('Casos COVID19 OCT-06');  % Agrego titulo
xlabel('Tiempo [dias]');      	% Agrego label al eje x
grid on;                        % Activo grilla


%% Grafico final: enfermos, recuperados y fallecidos
figure(4);                      % Armo una figura donde va el grafico
plot(dias, confirmados, 'sb'); 	% Grafico confirmados vs. dias
hold on;                        % Hold on para continuar graficando sin perder los graficos anteriores
plot(dias, recuperados, 'sg');	% Grafico recuperados vs. dias
plot(dias, fallecidos, 'sr');   % Grafico fallecidos vs. dias
hold off;                       % Desactivo hold
title('Casos COVID19 OCT-06');  % Agrego titulo
xlabel('Tiempo [dias]');      	% Agrego label al eje x

legend('Confirmados', 'Recuperados', 'Fallecidos');    % Agrego leyendas en el orden que se hicieron los graficos


%% Grafico final: enfermos, recuperados y fallecidos
figure(5);                      % Armo una figura donde va el grafico
stem(dias, confirmados, 'sb'); 	% Grafico confirmados vs. dias
hold on;                        % Hold on para continuar graficando sin perder los graficos anteriores
stem(dias, recuperados, 'sg');	% Grafico recuperados vs. dias
stem(dias, fallecidos, 'sr');   % Grafico fallecidos vs. dias
hold off;                       % Desactivo hold
title('Casos COVID19 OCT-06');  % Agrego titulo
xlabel('Tiempo [dias]');      	% Agrego label al eje x
grid on;                        % Activo grilla
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x

legend('Confirmados', 'Recuperados', 'Fallecidos');    % Agrego leyendas en el orden que se hicieron los graficos


%% Grafico subplots forma 1: Enfermos, recuperados y fallecidos
figure(6);                      % Armo una figura donde va el grafico
subplot(3,1,1);                 % Indico que el grafico a continuacion ocupa la posicion 1 
stem(dias, confirmados, 'sb');	% Grafico en la posicion 1 de la matriz 3x1 de la figura
title('Casos confirmados');     % Agrego titulo del primer grafico
subplot(3,1,2);                 % Indico que el grafico a continuacion ocupa la posicion 2 
stem(dias, recuperados, 'sg');	% Grafico en la posicion 2 de la matriz 3x1 de la figura
title('Casos recuperados');     % Agrego titulo del segundo grafico
subplot(3,1,3);                 % Indico que el grafico a continuacion ocupa la posicion 3 
stem(dias, fallecidos, 'sr');   % Grafico en la posicion 3 de la matriz 3x1 de la figura
title('Fallecidos totales');    % Agrego titulo del tercer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x


%% Grafico subplots forma 2: Enfermos, recuperados y fallecidos
figure(7);                      % Armo una figura donde va el grafico
subplot(2,2,1);                 % Indico que el grafico a continuaci?n ocupa la posicion 1 
stem(dias, confirmados, 'sb');	% Grafico en la posicion 1 de la matriz 3x1 de la figura
title('Casos confirmados');     % Agrego titulo del primer gr?fico
subplot(2,2,2);                 % Indico que el grafico a continuacion ocupa la posicion 2 
stem(dias, recuperados, 'sg');	% Grafico en la posicion 2 de la matriz 3x1 de la figura
title('Casos recuperados');     % Agrego titulo del segundo grafico
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
subplot(2,2,[3,4]);             % Indico que el gr?fico a continuacion ocupa la posicion 3 
stem(dias, fallecidos, 'sr');   % Grafico en la posicion 3 de la matriz 3x1 de la figura
title('Fallecidos totales');    % Agrego titulo del tercer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x


%% Grafico subplots FINAL: Enfermos, recuperados y fallecidos
figure(8);                      % Armo una figura donde va el grafico
subplot(2,2,1);                 % Indico que el grafico a continuacion ocupa la posicion 1 
stem(dias, confirmados, 'sb');	% Grafico en la posicion 1 de la matriz 3x1 de la figura
title('Casos confirmados');     % Agrego titulo del primer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
grid on;
subplot(2,2,2);                 % Indico que el grafico a continuacion ocupa la posicion 2 
stem(dias, recuperados, 'sg');	% Grafico en la posicion 2 de la matriz 3x1 de la figura
title('Casos recuperados');     % Agrego titulo del segundo grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
grid on;
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
subplot(2,2,[3,4]);             % Indico que el grafico a continuacion ocupa la posicion 3 
stem(dias, fallecidos, 'sr');   % Grafico en la posicion 3 de la matriz 3x1 de la figura
title('Fallecidos totales');    % Agrego titulo del tercer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
grid on;


%% Grafico subplots: Enfermos, recuperados y fallecidos - linkaxes
figure(9);                      % Armo una figura donde va el grafico
g1 = subplot(2,2,1);            % Indico que el grafico a continuacion ocupa la posicion 1 
stem(dias, confirmados, 'sb');	% Grafico en la posicion 1 de la matriz 3x1 de la figura
title('Casos confirmados');     % Agrego titulo del primer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
grid on;
g2 = subplot(2,2,2);            % Indico que el grafico a continuacion ocupa la posicion 2 
stem(dias, recuperados, 'sg');	% Grafico en la posicion 2 de la matriz 3x1 de la figura
title('Casos recuperados');     % Agrego titulo del segundo grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
grid on;
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
g3 = subplot(2,2,[3,4]);        % Indico que el grafico a continuacion ocupa la posicion 3 
stem(dias, fallecidos, 'sr');   % Grafico en la posicion 3 de la matriz 3x1 de la figura
title('Fallecidos totales');    % Agrego titulo del tercer grafico
xlabel('Tiempo [dias]');        % Agrego label al eje x
xlim([0 length(recuperados)]); 	% Agrego limite de la escala en el eje x
grid on;

linkaxes([g1, g2, g3], 'x');    % Linkeo los ejes de los subplots entre si


%% Grafico de multiple señales con hold on (caso canales eeg)


load('eeg_epilepsia');  % Cargo los datos EEG (estructura data)

eeg = data.x;   % Obtengo el valor del campo x (señales) dentro de mi estructura data
fs = data.fs;   % Obtengo el valor del campo fs (frecuencia de muestreo) dentro de mi estructura data
tiempo = data.tiempo;   % Obtengo el eje de tiempo dentro de mi estructura data

[filas, columnas] = size(eeg);  % Obtengo número de filas y columnas que tiene mi matriz de datos  Filas es cada canal y las
                                            % columnas son las muestras que tomo en el tiempo de adquisición.
                            
figure(1); % Grafico todos los canales juntos con hold on
for i=1:filas
    plot(tiempo, eeg(i,:)); hold on;
end
xlim([tiempo(1) tiempo(end)]);
xlabel('tiempo'); ylabel('Amplitud [uV]');

figure(2);  % Grafico todos los canales en distintas coordenadas del eje Y
vBase = 200;
for i=1:filas
    plot(tiempo, eeg(i,:) + i * vBase); hold on;
end
xlim([tiempo(1) tiempo(end)]);
xlabel('tiempo');


%% Ejemplo de YYAXIS

load('eeg_eog');  % Cargo los datos EEG y EOG (estructura data)

figure(1); plot(eeg); % Grafico la señal del EEG
figure(2); plot(eog); % Grafico la señal del EOG 

figure(3);                % Grafico ambas señales en un mismo gráfico
plot(eeg); hold on; plot(eog)

figure(4);                  % Ejemplo de yyaxis
yyaxis right; plot(eeg); % Grafico el EEG usando el eje de la derecha
yyaxis left; plot(eog); % Grafico EOG usando el eje de la izquierda


%% ticks y xline

load('eeg_epilepsia'); % Cargo los datos EEG (estructura data)

eeg = data.x;
canal = eeg(1,:);       % Me quedo con un solo canal (una sola fila de la matriz)

figure(1)                   % Grafico el canal
plot(canal);
xlim([1 length(canal)])

cEpilepsia = 30225;     % Muestra en la cual comienza el episodio de epilepsia (a ojo)
fEpilepsia = 57167;      % Muestra en la cual finaliza el episodio de epilepsia (a ojo)

figure(2);                      % Grafico el canal
plot(canal); hold on;
xlim([1 length(canal)])

xline(cEpilepsia, '--b'); xline(fEpilepsia, '--r');     % Grafico líneas verticales donde comienza el episodio y finaliza

xticks([cEpilepsia fEpilepsia])                             % Cambio los ticks del gráfico
xticklabels({'Comienza epilepsia','Fin epilepsia'})
