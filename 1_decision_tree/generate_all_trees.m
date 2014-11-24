function tree = generate_all_trees(examples, targets)

tree = repmat(make_node('',''), 6, 1);
for i = 1:6
    tree(i) = generate_tree(examples, targets, i);
end

end


function node = make_node(op, class)
    node = struct();
    node.op = op;
    node.kids = {};
    node.class = class;
end