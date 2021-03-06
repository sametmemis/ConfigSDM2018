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
% % a is an fpfs-matrices
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,4);
% [s,dm,op]=EK15(a);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=EK15(a)
%% Step 1
[m,n,t]=size(a);
%% Step 2
    for i=1:t
        b(i,:)=a(1,:,i);
    end
%% Step 3
    for i=1:t
        for j=1:n
            c(i,j)=b(i,j)/sqrt(sum(b(:,j).*b(:,j)));
        end
    end
%% Step 4
    for i=1:n
        d(i,1)=sum(c(:,i))/t;
    end
%% Step 5
    for i=1:n
        e(i,1)=d(i,1)/sum(d(:,1));
    end
%% Step 6
    for i=2:m
        for j=1:n
           f(i-1,j)=mean(a(i,j,:));
        end
    end
%% Step 7
    for i=1:m-1
        for j=1:n
           g(i,j)=e(j,1)*f(i,j);
        end
    end
%% Step 8
    for j=1:n
        gp(1,j)=max(g(:,j));
        gm(1,j)=min(g(:,j));
    end
%% Step 9
    for i=1:m-1
        sp(i,1)=sqrt(sum((g(i,:)-gp(1,:)).*(g(i,:)-gp(1,:))));
        sm(i,1)=sqrt(sum((g(i,:)-gm(1,:)).*(g(i,:)-gm(1,:))));
    end
%% Step 10
    for i=1:m-1
       s(i,1)=sm(i,1)/(sp(i,1)+sm(i,1));
    end
%% Step 11
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