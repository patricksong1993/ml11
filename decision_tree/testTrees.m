function predictions = testTrees(T,x2)

% Default strategy is maximum depth
strategy = 1;
predictions = evaluate(T,x2,strategy);

end