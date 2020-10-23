%%  Task 4 to compute the pure Nash equlibrium 
RealPNumbers = [1000000,555710, 470400];
Price = [1 0.55071 0.4704]; % so this would be the CTR numbers 

point = 1;  % pointer so a count for saving nash equilibrium
balance = [];   % saving the nash equilibrium numbers
anarchy = [];   % saving the price of anarachy 
MaximumNumber = (1000000-2)+0.55071*(555710-1)+0.4704*470400;
solution = []; % this displays a solution array to save social welfare;

firstplayercall = 50000:50000:1000000;  %  so this is the first player bid
% so this sis the secondplayer bid
secondplayercall = 25000:25000:550000;
secondplayercall = [secondplayercall 555710];
% so this is the thrid player bid
thirdplayercall = 20000:20000:460000;
thirdplayercall = [thirdplayercall 470400];

for firstplayer=1:length(firstplayercall)   %so this would be  iterating till the first player value per click
    for secondplayer = 1:length(secondplayercall) % so this would be iterating till the second player value per click
        for thirdplayer = 1:length(thirdplayercall)  % so this would be iterating till the second players value per click
            [numb, x] = sort([firstplayercall(firstplayer),secondplayercall(secondplayer),thirdplayercall(thirdplayer)], 'descend');...
                %  so this is essentially sorting the bids
            y = zeros(1,3);
            y(1) = find(x==1);
            y(2) = find(x==2);
            y(3) = find(x==3);
            figure = [numb(2) numb(3) 0];    % displays the figure cost for each of the bidder
            matrix = (RealPNumbers-figure(y)).*Price(y); % this is a matrix payOff for each of the players

            
            section = 1;    % so this will check whether a nash equilibrium is in section 
            
            % now Checking other alternative strategies of player 1 to find
            % the now nash equlibrium 
         
           
            for strat=1:length(firstplayercall)                      % now for the nash equilibrium
                if strat ~= firstplayer                              % sorting so now in descending order for arrangement
                    [numberchange, x] = sort([firstplayercall(strat),secondplayercall(secondplayer),thirdplayercall(thirdplayer)], 'descend');...
                %so this is implementing and sorting the bids out sorting the bids
                    a = zeros(1,3);
                    a(1) = find(x==1);
                    a(2) = find(x==2);
                    a(3) = find(x==3);
                    bidcost = [numberchange(2) numberchange(3) 0];    % cost for each bidder
                    paycost = (RealPNumbers-bidcost(a)).*Price(a); % payOff for each of the user
                    if matrix(1) < paycost(1)
                        section = 0;    % so this is notnot not a equilibrium
                    end
                end
            end
            
             % Checking other alternative strategies of player 2 to find
             
            for check=1:length(secondplayercall)            % now for the nash equilibrium
                if check ~= secondplayer                       % sorting so now in descending order for arrangement 
                    [numberchange, x] = sort([firstplayercall(firstplayer),secondplayercall(check),thirdplayercall(thirdplayer)], 'descend');...
                % so this is implementing and sorting the bids out
                    a = zeros(1,3);
                    a(1) = find(x==1);
                    a(2) = find(x==2);
                    a(3) = find(x==3);       %so this displays the cost for each bidder
                    bidcost = [numberchange(2) numberchange(3) 0];    
                    paycost = (RealPNumbers-bidcost(a)).*Price(a); % so this displays the payOff for each of the user
                    if matrix(2) < paycost(2)
                        section = 0;    %so this is notnot not an equilibrium
                    end
                end
            end
            
             % Checking other alternative strategies of player 3 to find
             % now for the nash e
            for checkx=1:length(thirdplayercall)
                if checkx ~= thirdplayer
                    [numberchange, x] = sort([firstplayercall(firstplayer),secondplayercall(secondplayer),thirdplayercall(checkx)], 'descend');...
                % so this is now sorting the bids
                    a = zeros(1,3);
                    a(1) = find(x==1);
                    a(2) = find(x==2);
                    a(3) = find(x==3);
                    bidcost = [numberchange(2) numberchange(3) 0];    % cost for each bidder
                    paycost = (RealPNumbers-bidcost(a)).*Price(a); % payOff for each of the user
                    if matrix(3) < paycost(3)
                        section = 0;    %  so this is not not not a equilibrium
                    end
                end
            end
            
            % If a == 1, it is a nash equilibrium and then save it now 
            if section == 1
                % so now this is calculating the Price of anarchy for nash equilbrium point
                anarchy(point) = MaximumNumber/sum(matrix);
                
                % so this now saves the strategies at the equilibrium point
                balance(point,1) = firstplayercall(firstplayer);
                balance(point,2) = secondplayercall(secondplayer);
                balance(point,3) = thirdplayercall(thirdplayer);
                
                % so this now saves the social welfare
                solution(point) = sum(matrix);
                point = point+1;
            end
        end
    end
end
[maxPoA,record] = max(anarchy);  %this is the maximum PoA value
NEquili = balance(record, :);    % this is the  strategies of equilbrium 
NsocialWel = solution(record);   % this is the social welfare
