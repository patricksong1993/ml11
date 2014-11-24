function [rate] = classification_rate(actual, predicted)

if(size(actual)==size(predicted))
    error = size(find(actual-predicted),1);
    rate = 1-error/size(actual,1);
end
  
end