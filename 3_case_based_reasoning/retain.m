function cbr = retain(cbr, newcase)

    for i = 1:size(cbr,1)
        if (all(cbr(i).au == newcase.au) && cbr(i).class == newcase.class)
            inc_typicality(cbr(i));
            return;
        end
    end
    
    cbr(size(cbr,1)+1) = newcase;
    
end