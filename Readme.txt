MainApp.m:

1. Main code file contains both bayes and Knn classifiers.

2. Code uses faces data file i.e data.mat for the models

3. Before compilation, change the directory address by using:
	
cd ".........directory address of code folder........."

4. Run the code and choose appropriate options from the console

5. Please choose one option for feature reduction like PCA or LDA during execution for bayes classifier.
   It is needed to avoid out of memory error. Octave is unable to handle large data of
   covariance matrix.

6. Choose any reduction tool or do not choose any if you are testing Knn classifier.

7. Choose one classifier between Bayes and Knn

8. Program will give you an accuracy as a output.