function [score] = f_measure(alpha, precision, recall)

score = (1+alpha*alpha)*precision*recall/(alpha*alpha*(precision+recall));

end