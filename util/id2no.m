function [ no ] = id2no( wnid, wnids )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

no=find(ismember(wnids, wnid));

end

