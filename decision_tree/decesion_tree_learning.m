function[tree] = decesion_tree_learning(examples, attributes, binary_targets)
    
if(length(unique(binary_targets)) == 1)
    %empty?
    tree.op = [];
    tree.kids = [];
    tree.class = binary_targets(1);
else if isempty(attributes)
    tree.op = [];
    tree.kids = [];
    tree.class = majority_value(binary_targets);
    else
        best_attribute = choose_best_decision_attribute(examples, attribute, binary_targets);
        tree.op = best_attribute;
        tree.kids = cell(1, 2);
        
        for possible_value = 0:1
            %row numbers with the best attribute equals to possible value.
            rows_of_best = find(examples(:,best) == possible_value);
            reduced_examples = examples(rows_of_best, :);
            if isempty(reduced_examples)
                tree.op = [];
                tree.kids = [];
                tree.class = majority_value(binary_targets);
            else
                reduced_targets = targets(rows_of_best);
                tree.kids{possible_value} = decision_tree_learning(reduced_examples, attributes(attributes ~= best), reduced_targets);
            end
        end
    end
end