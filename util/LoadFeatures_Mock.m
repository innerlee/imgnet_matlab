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

featurelength=1000;
N=1200;
totsets=100;

features{totsets}=0;
wnids{totsets}=0;
imgfiles=[];

for i=1:totsets
    wnids{i}=['test' int2str(i)];
    features{i}=randi([1,3])* rand(N,featurelength);
end


end

