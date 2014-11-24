function predictions = testTrees(T,x2)

% Default strategy is maximum depth.
strategy = 3;
predictions = evaluate(T,x2,strategy);

end