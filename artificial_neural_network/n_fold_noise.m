% origin format expected as input.
function [cr,confusion_matrices,net] = n_fold_noise(examples,targets,train_func,parameters)

n = 10;

confusion_matrices = cell(1,n);
net = cell(1,n);
cr = cell(1,n);

for i = 1:n
    
    % in nn format except test_set.targets are in origin format
    [train_set,test_set] = split_dataset(i,examples,targets);
    
    temp_net = create_neural_network(train_set.examples,train_set.targets,20,train_func{1,i},parameters(1,i),parameters(2,i),parameters(3,i));
    
    predictions = testANN(temp_net, test_set.examples');
    
    confusion_matrices{i} = confusion_matrix(test_set.targets,predictions);
    cr{i} = classification_rate_over_confusion_matrix(confusion_matrices{i});
    net{i} = temp_net;
    
end
end