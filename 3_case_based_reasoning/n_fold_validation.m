function confusion_matrices = n_fold_validation(examples, targets)

n = 10;

confusion_matrices = cell(1,n);

for i = 1:n
    [train_set,test_set] = split_dataset(i,examples,targets);
    cbr = CBRinit(train_set.examples, train_set.targets);
    predictions = testCBR(cbr, test_set.examples);
    confusion_matrices{i} = calculate_confusion_matrix(test_set.targets,predictions);
end

end



