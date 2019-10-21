
function minCost = recursiveAlgo(distances, numberOfCities)

  % this is the Recursive algorithm for TSP

  % we call the recursion funtion, starting from first city 
  
   minCost = recFunc(1, 1, distances, numberOfCities);
   
  % show the answer 
   
   disp("The min cost(in km) of traversal by RECURSIVE ALGORITHM is");
   
   disp(minCost);
   
   minCostString = "" + minCost;
   
   message2 = msgbox({"RECURSIVE ALGORITHM";'The minimum cost(in km) of traversal is ' ; minCostString });
    
end