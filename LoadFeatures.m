function [ features, wnids, imgfiles ] = LoadFeatures( maxnum )
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

if nargin==0
    maxnum=inf;
end

path='D:\imagenet_features_1024_dims\imagenet_features\';

all_files=dir(path);
all_names={all_files.name};
all_bits=[all_files.isdir];
wnids=all_names(all_bits==0);

N=min(maxnum, length(wnids));

features{N}=0;
imgfiles{N}=0;

for i=1:N
	[ fet, img ] = LoadFeatureFromFile( [path wnids{i}] );
    features{i}=fet;
    imgfiles(i)=img;
    fprintf([int2str(i) ': loading ' wnids{i} '\n']);
%     fileID = fopen([path wnids{i}]);
%     data{i} = textscan(fileID,['%s' repmat(' %f', 1,1024)]);
%     fclose(fileID);
%     features{i}=cell2mat(data{i}(2:end));
%     imgfiles(i)=data{i}(1);
%     
%     fprintf([int2str(i) ': loading ' wnids{i} '\n']);
end



end

