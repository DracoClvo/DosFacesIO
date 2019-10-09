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