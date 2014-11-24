function result = findbest_single_function(cr)

result = zeros(1,10);

for i = 1:10
    result(1,i) = max(max(cr{i}.result));
end

end
