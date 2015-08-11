
[treeVec,labelset,nodeids]=LoadTree();
%labelno=arrayfun(@num2str,(1:length(treeVec)), 'UniformOutput' ,false)';
labelno=cellfun(@(t) strrep([' '  num2str(id2no(t,wnids)) ' '],'  ',' '),nodeids, 'UniformOutput' ,false);
labelset=strcat(labelset, labelno, {' '});

figure;
treeplot(treeVec);
count = size(treeVec,2);
[x,y] = treelayout(treeVec);
x = x';
y = y';
name1 = cellstr(num2str((1:count)'));
rot=(y-min(y))/(max(y)-min(y));
ang=40*(1-rot);
for i=1:length(rot)
    text(x(i,1), y(i,1), labelset(i), 'VerticalAlignment','middle','HorizontalAlignment','right','rotation',ang(i),'Color',[.1 .1 .1],'FontSize',8)
end
noaxis
title('tree of synsets');
