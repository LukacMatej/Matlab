function [k, q] = lin_regression(x, y)
  n = length(x);
  sum_x = sum(x);
  sum_y = sum(y);
  sum_x2 = sum(x.^2);
  sum_xy = sum(x.*y);
  k = (n*sum_xy - sum_x*sum_y) / (n*sum_x2 - sum_x^2);
  q = (sum_y - k*sum_x) / n;
end