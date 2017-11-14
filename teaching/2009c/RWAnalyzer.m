% RWAnalyzer.m
% Author: Chin Isradisaikul
% CS1112 Fall 2009 Exercise 7 Problem 2
% Find the most visited square in a random walk on a 21x21 grid

% set the dimension of the walk
N=10;

% initialize frequency matrix
freq=zeros(2*N+1,2*N+1);

% get random walk information
[x,y]=RandomWalk2D(N);
len=length(x);

% initialize max information
maxFreq=-1;
maxX=-1;
maxY=-1;

% determine square with max frequency
for locNo=1:len
    % adjust indices so that they won't be out of bound for freq
    yInd=y(locNo)+N+1;
    xInd=x(locNo)+N+1;
    
    % update freq
    freq(yInd,xInd)=freq(yInd,xInd)+1;
    
    % determine whether this square is visited more than
    % the one we know so far
    if freq(yInd,xInd)>maxFreq
        % if so, update the max information
        maxFreq=freq(yInd,xInd);
        maxX=x(locNo);
        maxY=y(locNo);
    end
end

% display sqaure with max frequency
fprintf('The most visited square is (%d,%d)\n',maxX,maxY);
