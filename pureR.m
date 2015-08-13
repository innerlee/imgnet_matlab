%mean dist 2 centers = 25

r=25;
r2=r^2;

train_percent=1.2;

traindata=cell2mat((cellfun(@(x) x(1:(min(floor(size(x,1)*train_percent),size(x,1))),:),  data_features,'UniformOutput',false))');
labelcell=cellfun(@(x) zeros(size(x,1),1),data_features,'UniformOutput',false);
for i=1:length(labelcell)
    labelcell{i}=double(labelcell{i}+i);
end
trainlabel=cell2mat((cellfun(@(x) x(1:(min(floor(size(x,1)*train_percent),size(x,1))),:),  labelcell,'UniformOutput',false))');

N=length(traindata);

%gdata=gpuArray(traindata);
fprintf(['loading data to gpu: ' '']);


seed(1)=randi(N);

%gpoint=gdata(seed(1),:);
%gsubtract = bsxfun(@minus,gdata,gpoint);
%gdist=sum(gsubtract.^2,2);
%gnum=sum(gdist<r2);
%dist2seed=sqrt(gather(gdist));
%num=gather(gnum);
subs=bsxfun(@minus,traindata,traindata(seed(1),:));

%subs=bsxfun(@minus,traindata,centers(5,:));
dists=sum(subs.^2,2);
num=sum(dists<r2);
dist2seed=sqrt(dists);
figure;
histogram(dist2seed);
[s, inds]=sort(dist2seed);
s(1:10)
trainlabel(inds(1:10))

slabel=trainlabel(inds);
cu=cumsum(slabel==slabel(1))./((1:length(slabel))');
figure;
plot(cu(1:100))
