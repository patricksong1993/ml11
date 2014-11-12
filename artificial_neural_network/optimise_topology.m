function result = optimise_topology(x,y)
result = zeros(11);

index_neurons = 1;

for i = 15:1:25
        [mat,~] = n_fold_validation(x,y,[i],'traingd',0.6);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(index_neurons) = cr;
    index_neurons = index_neurons + 1;
end
end
