function portfolio()
% Copyright 2020, Gurobi Optimization, LLC
%
%  minimize
%      0.02778x_s^2 + 2*0.00387x_s*x_b + 2*0.00021x_s*x_m+0.01112x_b^2-2*0.00020x_b*x_m+0.00115x_m^2
%  subject to
%      0.1073x_s+0.0737x_b+0.0627x_m >= R
%      x_s+x_b+x_m=1
%      x, y, z non-negative
%
% It solves it once as a continuous model, and once as an integer
% model.

names = {'x_s', 'x_b', 'x_m'};
model.varnames = names;
model.Q = sparse([0.02778 0.00387 0.00021; 0.00387 0.01112 -0.00020; 0.00021 -0.00020 0.00115]);  % x^T*Q*x define the quadratic term in objective function
model.A = sparse([0.1073 0.0737 0.0627; 1 1 1; -1 -1 -1]);   % A define the constraint matrix of LHS
model.obj = [0 0 0];   %obj define the linear term in objective function
model.rhs = [0.105 1 -1];   % rhs define the rhs of the constraints 
model.sense = '>';

gurobi_write(model, 'qp.lp');

results = gurobi(model);

for v=1:length(names)
    fprintf('%s %e\n', names{v}, results.x(v));
end

fprintf('Obj: %e\n', results.objval);

model.vtype = 'B';

results  = gurobi(model);

for v=1:length(names)
    fprintf('%s %e\n', names{v}, results.x(v));
end

fprintf('Obj: %e\n', results.objval);

end