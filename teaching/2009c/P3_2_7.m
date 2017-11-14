% Insight P3.2.7 Solution
% Author: Chin Isradisaikul
% CS1112-206/211/212 Fall 2009

clc;

%hard-code t_1
fprintf('t_1 = %f\n',sqrt(2));

%k=2..26
for k=2:26
    %running result
    result=1;
    for i=k:-1:2
        result=sqrt(result*i+1);
    end
    
    fprintf('t_%d = %f\n',k,result);
end
