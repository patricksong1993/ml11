function result = optimise_trainscg(x,y)
result = zeros(11,10);

index_goal = 1;

for i = 0:0.001:0.01
    index_grad = 1;
    for j = 1e-6:1e-6:1e-5
        [mat,~] = n_fold_validation(x,y,[20],'trainscg',0.6,i,j);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(index_goal,index_grad) = cr;
        index_grad = index_grad + 1;
    end
    index_goal = index_goal + 1;
end
end

