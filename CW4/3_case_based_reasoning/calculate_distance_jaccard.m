function distance = calculate_distance_jaccard(a,b)
    count1 = 1;
    count2 = 1;
    ai = zeros(45);
    bi = zeros(45);
    for i = 1:4
        if(a(i)==1)
            ai(count1)=i;
            count1 = count1+1;
        end
    end
    for j = 1:4
        if(b(j)==1)
            bi(count2)=j;
            count2 = count2+1;
        end
    end
    
    intersection = length(intersect(ai, bi)) ;
    union1 = length(union(ai, bi));
    distance = 1-(intersection / union1);
end