%clear newdata;

if exist('newdata','var')
    say 'using existed data. related variables: features, wnids, imgfiles.'
else
    say 'load data...'
    tic
    [ data_features, data_wnids, data_imgfiles ]=LoadFeatures();
    newdata=true;
    toc
    say 'load finished.'
end

issort=true;
% issort=false;

[ centers,  dist2centers, dist2classes, grids, ind ] = GeneralAnalysis( data_features, issort );

features=data_features(ind);
wnids=data_wnids(ind);
imgfiles=data_imgfiles(ind);

