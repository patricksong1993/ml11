function [folds_cr,folds_cm] = optimise_traingda(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(11,9);
    folds_cm{i}.result = cell(11,9);
end

index_inc = 1;

for i = 1:0.02:1.2
    index_dec = 1;
    for j = 0.4:0.05:0.8
        [cr,mat,~] = n_fold_validation(x,y,[20],'traingda',0.7,i,j);
        for k = 1:10
          folds_cr{k}.result(index_inc,index_dec) = cr{j};
          folds_cm{k}.result{index_inc,index_dec} = mat{j};
        end
        index_dec = index_dec + 1;
    end
    index_inc = index_inc + 1;
end
end

