clusterno=3;

rootpath='D:\imgnetimg\batch1\';
N=length(data_wnids);
idcell{N}=[];
for i=1:N
    idcell{i}=repmat(data_wnids{i},size(data_features{i},1),1);
end
idstrings=cellstr(cell2mat(idcell'));

rotimg=cellfun(@(x) x',data_imgfiles,'UniformOutput',false);
imgstrings=[rotimg{:}]';

paths=strcat(rootpath,idstrings, '\', imgstrings);

tempindex=clusterimgindex{clusterno};%(randperm(length(clusterimgindex{clusterno}),10,1));
for i=tempindex(1:min(10,length(tempindex)))
    %im=imread(paths(i));
    figure;
    imshow(paths{i});
end