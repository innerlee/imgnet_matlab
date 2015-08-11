function []= dimensionReduction(featureComponents, labels, no_dims, methods)

if nargin<4
    methods{1}='PCA';
elseif nargin<3
    no_dims=3;
end

X=featureComponents;

for i=1:length(methods)
    m=methods{i};
    if no_dims==2
        [mappedX, ~] = compute_mapping(X, m, 2);	
        figure;
        scatter(mappedX(:,1),mappedX(:,2),24,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
        noaxis
        title(m);
        text(mappedX(:,1),mappedX(:,2),labels,'Color',[.8,.2,.2],'FontSize',8);
    elseif no_dims==3
        [mappedX, ~] = compute_mapping(X, m, 3);	
        figure;
        scatter3(mappedX(:,1),mappedX(:,2),mappedX(:,3),24,'MarkerEdgeColor','k', 'MarkerFaceColor',[0 .75 .75]);
        noaxis
        title([m ' in 3D']);
        text(mappedX(:,1),mappedX(:,2),mappedX(:,3),labels,'Color',[.8,.2,.2],'FontSize',8);
    end
end

 