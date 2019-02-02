b = [ 6 -10  2]
a = [ 1  -3  2]

% Partial fraction expansion using residuez
[A,p,C] = residuez(b, a)

% Reverse operation
[b, a] = residuez(A, p, C)