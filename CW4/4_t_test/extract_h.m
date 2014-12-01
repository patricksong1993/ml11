function h = extract_h(t_matrix)

h = zeros(6,3);

for i = 1:6
    for j = 1:3
        h(i,j) = t_matrix(i,j).h;
    end
end


end