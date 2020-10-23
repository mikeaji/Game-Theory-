%% This will implement task 3 to find the correlated equlibrium that maximizes the sum of players utlities 



inputs = [1 1 0 0 0 0 0 0 0;     
    -3 0 0.5 0 0 0 0 0 0;            %  so this would be the enequalilty contraints on left hand side
    0 0 0 -1 -1 0 0 0 0;
    0 0 0 0 0 0 3 0 -0.5;
    0 0 0 0 0 0 4 1 -0.5;
    0 0 0 -4 -1 0.5 0 0 0;
    1 0 0 1 0 0 0 0 0;
    -3 0 0 0 0 0 0.5 0 0;
    0 -1 0 0 -1 0 0 0 0;
    0 -4 0 0 -1 0 0 0.5 0;
    0 0 3 0 0 0 0 0 -0.5;
    0 0 4 0 0 1 0 0 -0.5];


inputsright = [0,0,0,0,0,0,0,0,0,0,0,0]             % so this would be the enequalilty contraints on the r ight hand side


leftvalue = [1,1,1,1,1,1,1,1,1]
                                                       % so this would be
% the equality on the left and right side 
rightvalue = [1];


bvalue = [0,0,0,0,0,0,0,0,0] 
ubvalue = ones(1, 9);                     % so this would be the boundries of the variables

thisfun = [-6 -4 0 -4 -2 0 0 0 -1];
[x,gamevalue] = linprog(thisfun,inputs,inputsright,leftvalue,rightvalue,bvalue,ubvalue);

% so this is displaying and showing the optimal game value and probaablities 
gamevalue

fprintf('Equalibrium stated');


