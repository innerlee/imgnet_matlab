function [ newFeatures, featureComponents ] = FilterFeatureComponents( features, ratio )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

method='variance'; % variance, std/mean
comp=cell2mat(cellfun(@(x) var(x,1),features,'UniformOutput', false)');

if strcmp(method,'variance')
    sumcomp=sum(comp);
    [~,ind]=sort(sumcomp);
elseif strcmp(method,'var/mean')
    fvar=cell2mat(cellfun(@(x) var(x,1),features,'UniformOutput', false)');
    fmean=cell2mat(cellfun(@(x) mean(x),features,'UniformOutput', false)');
    sumvar=sum(fvar);
    summean=sum(fmean);
    [~,ind]=sort(sumvar./summean);
end

c=length(ind);

N=ceil(ratio*c);
newind=ind(1:N);
% newind=ind(N:c);
newFeatures=cellfun(@(x) x(:,newind), features,'UniformOutput', false);
featureComponents=comp(:,newind);

% figure;
% bar3(featureComponents);
% title('feature details');

% [~, ind]=sort(comp,2);
% 
% [r, c]=size(comp);
% 
% N=ceiling(ratio*c);
% newind=(ind(:,1:N)-1)*r+repmat((1:r)',1,N);
% newFeatures=reshape(features(newind(:)),[r N]);

end

