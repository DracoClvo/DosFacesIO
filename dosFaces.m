function dosFaces()
    tableau=input('tableau [maxz;restricciones <=> valores]\n= ');
    var_in_izq = input('ubicacion yis lado izquierdo 0 si no yi \n= ');
    % primera fase
    ln = size(tableau,2);
    tableau(1,:) = tableau(1,:) - sumatoria(var_in_izq,tableau)
    var_in_izq = var_in_izq * -1;
    while(min(var_in_izq)< 0)
        [valin,entra]=min(tableau(1,1:end-1));
        [valout,sale]=min(DivX(tableau(2:end,end),tableau(2:end,entra)));
        var_in_izq(sale) = entra;
        f = sale + 1;
        c = entra;
        tableau(f,:) =tableau(f,:)/ tableau(f,c);
        for i=1:size(tableau,1)  %Hace el gauss
            if i~=f   %No realiza el gauss en la fila pivote
                tableau(i,:)=tableau(i,:)-(tableau(i,c)*tableau(f,:)); %nueva_ecua = anterior_ecua - (coef_columna enterante) x (nueva_ecuac_pivote)
            end
        end
        tableau = ceros(tableau)
    end
end
function suma = sumatoria(variz,tabl)
    suma = zeros(1,size(tabl,2));
    for i=1:size(variz,2)
        if(variz(i) == 1)
            suma = suma + tabl(i+1,:);
        end
    end
end
function tab=ceros(tableau)
    for i=1:size(tableau,1)
        for j=1:size(tableau,2)
            if tableau(i,j) < 10e-10
               tab(i,j) = round(tableau(i,j));
            else
                tab(i,j) = tableau(i,j);
            end
        end
    end
end
