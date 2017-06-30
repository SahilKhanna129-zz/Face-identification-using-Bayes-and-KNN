% Initialization
clear ; close all; clc

% Intialize direct path to the project folder
cd "J:\\Personal Documents\\Machine Learning\\Project\\project01\\project01\\Code\\skhanna9_Proj1\\Code";

% Load Training Data and variable face
load('data.mat'); 

% Intiate the number of classes in the data set
num_classes = 200;

ans = input("Do you want to Visualize Data...Press 1 otherwise press 0...\n");

if (ans == 1)
  display(face);
  printf("Close the images to proceed...\n");
  end

% Reshaped training data for the maximum likelihood operation
X_comb = shaping(face);

% Separate training data and testing data
[~,dimensions_size] = size(X_comb);
X_testing = zeros(200,dimensions_size);
X_training = zeros(400,dimensions_size);
 j = 1;
 k = 1;
for i = 1:3:600;
  X_training(k,:) = X_comb(i,:);
  X_training(k+1,:) = X_comb(i+1,:);
  X_testing(j,:) = X_comb(i + 2,:);
  j = j+1;
  k = k+2;
end;

fprintf("Please choose one feature reduction tool for the bayes classifier to avoid out of memory error...\n");
ans = input("Press 1 for choosing PCA, Press 2 for choosing LDA and press 0 for opting no reduction...\n");

% Calculate principal components of all the samples.
% Getting matrix with reduced dimensions ensuring 95% variance information.
if (ans == 1)
  W_projection_pca = pca(X_training);
  X_training = X_training*W_projection_pca;
  X_testing = X_testing*W_projection_pca;
  end 
  

% Label Matrix for all samples
y_label = generateLabels();

% LDA implementation
if (ans == 2)
  [W_projection] = LDA(X_training, y_label);
   X_training = X_training*W_projection;
   X_testing = X_testing*W_projection;
  end
  
ans = input("Press 1 for choosing Bayes Classifier, Press 2 for choosing KNN Classifier\n");

if (ans == 1)
  % Maximum Likelihood estimates for Training data X_n and X_e
  [exp_mu, exp_cov] = MaximumLikelihood(X_training, num_classes);

  % Storing the inverse of covariance matrix in the matrix of 200*1
  [inv_cov] = Inverse_Covariance(exp_cov, num_classes);

  % Calculating coefficients for the discriminant functions of each class.
  % Discriminant function is gi(x) = x'*Wi*x + wi'*x + wi0 where
  % Wi = -1/2*sigma_inv_i; wi = sigma_inv_i*mu_i; wi0 = -1/2*mu_i'*sigma_inv_i*mu_i
  [W_i, w_i, wo_i] = Discriminant_Coefficients(exp_mu, inv_cov);

  % Trained the Bayes Classifier with X_n and X_e parameters.
  [y_predict] = BayesClassifier(X_testing, W_i, w_i, wo_i);
  end

if (ans == 2)
  % Intialize class labels
  y = zeros(400,1);
  j = 1;
  for i = 1:2:400;
    y(i,1) = j;
    y(i + 1,1) = j;
    j = j+1;
  end;

  % Intialize k
  k = input("Enter a integer value for k: ");

  % Classify using KNN rule
  [y_predict] = KNN_classification(X_training, X_testing, y, k);
  end

% Classifier accuracy
y_label = 1:200;
acc = 100*(1 - (nnz(y_label' - y_predict))/200);
printf("Accuracy of the operation is: %f\n", acc);


