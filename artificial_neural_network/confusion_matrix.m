function matrix = confusion_matrix(actual,predicated)

matrix = zeros(6,6);

for i = 1:size(actual)
    matrix(actual(i),predicated(i)) = matrix(actual(i),predicated(i))+1;
end

end