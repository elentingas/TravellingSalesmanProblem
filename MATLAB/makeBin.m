function res = makeBin(number, n)
% this function converts a specific number into its binary representation, and it
% returns the binary number as a fixed length vector(fixed length depends on value of n). 

ar = de2bi(number);
array = de2bi(2^n);
[~,size1] = size(array);
[~,size2] = size(ar);

for i = 1:size1
	array(i) = 0;
end

for j = 1:size2
	array(j) = ar(j);
end

res = array;

end

