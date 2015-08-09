
say 'load data...'
tic
[ features, wnids, imgfiles ]=LoadFeatures_Mock();
dataloaded=true;
toc
say 'load finished.'

[ centers,  dist2centers, dist2classes, grid ] = GeneralAnalysis( features );

figure;
hold on;
scatter(features{1}(:,1),features{1}(:,2));
scatter(features{2}(:,1),features{2}(:,2));
scatter(features{3}(:,1),features{3}(:,2));
scatter(centers(:,1),centers(:,2),'filled');
title('data visualization');

 