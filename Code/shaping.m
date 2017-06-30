function [X_n] = shaping(X_normal)
  
  % Converting image dimensions from 24*21 to row vector 1*504
  % Converting all sample as the row vector
  % @Parameter: 3D Matrix for reshaping
  % @Return: 2D Matrix samples*feature_vectors 
  
  % Intializing the parameters like rows, cols and planes
  [x,col,z] = size(X_normal(1,:,1));
  [row,y,z] = size(X_normal(:,1,1));
  [x,y,planes] = size(X_normal(1,1,:));
  
  % Converting 3D dimensions to 2D by traversing columnwise
  for i = 1:planes;
    for j = 1:row;
      for k = 1:col;
        X_n(i, j*col + k - col) = X_normal(j,k,i);
      end;
    end;
  end;
  
end;  
       