trilist= [ ];

if isempty(trilist)
    trilist=randi(size(grids,1),1,4);
end

triangle(trilist , sqrt(grids+diag(dist2centers)) ,labels(trilist));
