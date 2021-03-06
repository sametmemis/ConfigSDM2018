%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% Engino?lu, S., Memi?, S., 2018. A Configuration of Some Soft Decision-Making  
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
% % a is an fpfs-matrix
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,4); 
% [s,dm,op]=MBR01(a);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=MBR01(a) 
%% Step 1
[m,n]=size(a);
%% Step 2
b=zeros(m-1,m-1); 
    for i=2:m
        for k=2:m
            for j=1:n
                b(i-1,k-1)=b(i-1,k-1)+a(1,j)*ki(a,i,j,k); 
            end
        end
    end
%% Step 3
c=sum(b,2);
%% Step 4
d=sum(b,1);
%% Step 5
s(:,1)=c(:)-d(:);
%% Step 6
    for i=1:m-1
        if max(s)==0 && min(s)==0
            dm(i,1)=1;
        else    
            dm(i,1)=(s(i,1)+abs(min(s)))/((max(s)+abs(min(s))));
        end
    end
count=1;
    for i=1:m-1        
        if(dm(i,1)==max(dm))
            op(count)=i;
            count=count+1;
        end
    end

end

function ki_val=ki(a,i,j,k)
    if a(i,j)>=a(k,j)
        ki_val=1;
    else
        ki_val=0;
    end
end
