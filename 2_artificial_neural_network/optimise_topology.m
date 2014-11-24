function [folds_cr,folds_cm] = optimise_topology(x,y)

folds_cr = cell(1,10);
folds_cm = cell(1,10);

for i = 1:10 
    folds_cr{i}.result = zeros(5,51);
    folds_cm{i}.result = cell(5,51);
end

for i = 1:1:50
        [cr,mat,~] = n_fold_validation(x,y,[i,i],'traingd',0.7);
        for k = 1:10
          folds_cr{k}.result(1,i) = cr{k};
          folds_cm{k}.result{1,i} = mat{k};
        end

        [cr,mat,~] = n_fold_validation(x,y,[i,i],'traingda',0.7,1.05,0.5);
        for k = 1:10
          folds_cr{k}.result(2,i) = cr{k};
          folds_cm{k}.result{2,i} = mat{k};
        end
        
        [cr,mat,~] = n_fold_validation(x,y,[i,i],'traingdm',0.7,0.9);
        for k = 1:10
          folds_cr{k}.result(3,i) = cr{k};
          folds_cm{k}.result{3,i} = mat{k};
        end
        
        [cr,mat,~] = n_fold_validation(x,y,[i,i],'trainrp',1.2,0.5);
        for k = 1:10
          folds_cr{k}.result(4,i) = cr{k};
          folds_cm{k}.result{4,i} = mat{k};
        end
        
        [cr,mat,~] = n_fold_validation(x,y,[i,i],'trainscg',0.7,2e-3,3e-6);
        for k = 1:10
          folds_cr{k}.result(5,i) = cr{k};
          folds_cm{k}.result{5,i} = mat{k};
        end  
end
end
