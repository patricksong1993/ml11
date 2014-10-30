function predictions = testTrees(T,x2)

% Default strategy is maximum depth with maximum nodes
strategy = 7;
predictions = evaluate(T,x2,strategy);

end