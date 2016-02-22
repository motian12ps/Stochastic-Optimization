function ex2_2()

%%%%%%%%%%%%%%%%

%Author : Tianyi Chen

%Date   : 2/21/2016

%%%%%%%%%%%%%%%%

theta0 = [0;0;0];
fval_old = fun( theta0 );
iter = 0;
max_iter = [1e2, 1e3 , 1e4, 1e5, 1e6];
fval = zeros(size(max_iter)); 

for i = 1 : length(max_iter)

while 1
    
    if iter > max_iter(i)
        break;
    end
    if iter == 0
        theta_old = theta0;
    else
        theta_old = theta_new;
    end
    
    % generate new theta in [-1,1]^3
    theta_tmp = 2 * rand(3,1) - 1;
    if fun( theta_tmp ) < fun(theta_old)
        theta_new = theta_tmp;
    else
        theta_new = theta_old;
    end
    iter = iter + 1;
end
theta = theta_new;
fval = fun( theta );
fprintf('Evaluation times: %d.\n',max_iter(i));
fprintf('Final theta is ( %f, %f, %f ), L is %f.\n', theta(1), theta(2), theta(3), fval );

iter = 0;

end


end

function [fvalue] = fun(theta)
    fvalue = - ( theta(3) - theta(2) )^2 * ( theta(3) - theta(1) )^2 * ( theta(2) - theta(1) )^2;
end

