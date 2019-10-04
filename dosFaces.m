function dosFaces()
tableau=input('tableau [maxz;restricciones <=> valores]\n= ');
var_in_izq = input('ubicacion yis lado izquierdo 0 si no yi \n= ');
% primera fase
RO = tableau(1,:)
RO = RO - sumatoria(var_in_izq,tableau)
end
function suma = sumatoria(variz,tabl)
    suma = zeros(1,size(tabl,2))
    for i=1:size(variz,2)
        if(variz(i) == 1)
            suma = suma + tabl(i+1,:);
        end
    end
end
