function cbr = retain(cbr, solvedcase, distance, closestcase_index)
    no_cbr = size(cbr, 1);
    
    if distance > 0      
        cbr(no_cbr + 1) = solvedcase;
    elseif distance == 0
            inc_typicality(cbr(closestcase_index));        
    end
end