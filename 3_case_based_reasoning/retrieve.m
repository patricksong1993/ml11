function [casE, distances] = retrieve(cbr, newcase) % 'case' name taken
    
    k = 5;
    
    distances = zeros(size(cbr, 1),2);
    % igs
    for i = 1:size(cbr,1)
        distances(i, 1) = i;
        distances(i, 2) = calculate_distance(cbr(i).au, newcase.au);
    end
    
    distances = sortrows(distances, 2);
    
    casE = repmat(make_case([],[]), k, 1);
    
    for i = 1:k
        casE(i) = cbr(distances(i,1));
    end
    
    while(distances(k,2) == distances(k+1,2))
        k = k+1;
        casE(k) = cbr(distances(k,1));
    end
    
    distances = distances(1:k,2);
    
    
    


%     if nargin < 3
%         retrieve_method = 1;
%     end
%     
%     %choose similarity method
%     sim_method = 1;
%     no_cbr = size(cbr,1);
%     
%     closest_distance = 1.0e+20;
%     
%     %exhaustive search
%     if retrieve_method == 1
%         for i = 1:no_cbr
%             current_distance = calculate_distance(newcase, cbr(i).au, sim_method);
%             if current_distance < closest_distance
%                 closest_case = cbr(i);
%                 closest_distance = current_distance;
%                 index = i;
%             end
%         end
%     end
%     
%     
%     casE = closest_case;
%     distance = closest_distance;


end