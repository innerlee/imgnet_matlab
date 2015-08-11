testdata=cell2mat(data_features');
labelcell=cellfun(@(x) zeros(size(x,1),1),data_features,'UniformOutput',false);
for i=1:length(labelcell)
    labelcell{i}=double(labelcell{i}+i);
end
labels=cell2mat(labelcell');

% SPECTF = csvread('SPECTF.train'); % read a csv file
% labels = SPECTF(:, 1); % labels from the 1st column
% features = SPECTF(:, 2:end); 
features_sparse = sparse(testdata); % features must be in a sparse matrix
libsvmwrite('data/svm.train', labels, features_sparse);