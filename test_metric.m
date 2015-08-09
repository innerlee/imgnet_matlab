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

[data_features2, featureComponents ]=FilterFeatureComponents(data_features, 1);

issort=true;
% issort=false;

[ centers,  dist2centers, dist2classes, grids, ind ] = SpecialAnalysis( data_features2, issort );

features=data_features2(ind);
wnids=data_wnids(ind);
imgfiles=data_imgfiles(ind);

