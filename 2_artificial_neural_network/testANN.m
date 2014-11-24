function predictions = testANN(net,x2)

predictions = sim(net,x2');
predictions = NNout2labels(predictions);

end