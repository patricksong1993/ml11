function c = make_case(AU, class)
    if (length(AU)<45 || (length(AU)==45 && any(AU>1)==1))
        au = zeros(1,45);
        for i = 1:length(AU)
            au(AU(i))=1;
        end
        c = make_case_struct(au,class,1);
    else
        c = make_case_struct(AU,class,1);    
    end
end

function c = make_case_struct(au, class, typicality)
    c = struct();
    c.au = au;
    c.class = class;
    c.typicality = typicality;
end

    
