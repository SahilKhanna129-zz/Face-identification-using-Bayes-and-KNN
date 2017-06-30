function [sigma_inverse] = Inverse_Covariance(covariance, num_classes)
  % Store the inverse of the covariance for each class in a matrix
  % @parameter: Covariance Matrix and number of classes
  % @return: Inverse covariance matrix for each class
  
  [row, col] = size(covariance);
  
  % Calculating the inverse of covariance matrix using pseudo inverse 
    % Intialize the inverse covariance matrix 200*1
    %sigma_inverse = zeros(row,col);
    %j = 1;
    %for i = 1:num_classes;
      %sigma_inverse([j:(j + col - 1)],:) = pinv(covariance([j:(j + col - 1)], :));
      %j = j + col;
    %end;
  
  % Calculating covariance matrix by adding some values
    sigma_inverse = zeros(row,col);
    j = 1;
    for i = 1:num_classes;
      covariance([j:(j + col - 1)], :)= covariance([j:(j + col - 1)], :) + 0.0000001*eye(col);
      sigma_inverse([j:(j + col - 1)],:) = inv(covariance([j:(j + col - 1)], :));
      j = j + col;
    end;
  
end;
