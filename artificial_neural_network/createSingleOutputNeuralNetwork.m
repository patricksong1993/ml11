function net = createSingleOutputNeuralNetwork(x, y, layers, neurons, trainFunc)


possible_targets = size(y, 1);
hidden_network = neurons*ones(1, layers);

net = cell(1, possible_targets);

for i = 1:possible_targets
    
    temp_net = feedforwardnet(hidden_network, trainFunc);
    %temp_net.trainParam.epochs = epochs;
    
    no_targets = size(y,2);
    
    temp_net.divideFcn = 'divideind';
    temp_net.divideParam.trainInd = 151:850;
    temp_net.divideParam.valInd   = 1:150;
    temp_net.divideParam.testInd  = 851:no_targets;
    
    temp_net = configure(temp_net, x, y(i,:));
    net{i} = train(temp_net, x, y(i,:));
end

end

