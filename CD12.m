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
% % p is a positive integer.
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% at=rand(5,4,3);
% [s,dm,op]=CD12(at,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=CD12(at,p)
%% Step 1
[m,n,t]=size(at);
%% Step 2
    for j=1:n
        b(1,j)=(sum(at(1,j,:).^p)/t)^(1/p);
    end
    for i=2:m
        for j=1:n
            b(i,j)=min(at(i,j,:));
        end
    end
%% Step 3
[s,dm,op]=CCE10(b);
end