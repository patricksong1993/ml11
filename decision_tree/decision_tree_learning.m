function tree = decision_tree_learning(examples, attributes, binary_targets)

% All binary_targets are equal
if (length(unique(binary_targets)) == 1)
    tree = make_node('',binary_targets(1));

% No more attributes to expand
elseif (sum(attributes) == 0)
    tree = make_node('',majority_value(binary_targets));

% Normal case
else
    best_attribute = choose_best_decision_attribute(examples, attributes, binary_targets);
    tree = make_node(best_attribute, '');
    for possible_value = 0:1
        %row numbers with the best attribute equals to possible value
        rows_on_best = find(examples(:,best_attribute) == possible_value);
        reduced_examples = examples(rows_on_best, :);
        if (isempty(reduced_examples))
            tree.kids{possible_value + 1} = make_node('', majority_value(binary_targets));
        else
            reduced_targets = binary_targets(rows_on_best);
            attributes(best_attribute) = 0;
            tree.kids{possible_value + 1} = decision_tree_learning(reduced_examples, attributes, reduced_targets);
        end
    end
end
end

function node = make_node(op, class)
    node = struct();
    node.op = op;
    node.kids = {};
    node.class = class;
end


