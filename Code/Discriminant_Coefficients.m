function [Wi, wi, wo] = Discriminant_Coefficients(mu, cov_inv)
  % Calculating the coeficiants for c discriminant function
  % Discriminant function is gi(x) = x'*Wi*x + x*wi + wi0 where
  % Wi = -1/2*sigma_inv_i; wi = sigma_inv_i*mu_i; wi0 = -1/2*mu_i'*sigma_inv_i*mu_i
  % Return Wi as 504*504, wi as 504*200, wo as 200*1 for face data.
  
  [num_classes, num_features] = size(mu);
  
  % Calculating the Wi coefficient
  Wi = -1/2.*cov_inv;
  
  % wi matrix for all 200 samples
  wi = zeros(num_features, num_classes);
  j = 1;
  for i = 1:num_classes;
    wi(:,i) = cov_inv([j:j+num_features - 1],:)* mu(i,:)';
    j = j+num_features;
  end;
  
  % Calculating the wo coefficient
  wo = zeros(num_classes,1);
  j = 1;
  for i = 1:num_classes;
    wo(i,1) = -1/2*mu(i,:)*cov_inv([j:j+num_features-1],:)*mu(i,:)';
    j = j+num_features;
  end;
  
end;
  