
function cost = recFunc(bitmask, start, distances, numberOfCities)

% the core recursion function for Recursive TSP

  minCost = 999999999;
  
  
% base case, i.e. we already finished traversal
  if bitmask == (2^numberOfCities) - 1
      
    cost = distances(start,1);
    
    return;
    
  end
  
  % we check if we can visit a city, if we can then we visit and go further in recursion. In the end we
  % compare the costs and take the minimum
  for i = 0:numberOfCities-1
    
      if(isAllZeros(logAnd(makeBin(bitmask, numberOfCities), makeBin(2^i, numberOfCities))) == 1)
      
      cost1 = distances(start,i+1) + recFunc(bi2de(logOr(makeBin(bitmask, numberOfCities),makeBin(2^i, numberOfCities))), i + 1, distances, numberOfCities);
      
      minCost = min(minCost, cost1);
      
      end
    
  end
  
  % assign the minimal cost and return
  cost = minCost;
  
  return;
    
end