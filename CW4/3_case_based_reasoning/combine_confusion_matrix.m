function combined_matrix = combine_confusion_matrix(confusion_matrices)

combined_matrix = zeros(6,6);

for i = 1:size(confusion_matrices,2)
    combined_matrix = combined_matrix + confusion_matrices{i};
end

end