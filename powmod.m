function res = powmod(x, e, n)
	res = 1;
     for k = 1:e
        res = mod(res .* x, n);
    end
end
