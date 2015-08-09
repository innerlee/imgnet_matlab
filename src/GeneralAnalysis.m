function [ centers,  dist2centers, dist2classes, grids, ind ] = GeneralAnalysis( features, issort )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


centers=cell2mat(cellfun(@mean,features,'UniformOutput', false)');

say2 'compute dist to centers'
tic
dist2centers=cellfun(@(x) sum(var(x,1)),features);
toc

if nargin ==2 && issort
    [dist2centers, ind]=sort(dist2centers);
    centers=centers(ind,:);
else
    ind=1:length(dist2centers);
end

dist2classes=pdist(centers).^2;
grids=squareform(dist2classes);%+diag(dist2centers);

say2 'drawing...'

if ~issort
    figure;
    bar(dist2centers);
    fig = gcf;
    ax = fig.CurrentAxes;
    ax.XLim=[0 length(dist2centers)+1];
    title('mean dist square to centers');
end

%%
figure;
b=bar3(grids);
hold on;
c=bar3(diag(dist2centers));

for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
    %b(k).FaceAlpha=.5;
end
for k = 1:length(c)
    c(k).FaceColor = 'yellow';
end

fig = gcf;
ax = fig.CurrentAxes;
[w, h]=size(grids);
ax.XLim=[0 w+1];
ax.YLim=[0 h+1];
title('distance squares');

%%
figure;
dist=max(dist2centers);
grid2=grids;
grid2(grids<dist)=0;
c=bar3(diag(dist2centers));
hold on;
b=bar3(grid2);

for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
for k = 1:length(c)
    if max(c(k).ZData(:))>0
        c(k).FaceColor = 'yellow';
    end
end

fig = gcf;
ax = fig.CurrentAxes;
[w, h]=size(grids);
ax.XLim=[0 w+1];
ax.YLim=[0 h+1];
title('distance squares larger than max local radius');

%%
figure;
h=histogram(dist2centers,'Normalization', 'probability');
h.FaceAlpha = 0.5;
hold on;
h=histogram(dist2classes,'Normalization', 'probability');
h.FaceAlpha = 0.5;
legend('dist to centers', 'dist between classes');
title('statistics of distances');

[sdc1, i1]=sort(dist2centers);
[sdc2, i2]=sort(dist2classes);

%%
figure;
hold on;
bar((1:length(i1))/length(i1),sdc1,'r');
bar((1:length(i2))/length(i2),sdc2,'black');
legend('dist to centers', 'dist between classes');
title('list of distances');
ylabel('distances');
xlim([0,1.01]);
plot((1:length(i1))/length(i1),sdc1,'r');
grid on;

end

