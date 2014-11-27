function predictions = testCBR(CBR, x2)
    
    no_x2 = size(x2,1);
    
    for i = 1:no_x2
        newcase = make_case(x2(i,:),0);
        closestcase = retrieve(CBR, newcase);
        solvedcase = reuse(closestcase, newcase, CBR);
        %retain the solved case or not?
        CBR = retain(CBR, solvedcase);
        %%%%%
        predictions(i,1) = solvedcase.class;
    end

end