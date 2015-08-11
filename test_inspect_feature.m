%clear newdata;

if exist('newdata','var')
    say 'using existed data. related variables: features, wnids, imgfiles.'
else
    say 'load data...'
    tic
    [ data_features, data_wnids, data_imgfiles, labeldic ]=LoadFeatures();
    newdata=true;
    toc
    say 'load finished.'
end

[data_features2, featureComponents ]=FilterFeatureComponents(data_features, 1);
InspectFeatures(data_features2)

issort=true;

[ centers,  dist2centers, dist2classes, grids, ind ] = SpecialAnalysis( data_features2, issort );

features=data_features2(ind);
wnids=data_wnids(ind);
imgfiles=data_imgfiles(ind);

labelno=arrayfun(@num2str,(1:size(featureComponents,1)), 'UniformOutput' ,false);
labelwords=cellfun(@(x) labeldic(x), wnids, 'UniformOutput' ,false);
labels=strcat({'  '}, labelno, {' '}, labelwords);
% available methods:
% *PCA, KernelPCA, MDS, NCA, Sammon, *Isomap, LLE, LTSA, tSNE, SymSNE, SNE,
% DiffusionMaps, HessianLLE, LandmarkIsomap
no_dims=2;
methods={'LLE'}; 
dimensionReduction(featureComponents, labels, no_dims, methods)

no_dims=3;
methods={'LLE'}; 
dimensionReduction(featureComponents, labels, no_dims, methods)

test_tree

test_triangle