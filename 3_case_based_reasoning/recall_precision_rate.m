function result = recall_precision_rate(confusion_matrix)

for i = 1:6
    tp = confusion_matrix(i, i);
    fn = sum(confusion_matrix(i, :)) - tp;
    fp = sum(confusion_matrix(:, i)) - tp;
    
    result(i, 1) = tp/(tp + fn);
    result(i, 2) = tp/(tp + fp);
end
end
