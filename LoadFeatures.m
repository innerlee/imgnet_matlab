function [ features ] = LoadFeatures( path )
%LoadFeatures Load imagenet fetures from .txt files in a folder.
%
%  Inputs:
%   path: the folder contains a list of .txt files.
%     Filenames are wnids.
%     Each row is a vector of an image. 
%     Use space as delimators.
%
%  Returns:
%    features: a list of cells with properties
%       .name: wnid, ie, filenames.
%       .data: features vectors in rows. 
%       
% Author: lizz
% Date: 2015/08/07
%

featurelength=1000;
N=1200;
totsets=100;

features(totsets).wnids='';
features(totsets).data=[];
for i=1:totsets
    features(i).wnids=['test' int2str(i)];
    features(i).data=rand(N,featurelength);
end


end

