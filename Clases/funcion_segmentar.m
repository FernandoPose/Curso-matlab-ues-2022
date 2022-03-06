function Y = funcion_segmentar(X, umbral)

    [fImg, cImg] = size(X);

    Y = zeros(fImg, cImg);
    
    for i=1:fImg
        for j=1:cImg
            if X(i, j) > umbral
                Y(i, j) = 255;  
            end
        end
    end

end
