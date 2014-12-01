function t_value = extract_t_value(t_matrix)

t_value = zeros(6,3);

for i = 1:6
    for j = 1:3
        t_value(i,j) = t_matrix(i,j).tstat;
    end
end


end