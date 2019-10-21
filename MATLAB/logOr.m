function res = logOr(ar1,ar2)
% this function performs a logical OR operation between ar1 and ar2 vectors

res = ar1;
[~,m] = size(res);
for i = 1:m
    res(i) = ar1(i) + ar2(i);
    if res(i) == 2
	   res(i) = 1;
    end
end

end

