function newcase = reuse(cases,newcase,cbr)
    
    if(size(cases,1) == 1)
        newcase.class = cases(1).class;
        return;
    end
    
    no_class = 6;
    size_cases = size(cases,1);
    
    
    % distance weighted voting
    scores = zeros(1, no_class);
    distance = zeros(1, size_cases);
    
    for i = 1:size_cases
        distance(i) = 1/calculate_distance(cases(i).au, newcase.au);
        scores(cases(i).class) = scores(cases(i).class) + distance(i);
    end
    
    [max_score1, max_index1] = max(scores);
    scores(max_index1) = [];
    max_score2 = max(scores);
    
    if(max_score1 ~= max_score2)
        newcase.class = max_index1;
        return;
    end
    
    % typicality
    scores = zeros(1, no_class);
    for i = 1:size_cases
        distance(i) = distance(i) * cases(i).typicality;
        scores(cases(i).class) = scores(cases(i).class) + distance(i);
    end
    
    [max_score1, max_index1] = max(scores);
    scores(max_index1) = [];
    max_score2 = max(scores);
    
    if(max_score1 ~= max_score2)
        newcase.class = max_index1;
        return;
    end
    
    % trim
    newcase = reuse(cases(1:size_cases-1),newcase,cbr);
    
        
    

end