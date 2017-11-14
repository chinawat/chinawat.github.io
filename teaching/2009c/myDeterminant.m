% myDeterminant.m
% Author: Chin Isradisaikul
% CS1112 Fall 2009 Exercise 7 Problem 1
% Compute the determinant of the given 3x3 matrix x

function d=myDeterminant(x)
% Compute the determinant of the given 3x3 matrix x

% construct the three smaller matrices (called minors)
Minor11=[x(2,2) x(2,3); x(3,2) x(3,3)];
Minor12=[x(2,1) x(2,3); x(3,1) x(3,3)];
Minor13=[x(2,1) x(2,2); x(3,1) x(3,2)];

% calculate the determinant using the given formula
d=x(1,1)*det(Minor11)-x(1,2)*det(Minor12)+x(1,3)*det(Minor13);