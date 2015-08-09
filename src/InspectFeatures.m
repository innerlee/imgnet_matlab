function [  ] = InspectFeatures( features )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

fstd=cell2mat(cellfun(@(x) std(x,1),features,'UniformOutput', false)');
fmean=cell2mat(cellfun(@(x) mean(x),features,'UniformOutput', false)');

figure;
mat=[ fmean; fstd ];
bar3(mat);
fig = gcf;
ax = fig.CurrentAxes;
[w, h]=size(mat);
ax.XLim=[0 h+1];
ax.YLim=[0 w+1];
title('mean and std of each feature component');

end

