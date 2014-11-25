function casE = retrieve(cbr, newcase, retrieve_method) % 'case' name taken

    if nargin < 3
        retrieve_method = 1;
    end
    
    %choose similarity method
    sim_method = 1;
    no_cbr = size(cbr,1);
    
    closest_distance = 1.0e+20;
    
    %exhaustive search
    if retrieve_method == 1
        for i = 1:no_cbr
            current_distance = calculate_distance(newcase, cbr(i).au, sim_method);
            if current_distance < closest_distance
                closest_case = cbr(i).au;
                closest_distance = current_distance;
            end
        end
    end
    
    
    casE = closest_case;


end