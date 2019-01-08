function [X, t]= panduan(A)
tic
 if size(A, 1) ~= size(A, 2)
        error('It is not a square matrix');
 end
% get the size of the matrix and initial a matrix X to store the output matrix
  n = size(A,1);
  X = zeros(n,n);
% the record array is used to accord if all the row be set
  record = zeros(n);
  for i = 1 : n;
% get the absolute value of every element in every row
    row_max = abs(A(i,:));
% find out the max element of the row,and use pos to accord its position in
    [max_ele,pos] = max(row_max);
% check if the max_ele is the realy max element of the row,if not,return error
    if max_ele <= sum(abs(A(i,:))) - max_ele
        error('The matrix can not be transformed into a strictly diagonally dominant matrix');
    end
  end