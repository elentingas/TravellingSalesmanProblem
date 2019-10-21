function res = logAnd(ar1,ar2)
% this function performs a logical AND operation between ar1 and ar2 vectors

res = ar1;
[~,m] = size(res);
for i = 1:m
    res(i) = ar1(i) * ar2(i);
end

end

