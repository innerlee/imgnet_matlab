file='D:\imagenet_features_1024_dims\imagenet_100k_aug_12_out.h5';

h5info(file);

h5center=h5read(file,'/center')';
h5label=double(h5read(file,'/label'));

orilabel=trainlabel(1:100000);

ccc=sum((orilabel-h5label)==0);

clusterlabels{size(h5center,1)}=[];

for c=1:size(h5center,1)
    clusterindex=h5label==(c-1);
    clusterlabels{c}=orilabel(clusterindex);

end

ratios(size(h5center,1))=0;

for i=1:100
    figure;
    h=histogram(clusterlabels{i},100,'Normalization', 'probability');
    ratios(i)=max(h.Values);
end

figure;
histogram(ratios);

clusternums=cellfun(@(x) size(x,1),clusterlabels);

figure;
plot(clusternums);

%predata=h5read('data/0813164809-features.h5','/features')';