function [folds_cr,folds_cm] = optimise_traingd(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(41,1);
    folds_cm{i}.result = cell(1,41);
end

index_lr = 1;

for i = 0:0.025:1

    [cr,mat,~] = n_fold_validation(x,y,[20],'traingd',i);
    
    for j = 1:10
        folds_cr{j}.result(index_lr,1) = cr{j};
        folds_cm{j}.result{index_lr} = mat{j};
    end
    index_lr = index_lr + 1;
    
end
end

