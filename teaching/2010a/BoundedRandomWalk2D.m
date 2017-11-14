function [x, y] = BoundedRandomWalk2D(N,n)
% Simulate a bounded 2D random walk in a (2N+1)-by-(2N+1) grid for n steps.
% N is a positive integer.
% Walk starts from the middle and continues until the an edge, abs(N),
% is reached.
% x and y are row vectors with the property that (x(k),y(k)) is the
% location of the token after k hops, k=1:length(x).

% Initializations...
k=0; xc=0; yc=0;

% Since we know the number of steps, we can initialize x and y now.
x=zeros(1,n);
y=zeros(1,n);

% In general, (xc,yc) is the location after k hops.
while k<n
    % Standing at (xc,yc), randomly select a step
    r=rand(1);
    if xc==-N % left edge
        if yc==N % top-left corner
            if r<0.5
                xc=xc+1;    % right
            else
                yc=yc-1;    % down
            end
        elseif yc==-N % bottom-left corner
            if r<0.5
                xc=xc+1;    % right
            else
                yc=yc+1;    % up
            end
        else
            if r<1/3
                yc=yc+1;    % up
            elseif r<2/3
                xc=xc+1;    % right
            else
                yc=yc-1;    % down
            end
        end
    elseif xc==N % right corner
        if yc==N % top-left corner
            if r<0.5
                xc=xc-1;    % left
            else
                yc=yc-1;    % down
            end
        elseif yc==-N % bottom-left corner
            if r<0.5
                xc=xc-1;    % left
            else
                yc=yc+1;    % up
            end
        else
            if r<1/3
                yc=yc+1;    % up
            elseif r<2/3
                xc=xc-1;    % left
            else
                yc=yc-1;    % down
            end
        end
    elseif yc==N % top edge
        if r<1/3
            xc=xc+1;    % right
        elseif r<2/3
            xc=xc-1;    % left
        else
            yc=yc-1;    % down
        end
    elseif yc==-N % bottom edge
        if r<1/3
            xc=xc+1;    % right
        elseif r<2/3
            xc=xc-1;    % left
        else
            yc=yc+1;    % up
        end
    else % inside square
        if r < .25
            yc= yc + 1; % north
        elseif r < .5
            xc= xc + 1; % east
        elseif r < .75
            yc= yc -1; % south
        else
            xc= xc -1; % west
        end
    end
    
    % Record location...
    k= k + 1; x(k)= xc; y(k)= yc;
end