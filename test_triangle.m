trilist= [];

if isempty(trilist)
    trilist=randi(size(grids,1),1,3);
end

triangle(trilist , sqrt(grids+diag(dist2centers)) ,labels(trilist));
