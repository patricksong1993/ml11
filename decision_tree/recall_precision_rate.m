function result = recall_precision_rate(actual, predicted)
result = zeros(6,2);
confusion_matrix = calculate_confusion_matrix(actual, predicted);

for i = 1:6
    tp = confusion_matrix(i, i);
    fn = sum(confusion_matrix(i, :)) - tp;
    fp = sum(confusion_matrix(:, i)) - tp;
    
    result(i, 1) = tp/(tp + fn);
    result(i, 2) = tp/(tp + fp);
end
en