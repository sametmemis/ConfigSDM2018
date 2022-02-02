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
% % a and b are two fpfs-matrices
% % Product can be selected as 'AND' or 'OR'
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,3);
% b=rand(5,4);
% [s,dm,op]=CE10(a,b,'AND');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=CE10(a,b,Product)
if size(a,1)==size(b,1)
%% Step 1
[m,n1]=size(a);
[~,n2]=size(b);
%% Step 2
i=1;
Ia=0;
    for j=1:n1
        if(a(1,j)~=0)
            Ia(i)=j;
            i=i+1;
        end
    end
k=1;    
Ib=0;
    for j=1:n2
         if(b(1,j)~=0)
            Ib(k)=j;
            k=k+1; 
        end 
    end

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
    for i=2:m
        jj=1;
        temp2=[];
        if(sum(Ia)~=0 & sum(Ib)~=0)    
            for j=1:size(Ia,2)
                ii=1;
                temp1=[];
                    for k=1:size(Ib,2)
                        p=n2*(Ia(j)-1)+Ib(k);
                        temp1(ii)=c(1,p)*c(i,p);
                        ii=ii+1;
                    end
                        temp2(jj)=min(temp1);
                        jj=jj+1;
            end
            maxjmink(i-1)=max(temp2);
        else
            maxjmink(i-1)=0;
        end
    end

    for i=2:m
        jj=1;
        temp2=[];
        if(sum(Ia)~=0 & sum(Ib)~=0)     
            for k=1:size(Ib,2)
                ii=1;
                temp1=[];
                    for j=1:size(Ia,2)
                        p=n2*(Ia(j)-1)+Ib(k);
                        temp1(ii)=c(1,p)*c(i,p);
                        ii=ii+1;
                    end
                        temp2(jj)=min(temp1);
                        jj=jj+1;
            end
                maxkminj(i-1)=max(temp2);
        else
                maxkminj(i-1)=0;
        end  
    end
    
    for i=1:m-1
        s(i,1)=max(maxjmink(i),maxkminj(i));
    end
    for i=1:m-1
        if max(s)~=0
            dm(i,1)=(s(i,1))/max(s);
        else
            dm(i,1)=1;
        end
    end   
%% Step 4     
count=1;
    for i=1:m-1
         if(dm(i)==max(dm))
            op(count)=i;
            count=count+1;
         end
    end
else
    error('Row numbers of the matrices must be the same.');    
end
end