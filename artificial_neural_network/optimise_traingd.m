function result = optimise_traingd(x,y)
result = zeros(21,8);

index_lr = 1;

for i = 0.6:0.1:0.6 
    index_neurons = 1;
    for j = 20:1:25
    [mat,~] = n_fold_validation(x,y,[j],'traingd',i);
    mat = combine_confusion_matrix(mat);
    cr = classification_rate_over_confusion_matrix(mat);
    result(index_lr,index_neurons) = cr;
    index_neurons = index_neurons+1;
    end
    index_lr = index_lr + 1;
end
end

