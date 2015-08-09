baseId=55;

tempgrid=triu(grids)+tril(grids);

[sims,simind]=sort(tempgrid(baseId,:));
openlist=[baseId simind(2:6)];

say2(['5 wnids similar to ' int2str(baseId) ', i.e. ' wnids{baseId}]);
for i=2:length(openlist)
    say([int2str(openlist(i)) ': ' wnids{openlist(i)}]);
end

for i=length(openlist):-1:1
    openByNo(openlist(i),wnids)
end