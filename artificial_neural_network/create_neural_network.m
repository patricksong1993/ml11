function net = create_neural_network(x,y,layers,neurons,training_func,lr)

hidden_network = neurons*ones(1,layers);
net = feedforwardnet(hidden_network, training_func);
net = configure(net, x, y);

for i = 1:layers
    net.layers{i}.transferFcn = 'tansig';
end

net.trainParam.lr = lr;
% net.trainParam.goal = goal;
% net.trainParam.min_grad = grad;

% dividerand?
net.divideFcn = 'divideind';
% just train and val?
net.divideParam.trainInd = 1:800;
net.divideParam.valInd = 801:size(x,2);
net.divideParam.testInd = [];


net.trainParam.epochs = 10000;
net.trainParam.delt_inc = 1.2;

net.trainParam.delt_dec = 0.9;


net = train(net,x,y);

end
