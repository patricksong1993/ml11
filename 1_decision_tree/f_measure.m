function score = f_measure(alpha, recall_precision_matrix)

score = zeros(6,1);
for i = 1:6
    recall = recall_precision_matrix(i,1);
    precision = recall_precision_matrix(i,2);
    score(i) = (1+alpha*alpha)*precision*recall/(alpha*alpha*(precision+recall));
end
end