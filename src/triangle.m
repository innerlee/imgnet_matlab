function [  ] = triangle( index, dists, labels )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% 
% cc= distinguishable_colors(8);
% colors{1}=cc(5,:);
% colors{2}=cc(6,:);
% colors{3}=cc(7,:);
% colors{4}=cc(8,:);
% 
% d=dists(index,index);
% figure;
% axis off;
% axis equal
% hold on;
% x=[];
% y=[];
% z=[];
% 
% switch length(index)
%    case 1
%       drawCircle(x,y,diag(d),colors(1));
%       scatter(x,y,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75])
%    case 2
%       statements
%    case 3
% 
% end

if length(index)>=2
    d=dists(index(1),index(2));
    r1=dists(index(1),index(1));
    r2=dists(index(2),index(2));
    x(2)=0;
    x(1)=0;
    y(2)=d;
    y(1)=0;

    figure;
    title([labels{1} ' &' labels{2}]);
    
    set(gcf,'color','w');
    drawCircle(x(1),y(1),r1,'r');
    drawCircle(x(2),y(2),r2,'b');
    
    if length(index)==3
        r3=dists(index(3),index(3));
        d13=dists(index(1),index(3));
        d23=dists(index(2),index(3));
        z(2)=(d13^2+d^2-d23^2)/(2*d);
        z(1)=sqrt(d13^2-z(2)^2);
        drawCircle(z(1),z(2),r3,'g');
        text(z(1),z(2),labels(3),'Color',[.8,.2,.2],'FontSize',10);
        scatter(z(1),z(2),'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75])
        title([labels{1} ' &' labels{2} '&' labels{3}]);
    end
end 
    scatter(x,y,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75])

    text(x,y,labels(1:2),'Color',[.8,.2,.2],'FontSize',10);

end

