% origin format expected as input.
function [net,confusion_matrices] = n_fold_validation(examples,targets,hidden_network,train_func,param1,param2,param3)

if nargin < 6
    param2 = 0;
    param3 = 0;
end

n = 10;

confusion_matrices = cell(1,n);
net = cell(1,n);

for i = 1:n
    
    % in nn format except test_set.targets are in origin format
    [train_set,test_set] = split_dataset(i,examples,targets);
    
    temp_net = create_neural_network(train_set.examples,train_set.targets,hidden_network,train_func,param1,param2,param3);
    
    predictions = testANN(temp_net, test_set.examples');
    
    confusion_matrices{i} = confusion_matrix(test_set.targets,predictions);
    net{i} = temp_net;
    
end

    