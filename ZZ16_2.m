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
% % a and b are the fpfs-matrices
% % r is a real number in [0,1]
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,4);
% b=rand(5,4);
% [s,dm,op]=ZZ16_2(a,b,0.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=ZZ16_2(a,b,r)
if size(a)==size(b)
%% Step 1
[m,n]=size(a);
%% Step 2
    for j=1:n
        c(1,j)=(a(1,j)+b(1,j))/(1+a(1,j)*b(1,j));
    end
    for i=2:m
        for j=1:n
            c(i,j)=max(a(i,j),b(i,j));
        end
    end
%% Step 3
    for j=1:n
        d(1,j)=c(1,j);
    end
    for i=2:m
        for j=1:n
            if c(i,j)>=r
                d(i,j)=c(i,j);
            else
                d(i,j)=0;
            end
        end
    end
%% Step 4   
[s,dm,op]=CCE10(d);
end