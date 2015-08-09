baseId=97;

tempgrid=triu(grids)+tril(grids);

[sims,simind]=sort(tempgrid(baseId,:));
i=length(simind);
openlist=[baseId i-5:i];

say2(['5 wnids NOT similar to ' int2str(baseId) ', i.e. ' wnids{baseId}]);
for i=2:length(openlist)
    say([int2str(openlist(i)) ': ' wnids{openlist(i)}]);
end

for i=length(openlist):-1:1
    openByNo(openlist(i),wnids)
end