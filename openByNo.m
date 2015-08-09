function [ ] = openByNo( i, wnids )

imgpath='D:\imgnetimg\batch1\';
 
winopen([imgpath wnids{i}]);

%say(['opening ' wnids{i}]);
end