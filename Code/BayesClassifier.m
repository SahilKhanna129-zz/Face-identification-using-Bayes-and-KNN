function [y_test] = BayesClassifier(X_testing, W_i, w_i, wo_i)
  % Apply bayes rule to estimate testing labels
  % Discriminant function is gi(x) = x'*Wi*x + x*wi + wi0 where
  % Wi = -1/2*sigma_inv_i; wi = sigma_inv_i*mu_i; wi0 = -1/2*mu_i'*sigma_inv_i*mu_i
  % Return Wi as 504*504, wi as 504*200, wo as 200*1
  % Returns the column vector with labels of the form 200*1
  
  [~, num_features] = size(W_i);
  [num_classes,~] = size(wo_i);
  
  % Intiate the label matrix and probability density matrix 
  y_test = zeros(200,1);
  
  % Apply the testing data to the discriminant equations.
  for i = 1:num_classes;
    j = 1;
    temp = zeros(num_classes,1);
    for k = 1:num_classes % Temporary array to store descriminant function output for every class
      temp (k,:) = (X_testing(i,:)*W_i([j:j+num_features - 1],:)*X_testing(i,:)' + X_testing(i,:)*w_i(:,k) + wo_i(k,1))';
      j = j+num_features;
    end
    [~, y_test(i,1)] = max(temp);
  
end
    
  
 


  