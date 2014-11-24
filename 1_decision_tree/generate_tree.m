function tree = generate_tree(examples, targets, emotion)

binary_targets = map_emotion(targets, emotion);
attributes = 1:size(examples, 2);
tree = decision_tree_learning(examples, attributes, binary_targets);

end