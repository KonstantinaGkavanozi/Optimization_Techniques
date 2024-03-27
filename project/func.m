function [f] = func(u1,u2)
% The f(u1,u2) function to be used for creating the data and for evaluation
% of our results.

f = sin(u1+u2)*sin(u2^2);
end
