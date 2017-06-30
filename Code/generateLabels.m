function [y_label] = generateLabels()
  % Generate labels for all 600 samples
  % @parameter: None
  % @return: label vector for 600 samples of face data
  
  y_label = zeros(400,1);
  j = 1;
  for i = 1:2:400
    y_label(i,1) = j;
    y_label(i + 1,1) = j;
    j = j+1;
  end
 
end;
  