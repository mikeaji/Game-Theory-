function A = constraints_eq(R)
% user defined function
% to define system of equations with constraints

[x, y] = size(R);
A = zeros(x*(x-1), x*y);

for m = 1:x
  for n = [1:m-1 m+1:x]
    constraints = R(m,:) - R(n,:);
    A((m - 1)*(x-1) + n - (n > m), m:y:end) = constraints;
  end
end

end