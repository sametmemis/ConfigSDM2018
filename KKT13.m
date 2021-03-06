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
% [s,dm,op]=KKT13(a);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=KKT13(a)
if size(a,1)==size(a,2)+1
%% Step 1
[m,n]=size(a);
%% Step 2
    for i=1:n
        b(i,1)=sum(a(i,:))/n;
    end
%% Step 3
    for i=1:n
       s(i,1)=a(1,i)*b(i,1);
    end
%% Step 4
dm(:,1)=normalise(s);
count=1;
    for i=1:n
         if(s(i)==max(s))
            op(count)=i;
            count=count+1;
         end
    end
else
    error('Except for the first row, row and column numbers of the matrix must be the same.'); 
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