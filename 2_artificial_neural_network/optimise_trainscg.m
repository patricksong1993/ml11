function [folds_cr,folds_cm] = optimise_trainscg(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(11,11);
    folds_cm{i}.result = cell(11,11);
end

index_goal = 1;

for i = 0:0.001:0.01
    index_grad = 1;
    for j = 0:1e-6:1e-5
        [cr,mat,~] = n_fold_validation(x,y,[20],'trainscg',0.7,i,j);
        for k = 1:10
          folds_cr{k}.result(index_goal,index_grad) = cr{k};
          folds_cm{k}.result{index_goal,index_grad} = mat{k};
        end
        index_grad = index_grad + 1;
    end
    index_goal = index_goal + 1;
end
end

