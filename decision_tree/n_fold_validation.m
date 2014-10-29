function [results, con_matrix] = n_fold_validation(examples, targets)
%folds number
n = 10;

%con_matrix2 = cell(1, 10);
con_matrix = zeros(6,6);
total = length(targets);
interval = floor(total/10);

for i = 1:10
    
    [train_set, test_set] = split_dataset(i, examples, targets);
    
    trained_decision_trees = generate_all_trees(train_set.examples, train_set.targets);
    
    %
    predicated = testTrees(trained_decision_trees, test_set.examples);
    
    test_results((i-1)*interval+1:i*interval,:) = predicated;
    
    %confusion matrix meixie!
    con_matrix = con_matrix+confusion_matrix(test_set.targets, predicated);
    
end


results = test_results;

end