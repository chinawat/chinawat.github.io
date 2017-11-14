% P1ayChimes
close all
% Read in the 1 O'clock soundbite...
[OneOclock,rate] = wavread('BigBen.wav');
n = length(OneOclock);

% Display the wave form...
plot(OneOclock)

title('Click at the begining of gong.')
[m2,y] = ginput(1);
m2 = round(m2);
Gong  = OneOclock(m2+1:n);
lenGong=n-m2;

%play gong for two minutes
%length*rate+1=number of elements
lenTwo=rate*120+1;
TwoMinuteGong=zeros(lenTwo,1);
numReps=floor(lenTwo/lenGong);
for i=1:numReps
    TwoMinuteGong((i-1)*lenGong+1:i*lenGong)=Gong;
end

TwoMinuteGong(numReps*lenGong+1:lenTwo)=Gong(1:lenTwo-(numReps*lenGong));

pause
title('Playing: Gong after gong after gong for exactly two minutes')
sound(TwoMinuteGong,rate);
