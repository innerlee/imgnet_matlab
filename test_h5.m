folder='D:\imagenet_features_1024_dims\seed-out\';
all_files=dir(folder);
all_names={all_files.name};
all_bits=[all_files.isdir];
seed_outs=all_names(all_bits==0);


for i=1:length(seed_outs)
    file=seed_outs{i};
    if endswith(file,'.h5')
    	h5analysis(folder,file,data_features);
    end
end