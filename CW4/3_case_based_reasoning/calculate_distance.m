function distance = calculate_distance(a,b,method)

    if nargin < 3
        method = 4;
    end
    
    
    if method == 1
        distance = calculate_distance_manhattan(a,b);
    elseif method == 2
        distance = calculate_distance_euclidean(a,b);
    elseif method == 3
        distance = calculate_distance_chebyshev(a,b);
    elseif method == 4
        distance = calculate_distance_jaccard(a,b);
    else
        distance = 0;
    end
end

function distance = calculate_distance_manhattan(a,b)
    distance = sum(abs(a-b));
end

function distance = calculate_distance_euclidean(a,b)
    distance = sum((a-b)*(a-b)');
    distance = sqrt(distance);
end

function distance = calculate_distance_chebyshev(a,b)
    distance = abs(a-b);
    distance = max(distance);
end

function distance = calculate_distance_jaccard(a,b)
    count1 = 1;
    count2 = 1;
    ai = zeros(45);
    bi = zeros(45);
    for i = 1:45
        if(a(i)==1)
            ai(count1)=i;
            count1 = count1+1;
        end
    end
    for j = 1:45
        if(b(j)==1)
            bi(count2)=j;
            count2 = count2+1;
        end
    end
    
    intersection = length(intersect(ai, bi))-1 ;
    union1 = length(union(ai, bi))-1 ;
    distance = 1-(intersection / union1);
end