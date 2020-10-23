clc
clear
close all

%% problem 1 
R = [4 1; 5 0];
S = R';

% using our function to build constraints describing the region of correlated 
% equilibria
n = numel(R);

%% maximizing sum of payoff
% using MATLAB function quadprog to find corner of convex hull
A = [constraints_eq(R); constraints_eq(S); eye(n)];
b = zeros(size(A,1),1);
Aeq = ones(1,n);
Beq = -1;
tol = 1;

% find some random corners of the set of correlated equilibria and
% display them
c = randn * R(:) + randn * S(:);
H = tol*speye(length(c));

x = -1*(quadprog(H, c, A, b, Aeq, Beq));
P = reshape(x, size(R,1), [])
fprintf('P1 value %g\n', P(:)'*R(:));
fprintf('P2 value %g\n\n', P(:)'*S(:));