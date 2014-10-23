function[tree] = decesion_tree_learning(examples, attributes, binary_targets)
    
if(length(unique(binary_targets)) == 1)
    tree.class = binary_targets(1);
    tree.kids = [];
else if isempty(attributes)
        
    tree.class = majority_value(binary_targets);
    tree.k = [];
    else
        best_attribute = choose_best_decision_attribute(examples, attribute, binary_targets);
        tree.value = best_attribute;
        tree.child = cell(1, 2);
        
        for possible_value = 0:1
            %TODO
            reduce_examples
            if isempty(reduce_examples)
                tree.child = [];
                tree.class = majority_value(binary_targets);
            else
                %TODO
            end
        end
    end
end