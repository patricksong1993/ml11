function result = optimise_topology(x,y)
result = zeros(5,51);

for i = 0:1:50
        [mat,~] = n_fold_validation(x,y,[i],'traingd',0.7);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(1,i+1) = cr;
        
        [mat,~] = n_fold_validation(x,y,[i],'traingda',0.7,1.05,0.5);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(2,i+1) = cr;
        
        [mat,~] = n_fold_validation(x,y,[i],'traingdm',0.7,0.9);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(3,i+1) = cr;
        
        [mat,~] = n_fold_validation(x,y,[i],'trainrp',1.2,0.5);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(4,i+1) = cr;
        
        [mat,~] = n_fold_validation(x,y,[i],'trainscg',0.7,2e-3,3e-6);
        mat = combine_confusion_matrix(mat);
        cr = classification_rate_over_confusion_matrix(mat);
        result(5,i+1) = cr;   
end
end
