function net = create_neural_network(x,y,hidden_network,train_func,param1,param2,param3)

if nargin < 6
    param2 = 0;
    param3 = 0;
end


layers = size(hidden_network,2);
net = feedforwardnet(hidden_network, train_func);
net = configure(net, x, y);
for i = 1:layers
    net.layers{i}.transferFcn = 'tansig';
end
net.divideFcn = 'divideblock';
net.divideParam.trainRatio = 0.8;
net.divideParam.valRatio = 0.2;
net.divideParam.testRatio = 0;
net.trainParam.epochs = 10000;

if strcmp(train_func,'traingd')
    lr = param1;
    net.trainParam.lr = lr;
elseif strcmp(train_func,'trainscg')
    lr = param1;
    goal = param2;
    grad = param3;
    net.trainParam.lr = lr;
    net.trainParam.goal = goal;
    net.trainParam.min_grad = grad;
elseif strcmp(train_func,'traingda')
    lr = param1;
    lr_inc = param2;
    lr_dec = param3;
    net.trainParam.lr = lr;
    net.trainParam.lr_inc = lr_inc;
    net.trainParam.lr_dec = lr_dec;
end



net = train(net,x,y);

end
