function [folds_cr,folds_cm] = optimise_traingdm(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(9,1);
    folds_cm{i}.result = cell(9,1);
end

index_mc = 1;

for i = 0.8:0.025:1 
    [cr,mat,~] = n_fold_validation(x,y,[20],'traingdm',0.7,i);
    for k = 1:10
        folds_cr{k}.result(index_mc,1) = cr{k};
        folds_cm{k}.result{index_mc,1} = mat{k};
    end
    index_mc = index_mc + 1;
end
end

