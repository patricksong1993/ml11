function distance = calculate_distance(a,b,method)

    if method == 1
        distance = calculate_distance_manhattan(a,b);
    elseif method == 2
        distance = calculate_distance_euclidean(a,b);
    elseif method == 3
        % to implement
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

