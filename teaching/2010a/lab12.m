% P1ayChimes
close all
% Read in the 1 O'clock soundbite...
[OneOclock,rate] = wavread('BigBen.wav');
n = length(OneOclock);

% Display the wave form...
plot(OneOclock)

title('Listen for the two parts: chimes and gong')
sound(OneOclock,rate)
pause

%get chime sequences
title('Click at the end of the 4th note of chimes.')
[m11,y] = ginput(1);
m11 = round(m11);
Chimes1 = OneOclock(1:m11);

title('Click at the end of the 8th note of chimes.')
[m12,y] = ginput(1);
m12 = round(m12);
Chimes2 = OneOclock(m11+1:m12);

title('Click at the end of the 12th note of chimes.')
[m13,y] = ginput(1);
m13 = round(m13);
Chimes3 = OneOclock(m12+1:m13);

title('Click at the end of the chimes.')
[m1,y] = ginput(1);
m1 = round(m1);
Chimes4 = OneOclock(m13+1:m1);

fifteen=Chimes1;
thirty=[Chimes1;Chimes2];
fortyfive=[Chimes1;Chimes2;Chimes3];
hour=[Chimes1;Chimes2;Chimes3;Chimes4];
Chimes=hour;

title('Click at the begining of gong.')
[m2,y] = ginput(1);
m2 = round(m2);
Gong  = OneOclock(m2+1:n);
lenGong=n-m2;

%filter noise
for i=m1+1:m2
    if abs(OneOclock(i))<0.03
        OneOclock(i)=0;
    end
end

% Display the wave form...
plot(OneOclock)

pause
title('Playing: OneOclock with no noise between end of chime and start of gong')
sound(OneOclock,rate)

%rate=rate*2;
%reverse chime
pause
title('Playing: Reverse of chime')
revChimes=Chimes(m1:-1:1);
sound(revChimes,rate);

pause
title('Playing: First half of gong three times')
for i=1:3
    sound(Gong(1:floor(lenGong/2)),rate)
end

pause
title('Playing: Notes 1-4 of chime (at :15)')
sound(fifteen,rate);
pause(length(fifteen)/rate)
title('Playing: Notes 1-8 of chime (at :30)')
sound(thirty,rate);
pause(length(thirty)/rate)
title('Playing: Notes 1-12 of chime (at :45)')
sound(fortyfive,rate);
pause(length(fortyfive)/rate)
title('Playing: Notes 1-16 (all) of chime (at :00)')
sound(hour,rate)

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
