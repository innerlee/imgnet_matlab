
[treeVec,labelset,nodeids]=LoadTree();
%labelno=arrayfun(@num2str,(1:length(treeVec)), 'UniformOutput' ,false)';
labelno=cellfun(@(t) strrep([' '  num2str(id2no(t,wnids)) ' '],'  ',' '),nodeids, 'UniformOutput' ,false);
labelset=strcat(labelset, labelno, {' '});

figure;
treeplot(treeVec);
count = size(treeVec,2);
[x,y,h,s] = treelayout(treeVec);
x = x';
y = y';
name1 = cellstr(num2str((1:count)'));
text(x(:,1), y(:,1), labelset, 'VerticalAlignment','middle','HorizontalAlignment','right','rotation',36,'Color',[.1 .1 .1],'FontSize',8)
axis off
set(gcf,'color','w');
set(gca,'position',[0.01,0.05,.98,.9]);
title('tree of synsets');
