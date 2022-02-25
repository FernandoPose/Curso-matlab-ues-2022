%%  Preparo el entorno
%

close all;
clear;
clc; 

%% Cargar el dataset

tabla = readtable('covid19.csv');
confirmados = tabla{:,1}; 
fallecidos = tabla{:,2}; 
recuperados = tabla{:,3}; 

clear tabla 


%%


tiempo = 1:1:length(confirmados);

figure(1); 
stem(tiempo, confirmados);
xlabel('Tiempo [dias]'); ylabel('Casos');
title('Casos COVID19 recuperados 10-06');

xlim(  [0 tiempo(end)]  );
grid on;



%%

figure(2);
g1 = subplot(2,2,1);
stem(tiempo, confirmados, 'sb'); 
xlabel('Tiempo [dias]'); ylabel('Confirmados', 'LineWidth', 14);
grid on
xlim(  [0 tiempo(end)]  );
g2 = subplot(2,2,2);
stem(tiempo, fallecidos, 'sg');
xlabel('Tiempo [dias]'); ylabel('Fallecidos');
grid on
xlim(  [0 tiempo(end)]  );
g3 = subplot(2,2,[3 4]);
stem(tiempo, recuperados, 'sr');
xlabel('Tiempo [dias]'); ylabel('Recuperados');
grid on
%title('Casos COVID19 recuperados 10-06');
xlim(  [0 tiempo(end)]  );

linkaxes([g1, g2, g3], 'x');





%%

load('eeg_epilepsia.mat');

eeg = data.x;

[fila, columnas] = size(eeg);

vBase = 400;

for i=1:fila
    plot(eeg(i,:) + i * vBase); hold on;
end


%%

load('eeg_eog.mat');

figure(1);
yyaxis right; plot(eeg); hold on;
yyaxis left; plot(eog)




%% 

load('eeg_epilepsia.mat');
registro = data.x;
eeg = registro(1,:);

plot(eeg); hold on;
xline(30225)
xline(57167)

xticks([30225 57167]);
xticklabels({'Comienzo epilepsia', 'Fin epilepsia'})


























