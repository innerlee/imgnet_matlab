function [  ] = drawCircle( xc,yc,r,color )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


%  Create a green transparent ellipse
x = r*sin(-pi:0.01*pi:pi) + xc;
y = r*cos(-pi:0.01*pi:pi) + yc;
fill(x, y, color, 'FaceAlpha', 0.3)


end

