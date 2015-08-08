if exist('dataloaded','var') && dataloaded
    fprintf('using existed data. related variables: features, wnids, imgfiles.\n');
else
    fprintf('load data...\n');
    tic
    [ features, wnids, imgfiles ]=LoadFeatures();
    dataloaded=true;
    toc
    fprintf('load finished.\n')
end

centers=cell2mat(cellfun(@mean,features,'UniformOutput', false)');
tic
mean_dist2centers=cellfun(@(x) sum(var(x,1)),features);
toc

figure;
histogram(mean_dist2centers);
title('mean dist square to centers');

dist_betweenclasses=pdist(centers);
figure;
histogram(dist_betweenclasses);
title('dist between classes');

figure;
grid=squareform(dist_betweenclasses)+diag(mean_dist2centers);
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
bar(mean_dist2centers);
fig = gcf;
ax = fig.CurrentAxes;
ax.XLim=[0 w+1];
title('mean dist square to centers');


