function combined_predicted = combine_predicted_results(predicted_results)
index = 1;
combined_predicted = zeros(1004,1);
for i = 1:size(predicted_results,2)
    combined_predicted(index:index+length(predicted_results{i})-1) = predicted_results{i};
    index = index+length(predicted_results{i});
end

end