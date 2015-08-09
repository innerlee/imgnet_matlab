function [ features, wnids, imgfiles  ] = LoadFeatures_Mock( )
%LoadFeatures Load imagenet fetures from .txt files in a folder.
%
%  Inputs:
%   path: the folder contains a list of .txt files.
%     Filenames are wnids.
%     Each row is a vector of an image. 
%     Use space as delimators.
%
%  Returns:
%    features: a list of cells with feature matrices, one cell for a wnid
%    wnids: list of filenames
%    imgfiles: list of cells contains img filename for each feature vector
%       
% Author: lizz
% Date: 2015/08/07
%

featurelength=2;
N=1200;
totsets=3;
r1=2;
r2=3;
r3=4;

features{totsets}=0;
wnids{totsets}=0;
imgfiles=[];

[X,Y] = pol2cart(2*pi*rand(N,1), r1+ (rand(N,1)-.5));

wnids{1}='(0, 0)';
features{1}=[X,Y] ;

wnids{2}='(4, 0)';
features{2}=r2 * (rand(N,featurelength)-.5) + repmat([4 0],N,1);

wnids{3}='(4, 3)';
features{3}=r3 * (rand(N,featurelength)-.5) + repmat([4 3],N,1);


end

