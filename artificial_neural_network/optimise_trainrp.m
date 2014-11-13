function [folds_cr,folds_cm] = optimise_trainrp(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(21,1);
    folds_cm{i}.result = cell(21,1);
end

index_inc = 1;

for i = 1:0.025:1.5
    index_dec = 1;
    for j = 0.3:0.02:0.7
        [cr,mat,~] = n_fold_validation(x,y,[20],'trainrp',i,j);
        for k = 1:10
            folds_cr{k}.result(index_inc,index_dec) = cr{k};
            folds_cm{k}.result{index_inc,index_dec} = mat{k};
        end
    index_dec = index_dec + 1;
    end
    index_inc = index_inc + 1;
end
end

