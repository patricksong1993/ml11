function result = optimise_traingda(x,y)
result = zeros(11,9);

index_inc = 1;

for i = 1:0.02:1.2
    index_dec = 1;
    for j = 0.4:0.05:0.8
        [mat,~] = n_fold_validation(x,y,[20],'traingda',0.7,i,j);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(index_inc,index_dec) = cr;
        index_dec = index_dec + 1;
    end
    index_inc = index_inc + 1;
end
end

