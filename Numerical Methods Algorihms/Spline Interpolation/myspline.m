% This m-file calculates the interpolating polynomial and cubic spline of
% randomly created 8 points and plots the results.
% INPUTS:
% randomly created 8 points.
% OUTPUTS:
% plots of the calculated results.
%
% Numerical Methods MATH259 - Assignment #2
%
% Bahaddin ARISOY   - 150110813
% Ahmet KAZAN       - 150110855
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = myspline()

% random x and y points (x=1:8 , y=0:1)
x=1+7.*rand(1,8);
y=rand(1,8);

xi = 0:.0001:10; 
% calculate interpolating polynomial and plot
yi = interp1(x,y,xi); 
plot(x,y,'o',xi,yi,'r');
title('Bahaddin Arýsoy - 150110813  /  Ahmet Kazan - 150110855  ///  Interpolating Polynomial and Cubic Spline');

hold on;
% calculate cubic spline and plot
yi = spline(x,y,xi); 
plot(x,y,'o',xi,yi,'b');

end