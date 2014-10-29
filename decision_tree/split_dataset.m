function [train_set, test_set] = split_dataset(i, examples, targets)

total = length(targets);
interval = total/10;

first_test_index = (i-1)*interval+1;
last_test_index = i*interval;

test_set.examples = examples(first_test_index:last_test_index, :);
test_set.targets = targets(first_test_index:last_test_index);

examples(first_test_index:last_test_index, :) = [];
targets(first_test_index:last_test_index) = [];

train_set.examples = examples;
train_set.targets = targets;

end