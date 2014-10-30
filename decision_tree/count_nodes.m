function result = count_nodes(tree)

if(isempty(tree.op))
    result = 0;
else
    result = count_nodes(tree.kids{1}) + count_nodes(tree.kids{2}) + 1;
end

end