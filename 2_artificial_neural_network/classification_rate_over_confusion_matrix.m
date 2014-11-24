function rate = classification_rate_over_confusion_matrix(matrix)

total = 0;
correct = 0;

for i = 1:6
    for j = 1:6
        total = total + matrix(i,j);
    end
end

for i = 1:6
    correct = correct + matrix(i,i);
end

rate = correct/total;

end


