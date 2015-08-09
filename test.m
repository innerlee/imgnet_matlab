%clear newdata;

if exist('newdata','var')
    say 'using existed data. related variables: features, wnids, imgfiles.'
else
    say 'load data...'
    tic
    [ features, wnids, imgfiles ]=LoadFeatures();
    newdata=true;
    toc
    say 'load finished.'
end

issort=true;

[ centers,  dist2centers, dist2classes, grids, ind ] = GeneralAnalysis( features, issort );

if issort
    wnids=wnids(ind);
    imgfiles=imgfiles(ind);
end