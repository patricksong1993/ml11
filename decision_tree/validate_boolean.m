function [boolean, depth] = validate_boolean(all_trees, test_examples)

    boolean= nan(size(test_examples, 1), size(all_trees, 1));
    depth = nan(size(test_examples, 1), size(all_trees, 1));
    
    for tree_i = 1: size(all_trees, 1)
        tree = all_trees(tree_i);
        [boolean(:,tree_i), depth(:,tree_i)]=validate_boolean_single(tree,test_examples);
    end
    
end

function [boolean, depth] = validate_boolean_single(tree, test_examples)

    boolean = nan(size(test_examples, 1), 1);
    depth = nan(size(test_examples, 1), 1);
    for i = 1:size(test_examples, 1)
       [boolean(i), depth(i)] = classify_boolean_single_input(tree, test_examples(i, :), 0);
    end

end

function [result, depth] = classify_boolean_single_input(tree, test_example, depth)
    if is_leaf(tree)
        result = tree.class;
    else
        depth = depth + 1;
        [result, depth] = classify_boolean_single_input(tree.kids{test_example(1, tree.op)+1},test_example , depth);
    end
end

function result = is_leaf(node)
result = isempty(node.op);
end
