function yn = cont(verin)
    yn=0;
    for i=1:size(verin,2)
        if(verin(i) == -1)
            yn = yn + 1;
        end
    end
end