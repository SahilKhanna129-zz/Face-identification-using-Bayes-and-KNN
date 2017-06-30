function [h, display_array] = display(X)
  
  % Display images of the samples
  % @paramters: face samples matrix
  % @return: figures of the samples
  
  [rows, columns, planes] = size(X);
  
  for i = 1:planes
    figure(1);
    subplot(planes/10,10,i);
    imshow(X(:,:,i));
  end

end;
