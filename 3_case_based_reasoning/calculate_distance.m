function distance = calculate_distance(a,b,method)

    if nargin < 3
        method = 1;
    end
    
    
    if method == 1
        distance = calculate_distance_manhattan(a,b);
    elseif method == 2
        distance = calculate_distance_euclidean(a,b);
    elseif method == 3
        distance = calculate_distance_chebyshev(a,b);
    else
        distance = 0;
    end
end

function distance = calculate_distance_manhattan(a,b)
    distance = sum(abs(a-b));
end

function distance = calculate_distance_euclidean(a,b)
    distance = sum(abs(a-b));
    distance = sqrt(distance);
end

function distance = calculate_distance_chebyshev(a,b)
    distance = abs(a-b);
    distance = max(distance);
end

