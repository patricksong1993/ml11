function cbr = retain(cbr, solvedcase)
    no_cbr = size(cbr, 1);
    
    cbr(no_cbr + 1) = solvedcase;
    no_cbr = size(cbr, 1);
    
    %inc typicality
    for i = 1:no_cbr
         if all(cbr(i).au == solvedcase.au) && cbr(i).class == solvedcase.class
                    cbr(i) = inc_typicality(cbr(i));
        end
    end
end