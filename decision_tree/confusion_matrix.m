function results = confusion_matrix(actual, predicated)
results = zeros(6,6);
for i = 1:size(actual,1)
    results(actual(i),predicated(i)) = results(actual(i),predicated(i))+1;
end
end