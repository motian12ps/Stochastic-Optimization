function [ OutputInfo ] = ex2_9( parms )
%==========================================================================
% Author  : Tianyi Chen
% Date    : Feb 26, 2016
% Purpose : Algorithm B for the objective function of exercise 2.9 in ISSO
%==========================================================================


global p B;                                   % Declare Global Variable p,B

% abbreviate parameters from parms structure
max_iter = parms.max_iter;
p        = parms.p;
rho      = parms.rho;


iter     = 0;                                % iteration 
B        = 0.5 * ones( p ) + 0.5 * eye( p ); % Set Global Variable B 
theta    = ones( p, 1 );                     % Initialize theta

% Initial Loss Value
l_val_0  = fun(theta);

while 1
    
    % Termination , Output Mode
    if iter >= max_iter
        %fprintf('Maximum iteration has been reached.\n');
        % fill in outputinfo structure
        OutputInfo.theta = theta;
        OutputInfo.loss  = fun(theta);
        OutputInfo.loss0 = l_val_0;
        %fprintf('p = %d, rho = %8.4e\n', p, rho);
        %fprintf('Initial Loss Value: %8.4e. Final Loss Value: %8.4e\n', l_val_0, OutputInfo.loss);
        %fprintf('===================================================================\n');
        break;
    end
    
    % Sample direction d
    d = mvnrnd( zeros( 1, p ), rho^2 * eye(p) );
 
    theta_trial = theta + d';
    
    if fun( theta_trial ) < fun( theta )
        theta = theta_trial;
    end
    
    iter = iter + 1;
end


end

%%%%%% External Functions %%%%%%%%%
function lossValue = fun( theta )
    % Calculate Loss Function Value
    global p B;
    lossValue = sum( theta( 1 : p/2 ).^4 ) + theta' * B * theta;
end