function [  ] = drawCircle( xc,yc,r,color )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(xc)

    x = r*sin(-pi:0.01*pi:pi) + xc(i);
    y = r*cos(-pi:0.01*pi:pi) + yc(i);
    fill(x, y, color{i}, 'FaceAlpha', 0.3)

end

end

