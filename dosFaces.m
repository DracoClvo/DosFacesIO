function dosFaces()
    tableau=input('tableau [maxz'';restricciones <=> valores]\n= ');
    var_in_izq = input('ubicacion yis lado izquierdo 0 si no yi \n= ');
    restric = input('coeficientes max z\n= ');
    restric = restric * -1;
    % primera fase
    fprintf('primera fase');
    tableau(1,:) = tableau(1,:) - sumatoria(var_in_izq,tableau)
    yn = cont(var_in_izq);
    var_in_izq = var_in_izq * -1;
    sol = true;
    while(min(var_in_izq)< 0 & sol)
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
        if(min(tableau(1,1:end-1)) >= 0 && tableau(1,end) ~=0)
            sol = false;
        end
    end
    var_in_izq
    if(sol)
        %segunda fase
        fprintf('segunda fase\n');
        tableau = [restric 0;tableau(2:end,1:end-yn-1) tableau(2:end,end)]

        while(0>min(tableau(1,1:end-1)))
            [valin,indin] = min(tableau(1,:));
            fprintf('entra X%d\n',indin);
            div = DivX(tableau(2:end,end),tableau(2:end,indin));
            [valout, indout] = min (div);
            indout = indout + 1;
            fprintf('sale X%d\n',var_in_izq(indout-1));
            var_in_izq(indout-1) = indin;
            tableau(indout,:)= tableau(indout,:) / tableau(indout,indin);
            f = indout;
            c = indin;
            for i=1:1:size(tableau,1)  %Hace el gauss
                if i~=f   %No realiza el gauss en la fila pivote
                    tableau(i,:)=tableau(i,:)-(tableau(i,c)*tableau(f,:)); %nueva_ecua = anterior_ecua - (coef_columna enterante) x (nueva_ecuac_pivote)
                end
            end
            tableau
        end
    else
        fprintf('este problema no tiene sulicion\n');
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
            if abs(tableau(i,j)) < 10e-10
               tab(i,j) = round(tableau(i,j));
            else
                tab(i,j) = tableau(i,j);
            end
        end
    end
end
function yn = cont(verin)
    yn=0;
    for i=1:size(verin,2)
        if(verin(i) == 1)
            yn = yn + 1;
        end
    end
end
