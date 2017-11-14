% Insight P3.1.7 Solution
% Author: Chin Isradisaikul
% CS1112-206/211/212 Fall 2009

clc;

n=input('Enter n: ');

%To avoid confusion, variable i always refers to row number;
% variable j always refers to column number

%first row
for j=1:n
    fprintf('*');
end
%don't forget to go to a new line when we're done with a line
fprintf('\n');

%2nd to (n-1)st rows
for i=2:n-1
    %always print the first column
    fprintf('*');
    
    for j=2:n-1
        if i==j %diagonal
            fprintf('*');
        else
            fprintf(' ');
        end
    end
    
    %always print the last column
    fprintf('*');
    
    %done with the line
    fprintf('\n');
end

%last row
for j=1:n
    fprintf('*');
end
%be considerate to next activity in Command Window
fprintf('\n');
