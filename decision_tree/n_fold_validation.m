% Predicated results and confusion_matrix are both 10 cells.
function [predicted_results, confusion_matrices] = n_fold_validation(examples, targets, n)
if nargin < 3
    % Default folds
    n = 10;
end

predicted_results = cell(1,n);
confusion_matrices = cell(1,n);

for i = 1:10
    % Split dataset
    [train_set, test_set] = split_dataset(i, examples, targets);
    % Train desicion trees on train set datas
    trained_decision_trees = generate_all_trees(train_set.examples, train_set.targets);
    % Evaluate predicated targets on trained decision trees
    predicted_results{i} = testTrees(trained_decision_trees, test_set.examples);
    % Calculate confusion matrix upon actual and predicted targets
    confusion_matrices{i} = calculate_confusion_matrix(test_set.targets, predicted_results{i});
end

end