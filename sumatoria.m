function suma = sumatoria(variz,tabl)
    suma = zeros(1,size(tabl,2));
    for i=1:size(variz,2)
        if(variz(i) == -1)
            suma = suma + tabl(i+1,:);
        end
    end
end