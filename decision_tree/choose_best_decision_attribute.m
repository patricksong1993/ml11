function[best_attribute] = choose_best_decision_attribute(examples, attributes, binary_targets)

positive = length(binary_targets(binary_targets == 1));
negative = length(binary_targets(binary_targets == 0));
original_gain = calculate_entropy(positive, negative);
current_max_gain = 0;
index = 1;

for i = 1:length(attributes)
    remainder = calculate_remainder(positive, negative, i, examples, attributes, binary_targets);
    attribute_gain = original_gain - remainder;
    if(attribute_gain > current_max_gain)
        current_max_gain = attribute_gain;
        index = i;
    end
end

best_attribute = attributes(index);

end


function[entropy] = calculate_entropy(positive, negative)

total = positive + negative;
positive_factor = positive / total;
negative_factor = negative / total;

%abs??
entropy = - positive_factor * log2(positive_factor) - negative_factor * log2(negative_factor);

end


function[remainder] = calculate_remainder(positive, negative, index, examples, attributes, binary_targets)

remainder = 0;

for possible_value = 0:1
    %index is not equal to number stored in attributes at index.
    rows_on_index = find(examples(:, attributes(index)) == possible_value);
    reduced_targets = binary_targets(rows_on_index);
    
    positive_new = length(reduced_targets(reduced_targets == 1));
    negative_new = length(reduced_targets(reduced_targets == 0));
    remainder = remainder + (positive_new + negative_new) * calculate_remainder(positive_new, negative_new);
end

remainder = remainder / (positive + negative);

end