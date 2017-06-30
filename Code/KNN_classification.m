function [y_test] = KNN_classification(X_train, X_test, y, k)
  % Classify the label based on the labels of k neighbors
  % Using Euclidean distance for finding the closest neighbors
  % Random label selection in case of tie is implemented
  % @paramters: Training samples, Test Samples, Labels for training samples, K value
  % @return: Prediction matrix.
    
   [~,dimensions_size] = size(X_train(1,:));
   
  % Scale the test matrix accordint to the training
    X_test_scaled = zeros(400,dimensions_size);
   
  for i = 1:200;
    
    for j = 1:400;
    X_test_scaled(j,:) = X_test(i,:); % making 400*504 matrix for each sample to calculate distance.
    end;
  
    % Calculate the euclidean distance between all the dimensions
    dist = sqrt(sum(((X_train - X_test_scaled).^2)'))';
    % sort in ascending order.
    [sort_vector, index_small] = sort(dist); % Sorting distance in ascending order
    labels_k = y(index_small([1:k],:)); % Taking K neighbors with distance
    
    % Calculating uniques label in K neighbors set and there frequency
    [u,~,k] = unique(labels_k);
    count_label = [accumarray(k,1),u];
    
    [value,~] = max(count_label(:,1)); % Checking the max frequency in the k neighbors.
    
    % Choosing the label randomly if there is a tie
    index_max_values = find(value == count_label(:,1)); % Calculating all the index of max frequency
    temp = randperm(size(index_max_values)); % Picking random index of these indices
    label_ind = index_max_values(temp(1,1),1); % Calculating the index of the label
    
    y_test(i,1) = count_label(label_ind,2); % Calculating the label.
    end;
 
 end;
  