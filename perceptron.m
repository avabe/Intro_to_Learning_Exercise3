function w = perceptron(m, d, Xtrain, Ytrain, maxupdates)
  t = 1;
  w = zeros(1,d);
  ind = 0;
  bad_ind = help(Xtrain, Ytrain, w, ind, m);
  while bad_ind > 0 && t < maxupdates
    example = Xtrain(bad_ind,:);
    label = Ytrain(bad_ind);
    update = example*label;
    w = w + update;
    bad_ind = help(Xtrain, Ytrain, w, bad_ind, m);
    t = t + 1; 
  end
end
