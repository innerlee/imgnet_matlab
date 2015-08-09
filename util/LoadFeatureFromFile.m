function [ features, imgfiles ] = LoadFeatureFromFile( file )
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

fileID = fopen(file);
data = textscan(fileID,['%s' repmat(' %f', 1,1024)]);
fclose(fileID);
features=cell2mat(data(2:end));
imgfiles=data(1);

end

