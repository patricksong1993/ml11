function rate = error_rate(matrices)
size_mat = size(matrices,2);

rate = zeros(6, size_mat);

for i = 1:size_mat
    temp = matrices{i};
    for j = 1:6
        TP = temp(j,j);
        FP = sum(temp(:,j)) - TP;
        FN = sum(temp(j,:)) - TP;
        TN = sum(sum(temp)) - TP - FP -FN;
        rate(j,i) = 1 - (TP+TN)/(TP+TN+FP+FN);
    end
end
end
