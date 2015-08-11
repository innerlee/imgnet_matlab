function [  ] = drawSphere( xc,yc,zc,r,color )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(xc)

%     x = r(i)*sin(-pi:0.01*pi:pi) + xc(i);
%     y = r(i)*cos(-pi:0.01*pi:pi) + yc(i);
%     fill(x, y, color{i}, 'FaceAlpha', 0.3)

    [x, y, z] = sphere(256);
    x=r(i)*x+xc(i);
    y=r(i)*y+yc(i);
    z=r(i)*z+zc(i);
    h = surfl(x, y, z); 
    set(h,'FaceColor',color{i}, 'FaceAlpha', 0.2)
    shading flat 

end

end

