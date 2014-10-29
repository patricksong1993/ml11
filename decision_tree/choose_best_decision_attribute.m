function [best_attribute] = choose_best_decision_attribute(examples, attributes, binary_targets)

total = length(binary_targets);
positive = length(binary_targets(binary_targets == 1));
negative = total - positive;

original_entropy = calculate_entropy(positive, negative);

gains = zeros(1, length(attributes));

%number on index is not equal to index
for i = 1:length(attributes)
        
        %
        value_on_i = attributes(i);
        positive_zero = 0;
        positive_one = 0;
        negative_zero = 0;
        negative_one = 0;
        
        for j = 1:length(binary_targets)
            if(examples(j,value_on_i) == 0 && binary_targets(j) == 1)
                positive_zero = positive_zero + 1;
            end 
            if(examples(j,value_on_i) == 1 && binary_targets(j) == 1)
                positive_one = positive_one + 1;
            end
            if(examples(j,value_on_i) == 0 && binary_targets(j) == 0)
                negative_zero = negative_zero + 1;
            end
            if(examples(j,value_on_i) == 1 && binary_targets(j) == 0)
                negative_one = negative_one + 1;
            end
        end
        
        gains(i) = calculate_gain(original_entropy, total, positive_zero, positive_one, negative_zero, negative_one);
%    end
end

[~,index] = max(gains);
best_attribute = attributes(index);
end


function [entropy] = calculate_entropy(positive, negative)

if(positive > 0 && negative > 0)
    total = positive + negative;
    positive_factor = positive / total;
    negative_factor = negative / total;
    entropy = - positive_factor * log2(positive_factor) - negative_factor * log2(negative_factor);
else
    entropy = 0;
end

end


function [gain] = calculate_gain(original_entropy, total, positive_zero, positive_one, negative_zero, negative_one)
    remainder = calculate_remainder(total, positive_zero, positive_one, negative_zero, negative_one);
    gain = original_entropy - remainder;
end


function [remainder] = calculate_remainder(total, positive_zero, positive_one, negative_zero, negative_one)

zero = (positive_zero + negative_zero) / total;
one  = (positive_one + negative_one) /total;
remainder = zero * (calculate_entropy(positive_zero, negative_zero)) + one * (calculate_entropy(positive_one, negative_one));

end