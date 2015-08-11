function [  ] = triangle( index, dists, labels )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% 

N=length(index);
cc= distinguishable_colors(8);
colors{1}=cc(5,:);
colors{2}=cc(6,:);
colors{3}=cc(7,:);
colors{4}=cc(8,:);
d=dists(index,index);
r=diag(d);

lab1=arrayfun(@num2str,r, 'UniformOutput' ,false)';
labelsr=strcat(labels(1:N), {', r='}, lab1);

figure;
axis equal
noaxis;
hold on;
x=[];
y=[];
z=[];

switch N
   case 1
       x(1)=0;
       y(1)=0;

       drawCircle(x,y,r(1),colors(1));
       scatter(x,y,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
       text(x,y,labelsr(1),'Color',[.8,.2,.2],'FontSize',10);
       title([labels{1}]);
   case 2
       x(1)=0;
       y(1)=0;
       x(2)=0;
       y(2)=d(1,2);

       drawCircle(x,y,r(1:2),colors(1:2));
       scatter(x,y,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
       text(x,y,labelsr(1:2),'Color',[.8,.2,.2],'FontSize',10);
       title([labels{1} ' &' labels{2}]);
   case 3
       x(1)=0;
       y(1)=0;
       x(2)=0;
       y(2)=d(1,2);
       y(3)=(d(1,3)^2+d(1,2)^2-d(2,3)^2)/(2*d(1,2));
       x(3)=sqrt(d(1,3)^2-y(3)^2);
       
       drawCircle(x,y,r(1:3),colors(1:3));
       scatter(x,y,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
       text(x,y,labelsr(1:3),'Color',[.8,.2,.2],'FontSize',10);
       title([labels{1} ' &' labels{2} ' &' labels{3}]);
    case 4
       x(1)=0;
       y(1)=0;
       z(1)=0;
       x(2)=0;
       y(2)=d(1,2);
       z(2)=0;
       y(3)=(d(1,3)^2+d(1,2)^2-d(2,3)^2)/(2*d(1,2));
       x(3)=sqrt(d(1,3)^2-y(3)^2);
       z(3)=0;
       
       y(4)=(d(1,4)^2+d(1,2)^2-d(2,4)^2)/(2*d(1,2));
       cc=x(3);
       cc1=sqrt(d(1,4)^2-y(4)^2);
       cc2=sqrt(d(3,4)^2-(y(3)-y(4))^2);
       x(4)=(cc1^2+cc^2-cc2^2)/(2*cc);
       z(4)=sqrt(d(1,4)^2-x(4)^2-y(4)^2);
       
       drawSphere(x,y,z,r(1:4),colors(1:4));
       scatter3(x,y,z,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
       text(x,y,z,labelsr(1:4),'Color',[.8,.2,.2],'FontSize',10);
       title([labels{1} ' &' labels{2} ' &' labels{3} ' &' labels{4}]);
       p=[1 2 3 4 1 3 2 4];
       line(x(p),y(p),z(p),'Color','r','LineWidth',1.6)
     
end


end

