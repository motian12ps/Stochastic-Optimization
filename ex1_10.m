function ex1_10()

theta0 = [0 , 3]';
max_iter = 6;
iter = 0;
ak = [0.062, 0.24, 0.11, 0.31, 0.12, 0.36];
theta = zeros(2,max_iter+1);
fval = zeros(1, max_iter+1);
while 1
    if iter > max_iter
        break;
    end
    if iter == 0
        theta(:, iter + 1) = theta0;        
    else
        theta(:, iter + 1) = theta(:, iter) - ak(iter) * grad(theta(:, iter) );
    end
    
    fval(iter + 1) = fun( theta(:, iter + 1) );
    iter = iter + 1;
end
theta
fval
end

function [fvalue] = fun( theta )
    fvalue = ( theta(1) - 2 )^4 + ( theta(1) - 2 * theta(2) )^2;
end

function [g] = grad( theta )
    g = zeros( size(theta) );
    g(1) = 4 * ( theta(1) - 2 )^3 + 2 * ( theta(1) - 2 * theta(2) );
    g(2) = -4 * ( theta(1) - 2 * theta(2) );
end