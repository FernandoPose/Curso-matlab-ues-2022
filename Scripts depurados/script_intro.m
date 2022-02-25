clc;                    % Limpia command window
clear;                  % Limpia workspace

A = 5;                  % Creo una variable A con valor 5
B = A + 2;              % Sumo A mas 2 y lo asigno a una nueva variable B

Palabra = 'hola';       % Creo una variable llamada Palabra y le asigno un string
A       = Palabra;      % Le asigno a A (variable double) Palabra (variable char)

num_1   = 2 + 3j;       % Defino primer numero complejo. Notar J
num_2   = 7 - 9i;       % Defino segundo numero complejo. Notar I

z = num_1 + num_2;      % Sumo los numeros complejos

z_mod   = abs(z);       % Calculo modulo del numero complejo
z_fase  = angle(z);     % Calculo la fase del numero complejo


vec_a   = [1,2,3,4,5];  % Creo vector fila
vec_b   = [5;4;3;2;1];  % Creo vector columna

tam_a   = length(vec_a);% Calculo el tamano (cantidad de datos) del vect_a
tam_b   = length(vec_b);% Calculo el tamano (cantidad de datos) del vect_b

vec_b_r = sqrt(vec_b);  % Calculo raiz cuadrada elemento a elemento del vector

res_vec_1   = vec_a * vec_b; % Calculo (1x5) * (5x1) = 1x1 (multiplicacion vectorial)
res_vec_2   = vec_b * vec_a; % Calculo (5x1) * (1x5) = 5x5 (multiplicacion vectorial)

res_vec_p   = vec_a .* vec_a;% Calculo producto de vectores punto a punto 

c           = 2;            % Defino escalar
vec_1_c     = c .* vec_a;   % Multiplico vector por escalar     

elemento    = vec_b(2);     % Asigno elemento de la posicion 2 del vector vec_b a elemento

elementos_f_1 = vec_b(4:5);                             % Asigno ultimos dos elementos de vec_b a elementos_f_1
elementos_f_2 = vec_b(length(vec_b)-1:end);             % Asigno ultimos dos elementos de vec_b a elementos_f_2
elementos_f_3 = vec_b(length(vec_b)-1:length(vec_b));   % Asigno ultimos dos elementos de vec_b a elementos_f_3

matriz_1        = [1,2,3 ; 6,5,4 ; 7,8,9];	% Defino una matriz de 3x3
matriz_inv_1    = inv(matriz_1);            % La matriz no es inversible

matriz_2        = [2,1,3 ; -1,2,4 ; 0,1,3];	% Defino una matriz de 3x3
matriz_inv_2    = inv(matriz_2);           	% La matriz no es inversible

matriz_dimension    = size(matriz_1);   % Forma 1 de obtener dimensiones
[nFilas, nColumnas]	= size(matriz_1);   % Forma 2 de obtener dimensiones

matriz_1_transpuesta    = matriz_1';    % Transponer matriz


%% Calculo de producto escalar entre vectores

vec_a       = [1,2,3,4,5];  % Creo vector fila
vec_b       = [5;4;3;2;1];  % Creo vector columna

vec_b       = vec_b';       % Transpuesta para que ambos vectores tengan igual dimension

producto_1  = sum(vec_a .* vec_b); % Primera forma de obtener el producto escalar
producto_2  = dot(vec_a', vec_b'); % Segunda forma utilizando funciones de Matlab

%% Obtener los maximos de cada fila de la matriz matriz_1

matriz_1	= [1,2,3 ; 6,5,4 ; 7,8,9];	% Defino una matriz de 3x3
max_c_f     = max(matriz_1);            % Calcula maximos de columnas

matriz_2    = matriz_1';                % Transpongo matriz
max_c       = max(matriz_2);            % Calculo maximos de columnas que eran las filas


