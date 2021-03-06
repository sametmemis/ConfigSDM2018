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
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% at=rand(5,4,3);
% [s,dm,op]=E15(at);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=E15(at)
%% Step 1
[m,n,t]=size(at);
%% Step 2
    for i=1:m
        for j=1:n
            for k=1:t
                p=n*(k-1)+j;
                b(i,p)=at(i,j,k);
            end
        end
    end
%% Step 3
c=zeros(m-1,j);
    for i=2:m
        for j=1:n
            for k=1:t
                p=n*(k-1)+j;
                c(i-1,j)=c(i-1,j)+b(1,p)*b(i,p);
            end
        end
    end
%% Step 4
    for i=1:m-1
        s(i,1)=sum(c(i,:));
    end
%% Step 5
dm(:,1)=normalise(s);
count=1;
    for i=1:m-1
         if(s(i)==max(s))
            op(count)=i;
            count=count+1;
         end
    end
end

function na=normalise(a)
[m,n]=size(a);
    if m==1 || n==1
        if max(a)~=min(a)
            na=(a-min(a))/(max(a)-min(a));
        else
            na=ones(m,n);
        end
    end
end                                                                                                                                                                  