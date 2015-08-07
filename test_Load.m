clear all;
fprintf('load data...\n');
tic
f=LoadFeatures();
toc
fprintf('load finished.\n')
data={f.data};

centers=cell2mat(cellfun(@mean,data,'UniformOutput', false)');
tic
mean_dist2centers=cellfun(@(x) sum(var(x,1)),data);
toc

figure;
histogram(mean_dist2centers);
title('mean dist square to centers');

dist_betweenclasses=pdist(centers);
figure;
histogram(dist_betweenclasses);
title('dist between classes');
