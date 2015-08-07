clear all;
f=LoadFeatures();

data={f.data};

dmean=cellfun(@mean,data,'UniformOutput', false);
tic
dvar=cellfun(@(x) sum(var(x,1)),data);
toc
