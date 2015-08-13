%file='D:\imagenet_features_1024_dims\imagenet_100k_aug_12_out.h5';
file='D:\imagenet_features_1024_dims\imagenet_100k_aug_13_out.1k.h5';

h5info(file);

h5center=h5read(file,'/center')';
h5label=double(h5read(file,'/label'));
Nh5=size(h5label,1);
Mh5=size(h5center,1);

labelcell=cellfun(@(x) zeros(size(x,1),1),data_features,'UniformOutput',false);
for i=1:length(labelcell)
    labelcell{i}=double(labelcell{i}+i);
end
trainlabel=cell2mat(labelcell');
%trainlabel=cell2mat((cellfun(@(x) x(1:(min(floor(size(x,1)*train_percent),size(x,1))),:),  labelcell,'UniformOutput',false))');
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
%     figure;
%     h=histogram(clusterlabels{i},100,'Normalization', 'probability');
%     ratios(i)=max(h.Values);
end

figure;
histogram(ratios,10,'Normalization', 'probability');

clusternums=cellfun(@(x) size(x,1),clusterlabels);

figure;
%plot(clusternums(2:end));
uniqueclusternums=unique(clusternums);
%countElA=histc(clusternums,uniqueclusternums);
histogram(clusternums(2:end),size(uniqueclusternums,2)-1);
%histogram(clusternums(clusternums>0),individual(clusternums));
%predata=h5read('data/0813164809-features.h5','/features')';