% origin format expected as input.
function [train_set, test_set] = split_dataset(i, examples, targets)

total = length(targets);
interval = total/10;

first_test_index = round((i-1)*interval+1);
last_test_index = round(i*interval);

test_set.examples = examples(first_test_index:last_test_index, :);
test_set.targets = targets(first_test_index:last_test_index);

[test_set.examples,~] = ANNdata(test_set.examples,test_set.targets);

examples(first_test_index:last_test_index, :) = [];
targets(first_test_index:last_test_index) = [];

train_set.examples = examples;
train_set.targets = targets;

[train_set.examples,train_set.targets] = ANNdata(train_set.examples,train_set.targets);

end