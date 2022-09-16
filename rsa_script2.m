%% The keys generation part
% (1) select two distinct prime numbers
p = nthprime(4);   q = nthprime(10);
% (2) compute n and phi(n) that produces a number that is relatively prime to n
n = q * p; phi = @(p, q) (p - 1) * (q - 1);
% (3) Choose any number 1 < e < phi(n) that is comprime to phi(n);
e = 0;
while(gcd(e, phi(p,q)) ~= 1) % This number is not a divisor of phi(n)
  e = ceil(rand(1) * phi(p,q) + 1); % Randomly peak until the condition is true
end
% (4) Compute d, such that d and e have the same remainder of division by phi.  
d = 2;
while(powmod(d * e, 1, phi(p, q)) ~= 1)
    d = d + 1;
end


%% The encryption/decryption part
disp(['mod(d * e, phi) should be 0: ', num2str(powmod(d*e - 1, 1, phi(p, q)))]);
% Public key is then
disp(['Public key:  (', num2str(e), ',', num2str(n),')']);
disp(['Private key: (', num2str(d), ',', num2str(n),')']);
m = 15; % message
disp(['Message to be ecnrypted: ', num2str(m)]);
% Encrypt
%c = mod(m^e, n); % won't work, due to overflow problem
c = powmod(m, e, n);
disp(['Encrypted message: ', num2str(c)]);
% Decrypt
m_ = powmod(c, d, n);
disp(['Decrypted message: ', num2str(m_)]);

