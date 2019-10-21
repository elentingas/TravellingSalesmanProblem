function res = isAllZeros(array)
% this function checks whether the given array is an all zero vector, if
% yes it returns 1, if no, then 0
res = 1;

[~,size1] = size(array);

for i = 1:size1
    if array(i) ~= 0
        res = 0;
    end
end


end

