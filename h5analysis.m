function []= h5analysis(folder,file,data_features)

%file='D:\imagenet_features_1024_dims\imagenet_100k_aug_12_out.h5';
if isempty(file) || isempty(folder)
    file='D:\imagenet_features_1024_dims\rand-out\imagenet_100k_aug_14_out.rand.2.100.h5';
end

h5center=h5read([folder file],'/center')';
h5label=double(h5read([folder file],'/label'));
% number of imgs
Nh5=size(h5label,1);
% number of centers
Mh5=size(h5center,1);

labelcell=cellfun(@(x) zeros(size(x,1),1),data_features,'UniformOutput',false);
for i=1:length(labelcell)
    labelcell{i}=double(labelcell{i}+i);
end
trainlabel=cell2mat(labelcell');
orilabel=trainlabel(1:Nh5);

clusterlabels{Mh5}=[];
clusterimgindex{Mh5}=[];
tempindex=1:Nh5;

for c=1:Mh5
    clusterindex=h5label==(c-1);
    clusterlabels{c}=orilabel(clusterindex);
    clusterimgindex{c}=tempindex(clusterindex);
end

ratios(Mh5)=0;

for i=1:Mh5
    ratios(i)=sum(clusterlabels{i}==mode(clusterlabels{i}))/size(clusterlabels{i},1);
end

figure;
histogram(ratios,[0:.1:1],'Normalization', 'probability');
title([int2str(Mh5) ' seeds']);
print([folder file '.1.png'],'-dpng')
%savefig();

figure;
clusternums=cellfun(@(x) size(x,1),clusterlabels);
uniqueclusternums=unique(clusternums);
histogram(clusternums,size(uniqueclusternums,2));
title([int2str(Mh5) ' seeds']);
print([folder file '.2.png'],'-dpng')

figure;
aa=sort(ratios,'descend');
plot(aa);
title([int2str(Mh5) ' seeds']);
print([folder file '.3.png'],'-dpng')
%savefig([folder file '.2.fig']);
%histogram(clusternums(clusternums>0),individual(clusternums));
%predata=h5read('data/0813164809-features.h5','/features')';


% dist2centers_kmeans(Mh5)=0;
% for i=1:Mh5
%     clusterindex0=h5label==i-1;
%     testdata=cell2mat(data_features');
%     pts0=testdata(clusterindex0,:);
% 
%     dist2centers_kmeans(i)=sqrt(sum(var(pts0,1)));
% end

end