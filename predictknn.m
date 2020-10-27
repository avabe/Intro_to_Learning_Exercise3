function Ytestprediction = predictknn(classifier, n, Xtest)
  result = zeros(n,1);
  for r=1:n
    v = Xtest(r,:);
    v = double(v);
    
    samples = classifier.xtrain;
    dists = zeros(classifier.training_size,2);
    for i = 1:classifier.training_size
      u = samples(i,:);
      dist = norm(v-u);
      dists(i,1) = dist;
      dists(i,2) = i;
    end
    
    sorted_dists = sortrows(dists,1);
    count_labels = zeros(1,10);
    
    for j = 1:classifier.k
      ind = classifier.ytrain(sorted_dists(j,2));
      count_labels(ind+1) = count_labels(ind+1) + 1;
    end
    
    [val,label] = max(count_labels);
    result(r,1) = label-1;
  end
  Ytestprediction = result;
end
