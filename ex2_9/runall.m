function runall()
%==========================================================================
% Author  : Tianyi Chen
% Date    : Feb 26, 2016
% Purpose : Run all parts of exercise 2.9 in ISSO
%==========================================================================


% Get control parameters.
parms = ex2_9spec;

ex2_9( parms );

%% Part (a)
fprintf('Part (a)\n');
fprintf('==================================================\n');

parms.p = 20;
rhos    = [ 0.125, 0.25, 0.5, 1 ];
rep     = 40;

fprintf('p = %d \n', parms.p );

for i = 1 : length(rhos)
    
    parms.rho = rhos(i);
    
    loss_avg  = 0.0;
    
    for re = 1 : rep
        Info     = ex2_9(parms);
        loss_avg = Info.loss / rep; 
    end
    
    fprintf('rho: %8.4e. Average Loss: %8.4e\n', parms.rho, loss_avg);
end
fprintf('==================================================\n');


%% Part (b)
fprintf('Part (b)\n');
fprintf('==================================================\n');

parms.p = 2;
fprintf('p = %d \n', parms.p );

for i = 1 : length(rhos)
    
    parms.rho = rhos(i);
    
    loss_avg  = 0.0;
    
    for re = 1 : rep
        Info     = ex2_9(parms);
        loss_avg = Info.loss / rep; 
    end
    
    fprintf('rho: %8.4e. Average Loss: %8.4e\n', parms.rho, loss_avg);
end
fprintf('==================================================\n');


end

