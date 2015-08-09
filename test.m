if exist('dataloaded','var') && dataloaded
    say 'using existed data. related variables: features, wnids, imgfiles.'
else
    say 'load data...'
    tic
    [ features, wnids, imgfiles ]=LoadFeatures(5);
    dataloaded=true;
    toc
    say 'load finished.'
end

[ centers,  dist2centers, dist2classes, grid ] = GeneralAnalysis( features );

