function portfolio2()

names = {'x_s', 'x_b', 'x_m'};
model.varnames = names;
model.Q = sparse([0.0278 5.5977*(10^(-4)) 1.9200*(10^(-4)); 5.5977*(10^(-4)) 4.8741*(10^(-4)) 2.4230*(10^(-4)); 1.9200*(10^(-4)) 2.4230*(10^(-4))  0.0012]);  % x^T*Q*x define the quadratic term in objective function
model.A = sparse([0.1074 0.0782 0.0627; 1 1 1; -1 -1 -1]);   % A define the constraint matrix of LHS
model.obj = [0 0 0];   %obj define the linear term in objective function
model.rhs = [0.065 1 -1];   % rhs define the rhs of the constraints 
model.sense = '>';

gurobi_write(model, 'qp.lp');

results = gurobi(model);

for v=1:length(names)
    fprintf('%s %e\n', names{v}, results.x(v));
end

fprintf('Obj: %e\n', results.objval);

end