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

flen=1000;
N=10000;
tot=50;

features(tot).wnids='';
features(tot).data=[];
for i=1:tot
    features(i).wnids=['test' int2str(i)];
    features(i).data=rand(N,flen);
end


end

