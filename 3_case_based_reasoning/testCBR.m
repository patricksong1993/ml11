function predictions = testCBR(CBR, x2)
    
    no_x2 = size(x2,1);
    
    for i = 1:no_x2
        [closestcase, distance, index] = retrieve(CBR, x2(i,:));
        solvedcase = reuse(closestcase, x2(i,:));
        %retain the solved case or not?
        CBR = retain(CBR, solvedcase, distance, index);
        %%%%%
        predictions(i,1) = solvedcase.class;
    end

end