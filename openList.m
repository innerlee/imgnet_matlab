openlist=[27 33 62];


for i=1:length(openlist)
    openByNo(openlist(i),wnids)
end

if length(openlist)<=4
    triangle(openlist , sqrt(grids+diag(dist2centers)) ,labels(openlist));
end