function result = optimise_trainrp(x,y)
result = zeros(21);

index_inc = 1;

for i = 1:0.025:1.5
    index_dec = 1;
    for j = 0.3:0.02:0.7
        [mat,~] = n_fold_validation(x,y,[20],'trainrp',i,j);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(index_inc,index_dec) = cr;
        index_dec = index_dec + 1;
    end
    index_inc = index_inc + 1;
end
end

