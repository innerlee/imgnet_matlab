train_percent=0.64;

%bars=cellfun(@(x) ceil(size(x,1)*train_percent),data_features);
%lens=cellfun(@(x) size(x,1),data_features);

%permdata=cellfun
traindata=cell2mat((cellfun(@(x) x(1:floor(size(x,1)*train_percent),:),  data_features,'UniformOutput',false))');
testdata=cell2mat((cellfun(@(x) x(min(floor(size(x,1)*train_percent)+1,size(x,1)):size(x,1),:),  data_features,'UniformOutput',false))');
labelcell=cellfun(@(x) zeros(size(x,1),1),data_features,'UniformOutput',false);
for i=1:length(labelcell)
    labelcell{i}=double(labelcell{i}+i);
end
%labels=cell2mat(labelcell');
trainlabel=cell2mat((cellfun(@(x) x(1:floor(size(x,1)*train_percent),:),  labelcell,'UniformOutput',false))');
testabel=cell2mat((cellfun(@(x) x(min(floor(size(x,1)*train_percent)+1,size(x,1)):size(x,1),:),  labelcell,'UniformOutput',false))');

model = svmtrain(trainlabel, traindata);

[predicted_label, accuracy, decision_values] = svmpredict(testabel, testdata, model);

%save('data/test.mat','predicted_label', 'accuracy', 'decision_values')
