function [y] = azlatfilt(k, x, G)
% AZLATFILT      Function for implementation of an all-zero FIR lattice filter
%   Y = AZLATFILT(k, x, G) Creates
% From Figure 9.26 (p 515)

    M = length(k); 
    
    % Create an array for the sequence f_m[n]
    f = zeros(1,M); 
    
    % Create an array for the sequence g_m[n]
    g = f;
    
    % Create an array for the sequence g_m[n-1]
    oldg = zeros(1,M);
    
    % Keeps track of x[n-1]
    oldx = 0;
    x = G*x; 
    y = zeros(size(x));
    
    for n=1:length(x)
        % Compute f1[n] = x[n] + k1x[n ? 1] -> Equation (9.57a)
        f(1) = x(n)+k(1)*oldx;
        
        % Compute g1[n] = k1x[n] + x[n ? 1] -> Equation (9.57b)
        g(1) = k(1)*x(n)+oldx;
        oldx = x(n);
        for m = 2:M
            % Compute: fm[n] = fm?1[n] + km gm?1[n ? 1] -> Equation (9.55a)
            f(m) = f(m-1)+k(m)*oldg(m-1);
            
            % Compute: gm[n] = km fm?1[n] + gm?1[n ? 1] -> Equation (9.55b)
            g(m) = k(m)*f(m-1)+oldg(m-1);
            
            % Delay
            oldg(m-1) = g(m-1);
        end
        
        % y[n] = fM[n] -> Equation (9.56b)
        y(n) = f(M);
    end
end
