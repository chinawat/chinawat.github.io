% findInMatrix.m
% Author: Chin Isradisaikul
% CS1112 Fall 2009 Exercise 7 Problem 2
% Find the locations of a given number in a given matrix

function [r,c]=findInMatrix(n,M)
% Find all occurrences of the number n in matrix M.
% r and c are column vectors of row and column numbers such that
%  M(r(k),c(k)) is equal to n.
% If n is not found in M, r and c are empty vectors.

% initialize return values
r=[];
c=[];

% determine the dimension of M
[nr,nc]=size(M);

% go through each element in M
for row=1:nr
    for col=1:nc
        % determine whether this element is n
        if M(row,col)==n
            % if so, update r and c
            r=[r; row];
            c=[c; col];
        end
    end
end
