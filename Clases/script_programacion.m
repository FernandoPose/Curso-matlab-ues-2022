%% Preparamos el entorno
%

close all;
clear;
clc;

%%
%

X = imread('onerice.png');

imshow(X)

[fImg, cImg] = size(X);

min_img = min(min(X));
max_img = max(max(X));

str = sprintf('Forma de la matriz: %d x %d. Mínimo valor: %d. Máximo valor: %d', fImg, cImg, min_img, max_img);

disp(str)


X = imread('rices.png');
umbral = 200;
Y = funcion_segmentar(X, umbral);
imshow(Y);

figure(1);
subplot(221); imshow(X); subplot(222); imshow(Y);
subplot(223); plot(X(180,:)); subplot(224); plot(Y(180,:));














