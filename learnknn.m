function classifier = learnknn(k, d, m, Xtrain, Ytrain)
  classifier = struct('k',k,'d',d,'training_size',m,'xtrain',Xtrain,'ytrain',Ytrain);
end

