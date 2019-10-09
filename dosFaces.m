function dosFaces()
    tableau=input('tableau [maxz'';restricciones <=> valores]\n= ');
    variables_basicas = input('variables en la base (x1... xn)\n(artificiales = -1)\n= ');
    z_original = input('coeficientes max z\n= ');
    z_original = z_original * -1;
    % primera fase
    fprintf('primera fase');
    tableau(1,:) = tableau(1,:) - sumatoria(variables_basicas,tableau)
    yn = cont(variables_basicas);
    %variables_basicas = variables_basicas * -1;
    sol = true;
    while(min(variables_basicas)< 0 & sol)
        [valin,entra]=min(tableau(1,1:end-1));
        [valout,sale]=min(DivX(tableau(2:end,end),tableau(2:end,entra)));
        if variables_basicas(sale) < 0
            fprintf('entra X%d sale X%d(%d)\n',entra, sale,variables_basicas(sale));
        else
            fprintf('entra X%d sale X%d\n',entra,variables_basicas(sale));
        end
        variables_basicas(sale) = entra;
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
    variables_basicas
    if(sol)
        %segunda fase
        fprintf('segunda fase\n');
        tableau = [z_original 0;tableau(2:end,1:end-yn-1) tableau(2:end,end)]

        while(0>min(tableau(1,1:end-1)))
            [valin,indin] = min(tableau(1,:));
            fprintf('entra X%d\n',indin);
            div = DivX(tableau(2:end,end),tableau(2:end,indin));
            [valout, indout] = min (div);
            indout = indout + 1;
            fprintf('sale X%d\n',variables_basicas(indout-1));
            variables_basicas(indout-1) = indin;
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

