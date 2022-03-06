%% Segmentación de arroz
%  
%

%% Preparo el entorno
close all;  % Cierro figuras existentes abiertas
clear;      % Limpio el Workspace
clc;        % Limpio el Command Windows

%% Cargo en Workspace la imagen onerice.png y la muestro

X = imread('onerice.png'); % Lectura de la imagen en escala de grises
imshow(X); % Muestro la imagen cargada en el Workspace en escala de grises


%% Obtengo características de la imagen
%

[fImg, cImg] = size(X);   % Obtengo la forma de la matriz [filas, columnas]
min_img = min(min(X));    % Obtengo el valor mínimo de gris en la matriz   
max_img = max(max(X));    % Obtengo el valor máximo de gris en la matriz

% Imprimo resultados:
str = sprintf('Forma de la matriz: %d x %d. Mínimo valor: %d. Máximo valor: %d.  ',fImg, cImg, min_img, max_img);
disp(str);


%% Segmentación del grano de arroz
%

Y = zeros(fImg, cImg);
area = 0;

umbral = 170;

for i=1:fImg
    for j=1:cImg
        if X(i,j) > umbral
            Y(i, j) = 255;
            area = area + 1;
        end
    end
end

imshow(Y)

figure(1);
subplot(221); imshow(X); subplot(222);imshow(Y)
subplot(223); plot(X(183,:)); subplot(224); plot(Y(183,:))

disp(area);

% [Y, area] = cImagen_segmentacion(X, umbral);
% imshow(Y)
% figure(1);
% subplot(221); imshow(X); subplot(222);imshow(Y)
% subplot(223); plot(X(183,:)); subplot(224); plot(Y(183,:))
% disp(area);











%% Segmentación de arroz (muchos granos)
%  
%

%% Preparo el entorno
close all;  % Cierro figuras existentes abiertas
clear;      % Limpio el Workspace
clc;        % Limpio el Command Windows

%% Cargo en Workspace la imagen onerice.png y la muestro

X = imread('rices.png'); % Lectura de la imagen en escala de grises
imshow(X); % Muestro la imagen cargada en el Workspace en escala de grises

umbral = 200;
[Y, area] = cImagen_segmentacion(X, umbral);
imshow(Y)
figure(1);
subplot(221); imshow(X); subplot(222);imshow(Y)
subplot(223); plot(X(183,:)); subplot(224); plot(Y(183,:))
disp(area);

%% Obtengo características de la imagen
%

[fImg, cImg] = size(X);   % Obtengo la forma de la matriz [filas, columnas]
min_img = min(min(X));    % Obtengo el valor mínimo de gris en la matriz   
max_img = max(max(X));    % Obtengo el valor máximo de gris en la matriz

% Imprimo resultados:
str = sprintf('Forma de la matriz: %d x %d. Mínimo valor: %d. Máximo valor: %d.  ',fImg, cImg, min_img, max_img);
disp(str);


%% Operación de resta
%

for i=1:fImg
    xmin = min(X(i, :));
    nX(i,:) = X(i, :) - xmin;
end

figure(1);
subplot(121); imshow(X); subplot(122);imshow(nX)


%% Segmentación del grano de arroz
%

Y = zeros(fImg, cImg);
area = 0;

umbral = 60;

for i=1:fImg
    for j=1:cImg
        if nX(i,j) > umbral
            Y(i, j) = 255;
            area = area + 1;
        end
    end
end

figure(1);
subplot(221); imshow(X); subplot(222);imshow(Y)
subplot(223); plot(X(183,:)); subplot(224); plot(Y(183,:))

