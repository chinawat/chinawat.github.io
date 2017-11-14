% TestVectorQuery.m
% Author: Chin Isradisaikul
% CS1112 Fall 2009 Lab 6
% Test driver for vectorQuery function

function TestVectorQuery()
% Test driver for vectorQuery function

clc;

n=20;
v=zeros(1,n);

% set 1: ascending values
% initialization
for i=1:n
    v(i)=i;
end

verifyVectorQuery(v,1,1,1);
verifyVectorQuery(v,length(v),1,1);
verifyVectorQuery(v,length(v),10,1);
verifyVectorQuery(v,length(v),108,0);
verifyVectorQuery(v,length(v),-5,0);
verifyVectorQuery(v,20,11,1);
verifyVectorQuery(v,10,11,0);
verifyVectorQuery(v,25,11,1);
verifyVectorQuery(v,21,20,1);
verifyVectorQuery(v,19,20,0);
verifyVectorQuery(v,20,20,1);
verifyVectorQuery(v,1,0,0);
verifyVectorQuery(v,0,0,0);
verifyVectorQuery(v,-1,0,0);


% set 2: descending values
% initialization
for i=1:n
    v(i)=n-i;
end

verifyVectorQuery(v,1,1,0);
verifyVectorQuery(v,length(v),1,1);
verifyVectorQuery(v,length(v),10,1);
verifyVectorQuery(v,length(v),108,0);
verifyVectorQuery(v,length(v),-5,0);
verifyVectorQuery(v,20,11,1);
verifyVectorQuery(v,10,11,1);
verifyVectorQuery(v,10,10,1);
verifyVectorQuery(v,25,11,1);

% set 3: random values
% initialization
for i=1:n
    v(i)=floor(rand()*n)+1;
end

for i=1:100
    if rand()<0.5   % random key in array
        n=floor(rand()*2*length(v));
        r=v(ceil(rand()*length(v)));
        verifyVectorQuery(v,n,r,vectorQuerySol(v,n,r));
    else % random key in general
        n=floor(rand()*2*length(v));
        r=ceil(rand()*100)-50;
        verifyVectorQuery(v,n,r,vectorQuerySol(v,n,r));
    end
end

fprintf('Test ended.\n');
fprintf('If no error message appears above, vectorQuery should be correct.\n');


function verifyVectorQuery(v,n,r,exp)
% Auxiliary function to verify a vector query

response=vectorQuery(v,n,r);

if exp~=response
    fprintf('Wrong answer when n=%d, r=%d, and v is the following:\n',n,r);
    disp(v);
    fprintf('\n');
end

function found=vectorQuerySol(v,n,r)
% Determine whether the number r appears in the first n components of
% vector v.
% Return 1 if r is in the first n components of v and 0 otherwise.

% compute right limit of search
rl=min(length(v),n);

found=0;

% perform search
i=1;
while i<=rl && found==0
    if v(i)==r
        found=1;
    end
    i=i+1;
end