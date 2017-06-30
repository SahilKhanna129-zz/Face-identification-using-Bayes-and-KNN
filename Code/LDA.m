function [W_projection] = LDA(X, y)
  % Reduction of the dimensions using linear discriminant analysis
  % @parameters: Feature matrix and Label matrix.
  % @return: Feature Matri with reduced dimensions of num_samples*(num_classes - 1).
   
  [row, col] = size(X);
   
  % Intialize mean matrix for face data with given classes
  mu_class = zeros(200,col);
  
  % Calculating mean for all the classes
  for i = 1:200;
    mu_class(i,:) = mean(X(find(y == i),:),1);
  end;
    
  % Calculating within class matrix
  Sw = zeros(size(X,2));
  for i = 1:200;
    Sw = Sw + (X(find(y == i),:) - mu_class(i,:))'*(X(find(y == i),:) - mu_class(i,:));
  end;
  
  % Calculating between class matrix
  mu_overall =  mean(X);
  Sb = zeros(size(X,2));
  for i = 1:200;
    [row, col] = size(X(y == i, :));
    num_samples_class = row*col;
    Sb = Sb + num_samples_class*(mu_class(i,:) - mu_overall)'*((mu_class(i,:) - mu_overall));
  end;
  
  [V, D] = eig(pinv(Sw)*Sb);
  [D, i] = sort(diag(D), 'descend'); 
  i = i([1:199], 1);
  V = V(:, i);
  W_projection = V;
  end;
  
    
    
  