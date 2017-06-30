function [W] = pca(X)
  % Calculates the principal components of the features
  % Dimensions of feature matrix can be tuned by info_percentage parameter
  % @parameter: Matrix for feature reduction
  % @return: Matrix with reduced feature
  
  % This variable can be controlled to retain X percentage of variance, default is 95%
  info_percentage = 0.95;
  
  % Calculate mean of all the features
  mu = mean(X); 
  
  % Find the centeroid by mean from all the features
  h = ones(size(X(:,1))); 
  Xm = X - h*mu;
  
  % Calculate covariance matrix of Xm
  C = cov(Xm);
  
  % Calculate eigen values and eigen vectors.
  [V, D] = eig(C); 
  
  [D, i] = sort(diag(D), 'descend'); % Sorting the eigen values to get eigen vectors with high % info
  
  gain = sum(D)/sum(D); % Intialize Gain to eliminate less useful dimensions
  [j, x] = size(D); % Counter to reduce dimensions one by one i.e 504
  g = sum(D); % Intialize g to sum of all the values.
  
  % We will keep the vectors which retains 95% variance by default
  % Percentage can be controlled by changing the parameters
  while (gain > info_percentage); 
    D = resize(D,j,1);
    gain = sum(D)/g;
    j = j - 1;
  end;
  
  i = resize(i, j + 1, 1);
  V = V(:, i); % Eigen vector which has 95% information.
  W = V; % Projection vectors
  
  
  
  