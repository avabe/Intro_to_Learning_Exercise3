function alpha = softsvmrbf(lambda, sigma, m, d, Xtrain, Ytrain)
  gram = zeros(m);
  for i=1:m
    for j=1:m
      gram(i, j) = exp(-norm(Xtrain(i,:)-Xtrain(j,:)).^2/(2*sigma));
    end
  end
  H = [2*gram*lambda zeros(m); zeros(m,2*m)];
 
  u = [zeros(1,m) ones(1,m)*(1/m)];
 
  A = [zeros(m) eye(m); gram.*Ytrain eye(m)];
 
  v = [zeros(1,m) ones(1,m)];
 
  z = quadprog(H, u, -A, -v);
 
  alpha = z(1:m); 
end
