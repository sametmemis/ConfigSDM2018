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
% % Product can be selected as 'AND' or 'OR'
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,3);
% b=rand(5,4);
% [s,dm,op]=CE12(a,b,'AND');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=CE12(a,b,Product)
if size(a,1)==size(b,1)
%% Step 1
[m,n1]=size(a);
[~,n2]=size(b);
%% Step 2
    for i=1:m
        for j=1:n1
            for k=1:n2
                p=n2*(j-1)+k;
                if Product=="AND"
                    c(i,p)=min(a(i,j),b(i,k));
                elseif Product=="OR"
                    c(i,p)=max(a(i,j),b(i,k));   
                end
            end
        end
    end
%% Step 3
I=0;
    for k=1:n1
    j=1;
    I(k,j)=0;
        for p=n2*(k-1)+1:k*n2        
            for i=2:m               
                if(c(1,p)*c(i,p)~=0)
                    I(k,j)=p;
                    j=j+1;
                     break;
                end
            end            
        end
    end

    for i=2:m
        ii=1;
        temp1=0;  
            for k=1:n1
                if(sum(I(k,:))~=0)
                    tempIk=I(k,:);
                    Ik=tempIk(tempIk~=0);                    
                    temp1(ii)=min(c(1,Ik).*c(i,Ik));
                else
                    temp1(ii)=0;    
                end
                    ii=ii+1;
            end 
        s(i-1,1)=max(temp1);
    end
%% Step 4
dm(:,1)=normalise(s);
count=1;
    for i=1:m-1
         if(s(i)==max(s))
            op(count)=i;
            count=count+1;
         end
    end
else
    error('Row numbers of the matrices must be the same.');     
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