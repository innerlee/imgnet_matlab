function [ dist ] = gSqrDist2Center( points )
%gDist2Center gpu computes squared distances of pts to the mass center.
% 
%   each row is a point
%

%tic
gpoints=gpuArray(points);
gmean=mean(points);
gsubtract = bsxfun(@minus,gpoints,gmean);
gdist=sum(gsubtract.^2,2);
dist=gather(gdist);
%toc
end

