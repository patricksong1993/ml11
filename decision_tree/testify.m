function [dupli,row] = testify(examples,targets)

dupli = zeros(50,45);
row = zeros(50,1);
index2 = 1;
index = 1;
for i=1:1003
    ori = examples(i,:);
    for j=(i+1):1004
        if(sum(ori==examples(j,:))==45)
            if(targets(i)~=targets(j))
              dupli(index,:)=ori;
              row(index2,1) = i;
              index2 = index2+1;
              row(index2,1) = j;
              index2 = index2+1;
              index = index +1;
            end  
        end
    end
end
end
