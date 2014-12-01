function cbr = CBRinit(x,y)
    no_examples = size(x,1);
    count = 0;
    cbr = repmat(make_case([],[]), no_examples, 1);
    
    for i = 1:no_examples
        au = x(i,:);
        class = y(i);
        found = 0;
        
        if count > 0;
            for j = 1:count
                if all(cbr(j).au == au) && cbr(j).class == class
                    cbr(j) = inc_typicality(cbr(j));
                    found = 1;
                    break;
                end
            end
        end
        
        if found == 0
            count = count + 1;
            cbr(count) = make_case(au,class);
        end
    end
    cbr = cbr(1:count);
end
