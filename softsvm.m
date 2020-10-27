function w = softsvm(lambda, m, d, Xtrain, Ytrain)
  u1 = zeros(1,d);
  u2 = ones(1,m);
  u2 = (1/m)*u2;
  u = [u1 u2];
  u = u';
  
  H = [2*lambda*eye(d,d) zeros(d,m); zeros(m,d+m)];
  
  A1 = Xtrain;
  for i=1:m
    A1(i,:) = A1(i,:)*Ytrain(i);
  end
  A = [zeros(m,d) eye(m);A1 eye(m)];
  
  v = [zeros(1,m) ones(1,m)]';
  w1 = quadprog(H,u,-A,-v);
  
  w = w1(1:d);
  end
