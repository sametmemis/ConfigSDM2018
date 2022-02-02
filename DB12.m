%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% Enginoğlu, S., Memiş, S., 2018. A Configuration of Some Soft Decision-Making  
% Algorithms via fpfs-matrices. Cumhuriyet Science Journal, 39(4), 871-881 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abbreviation of Journal Title: Cumhuriyet Sci. J.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://dergipark.org.tr/tr/download/article-file/605518
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.researchgate.net/profile/Serdar_Enginoglu2
% https://www.researchgate.net/profile/Samet_Memis2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Demo: 
% clc;
% clear all;
% % at are the fpfs-matrices
% % Product can be selected as 'AND' or 'OR'
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% at=rand(5,4,3);
% [s,dm,op]=DB12(at);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=DB12(at)
%% Step 1
[m,n,t]=size(at);
%% Step 2
    for i=1:m
        for j=1:n
            b(i,j)=sum(at(i,j,:))/t;
        end
    end
%% Step 3
[s,dm,op]=MBR01(b);
end