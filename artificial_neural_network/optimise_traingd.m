function result = optimise_traingd(x,y)
result = zeros(41,1);

index_lr = 1;

for i = 0:0.025:1 

    [mat,~] = n_fold_validation(x,y,[20],'traingd',i);
    mat = combine_confusion_matrix(mat);
    cr = classification_rate_over_confusion_matrix(mat);
    result(index_lr,1) = cr;
   
    index_lr = index_lr + 1;
end
end

