function [traingd,traingda,traingdm,trainrp,trainscg,topology] = optimise(x,y)

traingd = optimise_traingd(x,y);
traingda = optimise_traingda(x,y);
traingdm = optimise_traingdm(x,y);
trainrp = optimise_trainrp(x,y);
trainscg = optimise_trainscg(x,y);
topology = optimise_topology(x,y);

end





