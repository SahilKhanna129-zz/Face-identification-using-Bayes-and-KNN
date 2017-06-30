function [exp_mu, exp_sigma] = MaximumLikelihood(X, num_classes)
  % This function will return the expected sigma and variance of all feature vectors
  % Which will fit the gaussion such that there individual probability density is max
  % The expected values of multivariate guassion are: mu = mean(X) and sigma = Covariance(X)
  % @parameters: Training samples matrix with rows as samples and columns as features
  % @returns: Expected mean and Expected covariance matrices for each class
  
  [num_samples, num_features] = size(X);
  
  % Intialize matrices
  exp_mu = zeros(num_classes, num_features); 
  exp_sigma = zeros(num_classes*num_features, num_features);
  
  % Calculate mu for each class
  j = 1;
  for i = 1:2:num_samples;
      exp_mu(j,:) = (X(i,:) + X(i+1,:))/2;
      j = j + 1;
  end;
  
  % Scaling matrix for subtraction
  j = 1;
  for i = 1:2:num_samples;
    Xm(i,:) = X(i,:) - exp_mu(j,:); 
    Xm(i + 1,:) = X(i + 1,:) - exp_mu(j,:);
    j = j + 1;
  end;
      
  % Calculate covariance matrix of X_training samples for each class
  j = 1;
  for i = 1:num_features:num_features*num_classes;
    Xm_class = vertcat(Xm(j,:),Xm(j+1,:));
    exp_sigma([i: i+num_features - 1],:) = cov(Xm_class); 
    j = j + 2;
   end;
   
 end;
 