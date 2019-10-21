
function x = dynamicProg(distances, numberOfCities, cityNames)

% this is the Dynamic Programming algorithm for TSP


x = 0;

% create the DP table(matrix)
dynProgTable = zeros(2^(numberOfCities) + 1, numberOfCities + 1);
dynProgTable(1:2^(numberOfCities) + 1, 1:numberOfCities + 1) = -1;
dynProgTable(2,1) = 0;


% create matlab struct to hold the traversal information after DP algo process,
% this is done to get the resulting path later
for i = 1:2^numberOfCities + 1
     for j = 1:numberOfCities + 1
          str.f = 0;
          str.s = 0;
          pairs(i,j) = str;
     end
end
  

% the core process of Dynamic Programming
for i = 1:(2^numberOfCities)-1
    for j = 0:numberOfCities-1
        if (dynProgTable(i+1,j+1) ~= -1)
            for q = 1:numberOfCities-1
                if (isAllZeros(logAnd(makeBin(i, numberOfCities),makeBin(2^q, numberOfCities))) == 1) 
                    % if the logical AND is zero, then we visit this city
                    % and update our state
                    p = bi2de(logOr(makeBin(i, numberOfCities),makeBin(2^q, numberOfCities)));
                    
                    if (dynProgTable(p+1,q+1) == -1 || (dynProgTable(p+1,q+1) > dynProgTable(i+1,j+1) + distances(j+1,q+1))) 
                        % take the optimal version
                        dynProgTable(p+1,q+1) = dynProgTable(i+1,j+1) + distances(j+1,q+1); 
                        str.f = i;
                        str.s = j;
                        % update path data
                        pairs(p+1,q+1) = str;
                    end
                end
            end
        end
    end
end

% compute the minimum cost of traversal by comparing all the finished traversals
% plus the cost of returning back from the last city of that traversal, and take the minimum among them
city = -1;
traversedAll = (2 ^ numberOfCities) - 1;
for i = 1:numberOfCities-1
    if (dynProgTable(traversedAll+1,i+1) > 0)
        if city == -1 || dynProgTable(traversedAll+1,city+1) + distances(city+1,1) > dynProgTable(traversedAll+1,i+1) + distances(i+1,1)
            city = i;
        end
    end
end
minCostOfTraversal = dynProgTable(traversedAll+1,city+1) + distances(city+1,1);

v.f = traversedAll;
v.s = city;
route = [1];

% get the path of optimal traversal
while pairs(v.f + 1,v.s + 1).f ~= 0 
    route = horzcat([v.s] + 1, route);
    v = pairs(v.f + 1, v.s + 1);

end
   route =  horzcat([1], route);

routeString = '';
[~,q] = size(route);

% convert results into string to display in message box
for i = 1:q
    if i ~= q
        routeString = strcat(routeString , cityNames(route(i)) , "__->__");
    else
        routeString = strcat(routeString , cityNames(route(i)) );
    end
   
end
   
%disp(route);   
disp("The min cost(in km) of traversal by DYNAMIC PROGRAMMING is");
disp(minCostOfTraversal);
disp(routeString);


% show the answer
costString = "" + minCostOfTraversal;
message1 = msgbox({"DYNAMIC PROGRAMMING"; 'The minimum cost(in km) of traversal is ' ; costString; 'And the path is' ; routeString });



end
