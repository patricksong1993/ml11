function result = optimise_traingdm(x,y)
result = zeros(11,10);

index_mc = 1;

for i = 0.8:0.05:1 
    [mat,~] = n_fold_validation(x,y,[20],'traingdm',0.6,i);
    mat = combine_confusion_matrix(mat);
    cr = classification_rate_over_confusion_matrix(mat);
    result(index_mc,1) = cr;
    index_mc = index_mc + 1;
end
end

