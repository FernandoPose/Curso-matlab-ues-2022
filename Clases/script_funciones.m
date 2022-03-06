%% Preparo el entorno
%

close all;
clear;
clc;

%% Cargo en workspace el archivo

tabla = readtable('presion_sistolica.csv');
edad = tabla{:, 1};
presion = tabla{:, 2};

%%

figure(1);
subplot(1,2,1);
hist(presion);
xlabel('Presion sistolica [mmHg]');
ylabel('Frecuencia');

subplot(1,2,2);
hist(edad);
xlabel('Edad [años]');
ylabel('Frecuencia');

%%

[presion_max, pos_max] = max(presion);
[presion_min, pos_min] = min(presion);

figure(2);
plot(presion); hold on;
plot(pos_max, presion_max, 'sr', 'LineWidth', 2);
plot(pos_min, presion_min, 'sr', 'LineWidth', 2);

vec_aux = nan(length(presion), 1);
vec_aux(pos_max) = presion_max;
vec_aux(pos_min) = presion_min;

figure(3);
plot(presion); hold on;
plot(vec_aux, 'sr', 'LineWidth', 2);

%%

presion_media = mean(presion);
presion_desvio = std(presion);
presion_varianza = var(presion);
presion_mediana = median(presion);
presion_moda = mode(presion);


figure(3);
hist(presion);
xline(presion_media);
xline(presion_mediana);
xline(presion_moda);



%% scatter

figure(4);
scatter(edad, presion)


coefs = polyfit(edad, presion, 1);
presion_aj = polyval(coefs, edad);

figure(5);
scatter(edad, presion); hold on;
plot(edad, presion_aj)

R =  corrcoef(edad, presion);

m = coefs(1);
b = coefs(2);

res = strcat('y = ', num2str(m), '*x', '+', num2str(b));

disp(res);




%% Interpolación

valor_inicio = 0;
salto = 0.001;
valor_final = 12*pi;

x = valor_inicio:salto:valor_final;

y = sin(x);

plot(x, y);

nSEN = y;

for i=1:100:length(x)-100
    r = randi([50 100], 1, 1);
    nSEN(i:i+r) = NaN; 
end

nSEN_i = interp1(nSEN, 1:length(nSEN), 'spline');



%%

load('ECG');


ecg = signal;

ecg_n = ecg;

for i=1:100:length(ecg_n)-100
    r = randi([1 25], 1, 1);
    ecg_n(i:i+r) = NaN; 
end



ecg_n_i = interp1(ecg_n, 1:length(ecg_n), 'spline');

plot(ecg); hold on; plot(ecg_n_i, 'r');





























