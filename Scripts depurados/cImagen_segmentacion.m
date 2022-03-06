function [Y, area] = cImagen_segmentacion(X, umbral)
    [fImg, cImg] = size(X);   
    Y = zeros(fImg, cImg);
    area = 0;

    for i=1:fImg
        for j=1:cImg
            if X(i,j) > umbral
                Y(i, j) = 255;
                area = area + 1;
            end
        end
    end
end