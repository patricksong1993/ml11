function predictions = evaluate(all_trees, test_examples, strategy)
predictions = zeros(size(test_examples,1),1);
% Generate binary predications first on all six trees
[boolean, depth] = evaluate_boolean(all_trees, test_examples);
% Select best prediction based on different strategy
for i = 1:size(boolean, 1)
    predictions(i) = use_strategy(boolean(i,:),depth(i,:),strategy, all_trees);
end

end

function result = use_strategy(boolean, depth, strategy, all_trees)
total = sum(boolean);
% If only one boolean prediction is zero, return that tree index
if total == 1
    [result] = find(boolean, 1);
else
switch strategy
    case 1
        % Maximum Depth
        [~, result] = max(depth);
        
    case 2
        % Minimum Depth
        [~, result] = min(depth);
    case 3
        % Randomized
        if total == 0
            result = randi(6);
        else
            indexes = find(boolean);
            random = randi(length(indexes));
            result = indexes(random);
        end
    case 4
        % Last Come, First Serve
        if total == 0
            result = randi(6);
        else
            indexes = find(boolean);
            result = indexes(length(indexes));
        end
    case 5
        % f1 measure rank
        if total == 0
            result = randi(6);
        else            
            if boolean(4) == 1
                result = 4;
            elseif boolean(6) == 1
                result = 6;
            elseif boolean(2) == 1
                result = 2;
            elseif boolean(3) == 1
                result = 3;
            elseif boolean(5) == 1
                result = 5;
            elseif boolean(1) == 1
                result = 1;
            end
        end
    case 6
        % rank2
        if total == 0
            result = randi(6);
        else            
            if boolean(1) == 1
                result = 1;
            elseif boolean(5) == 1
                result = 5;
            elseif boolean(3) == 1
                result = 3;
            elseif boolean(2) == 1
                result = 2;
            elseif boolean(6) == 1
                result = 6;
            elseif boolean(4) == 1
                result = 4;
            end
        end
    case 7
        % bestmax depth with randi
        max_depth = max(depth);
        for i = 1:6
            if depth(i) ~= max_depth;
                depth(i) = 0;
            end
        end
        index_with_max_depth = find(depth);
        
        nodes = zeros(length(index_with_max_depth),1);
        
        for j = 1:length(index_with_max_depth)
            nodes(j) = count_nodes(all_trees(index_with_max_depth(j)));
        end
        choose_one = max(nodes);
        
        for k=1:length(index_with_max_depth)
            if nodes(k) == choose_one
                result = index_with_max_depth(k);
            end
        end
        
                
end
end       
end

function [boolean, depth] = evaluate_boolean(all_trees, test_examples)

    boolean= zeros(size(test_examples, 1), size(all_trees, 1));
    depth = zeros(size(test_examples, 1), size(all_trees, 1));
    
    for tree_i = 1: size(all_trees, 1)
        tree = all_trees(tree_i);
        [boolean(:,tree_i), depth(:,tree_i)]=evaluate_boolean_single(tree,test_examples);
    end
    
end

function [boolean, depth] = evaluate_boolean_single(tree, test_examples)

    boolean = nan(size(test_examples, 1), 1);
    depth = nan(size(test_examples, 1), 1);
    for i = 1:size(test_examples, 1)
       [boolean(i), depth(i)] = classify_boolean_single_input(tree, test_examples(i, :), 0);
    end

end

function [result, depth] = classify_boolean_single_input(tree, test_example, depth)
    % Judge whether it is a node or not
    if isempty(tree.op)
        result = tree.class;
    else
        depth = depth + 1;
        [result, depth] = classify_boolean_single_input(tree.kids{test_example(1, tree.op)+1},test_example , depth);
    end
end

