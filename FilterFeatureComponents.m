function [ newFeatures, featureComponents ] = FilterFeatureComponents( features, ratio )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

comp=cell2mat(cellfun(@(x) var(x,1),features,'UniformOutput', false)');
[~, c]=size(comp);
sumcomp=sum(comp);
[~,ind]=sort(sumcomp);
N=ceil(ratio*c);
newind=ind(1:N);
% newind=ind(N:c);
newFeatures=cellfun(@(x) x(:,newind), features,'UniformOutput', false);
featureComponents=comp(:,newind);

figure;
bar3(featureComponents);
title('feature details');

% [~, ind]=sort(comp,2);
% 
% [r, c]=size(comp);
% 
% N=ceiling(ratio*c);
% newind=(ind(:,1:N)-1)*r+repmat((1:r)',1,N);
% newFeatures=reshape(features(newind(:)),[r N]);

end

