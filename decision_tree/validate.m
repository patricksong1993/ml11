function predictions = validate(all_trees, test_examples, strategy)

predictions = nan(size(test_examples,1),1);
[boolean, depth] = validate_boolean(all_trees, test_examples);

for i = 1:size(boolean, 1)
    predictions(i) = use_strategy(boolean(i,:),depth(i,:),strategy);
end

end

function result = use_strategy(boolean, depth, strategy)

total = sum(boolean);

switch strategy
    case 1
        if total ~= 1
            [~, result] = max(depth);
        else
            [result] = find(boolean,1);
        end
end

       
end


