function [ vec, labels, nodeids ] = LoadTree(  )
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

file='D:\imgnetimg\batch1\0810150732-tree.txt';
fileID = fopen(file);
data = textscan(fileID,'%d %d %s %s','Delimiter','\t');
fclose(fileID);
vec=double(data{2})';
labels=data{4};
nodeids=data{3};
end

