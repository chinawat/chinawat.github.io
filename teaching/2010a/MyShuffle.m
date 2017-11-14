function sd=MyShuffle(d)
% d is a one-dimensional cell array
% sd is the cell array afer shuffling d
% The shuffle comprises of two steps:
%  - randomly cut the deck into 2 parts, i.e., the position of the cut is
%  random.
%  - interleave the cards from the two parts until the parts with fewer
%  cards have been completely incorporated.  It is up to you whether to
%  start from the top or the bottom.

% get number of cards
num=length(d);

% get position to cut the cards
cutPos=ceil(rand*num);

% cut the cards
TopD=d(1:cutPos);
BotD=d(cutPos+1:num);

% number of alternation
numAlt=min([cutPos num-cutPos]);

% create resulting deck
sd=cell(1,num);

% interleave the cards
for i=1:numAlt
    sd{2*i-1}=TopD{i};
    sd{2*i}=BotD{i};
end

% put the leftover at the end
% We have put 2*numAlt cards so far, so we need to put cards 2*numAlt+1 to num.
% We have consumed numAlt cards in the leftover deck, so we have to put
% cards numAlt+1 to X, where X is the number of cards in that deck.
% Note that the number of cards in the leftover deck and the number of
% cards not in sd are the same.

% determine which deck is the leftover
if cutPos<num-cutPos   % BotD is the leftover
    sd(2*numAlt+1:num)=BotD(numAlt+1:num-cutPos);
else
    sd(2*numAlt+1:num)=TopD(numAlt+1:cutPos);
end