function [ centers,  dist2centers, dist2classes, grid ] = GeneralAnalysis( features )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


centers=cell2mat(cellfun(@mean,features,'UniformOutput', false)');

say2 'compute dist to centers'
tic
dist2centers=cellfun(@(x) sum(var(x,1)),features);
toc

dist2classes=pdist(centers).^2;
grid=squareform(dist2classes)+diag(dist2centers);

say 'drawing...'

figure;
bar(dist2centers);
fig = gcf;
ax = fig.CurrentAxes;
ax.XLim=[0 length(dist2centers)+1];
title('mean dist square to centers');

figure;
bar(dist2classes);
fig = gcf;
ax = fig.CurrentAxes;
ax.XLim=[0 length(dist2classes)+1];
title('dist between classes');

figure;
b=bar3(grid);
fig = gcf;
ax = fig.CurrentAxes;
[w, h]=size(grid);
ax.XLim=[0 w+1];
ax.YLim=[0 h+1];
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
title('distance squares');

figure;
h=histogram(dist2centers,'Normalization', 'probability');
h.FaceAlpha = 0.5;
hold on;
h=histogram(dist2classes,'Normalization', 'probability');
h.FaceAlpha = 0.5;
legend('dist to centers', 'dist between classes');
title('statistics of distances');

end

