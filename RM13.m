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
% % a, b, and c are the fpfs-matrices
% % Product can be selected as 'AND' or 'OR'
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,4);
% b=rand(5,4);
% c=rand(5,4);
% [s,dm,op]=RM13(a,b,c,'AND');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s,dm,op]=RM13(a,b,c,Product)
if size(a)==size(b) & size(b)==size(c)
%% Step 1
[m,n]=size(a);
%% Step 2
    for i=2:m
        for j=1:n
            a1(i-1,j)=a(1,j)*a(i,j);
            b1(i-1,j)=b(1,j)*b(i,j);
            c1(i-1,j)=c(1,j)*c(i,j);
        end
    end
%% Step 3
    for i=1:m-1
        for j=1:n
            for k=1:n
                p=n*(j-1)+k;
                if Product=="AND"
                    d(i,p)=min(a1(i,j),b1(i,k));
                elseif Product=="OR"
                    d(i,p)=max(a1(i,j),b1(i,k));
                end
            end
        end
    end
%% Step 4
Ik=0;
    for k=1:n
        j=1;
        Ik(k,j)=0;
        for p=n*(k-1)+1:k*n      
            for i=1:m-1               
                if(d(i,p)~=0)
                    Ik(k,j)=p;
                    j=j+1;
                    break;
                end
            end            
        end
    end

    for i=1:m-1 
        for k=1:n  
            if(sum(Ik(k,:))~=0)
                tempIk=Ik(k,:);
                Ik1=tempIk(tempIk~=0);                    
                x(i,k)=min(d(i,Ik1));
            else
                x(i,k)=0;    
            end
        end 
    end
%% Step 5
    for i=1:m-1
        for k=1:n
            for t=1:n
                r=n*(k-1)+t;
                e(i,r)=min(x(i,k),c1(i,t));
            end
        end
    end
%% Step 6
It=0;
    for t=1:n
    j=1;
    It(t,j)=0;
        for r=n*(t-1)+1:t*n       
            for i=1:m-1              
                if(e(i,r)~=0)
                    It(t,j)=r;
                    j=j+1;
                    break;
                end
            end            
        end
    end

    for i=1:m-1 
        for t=1:n  
            if(sum(It(t,:))~=0)
                tempIt=It(t,:);
                It1=tempIt(tempIt~=0);                    
                y(i,t)=min(e(i,It1));
            else
                y(i,t)=0;    
            end
        end 
    end
%% Step 7
    for i=1:m-1
       s(i,1)=max(y(i,:)); 
    end
%% Step 8
dm(:,1)=normalise(s);
count=1;
    for i=1:m-1
         if(s(i)==max(s))
            op(count)=i;
            count=count+1;
         end
    end
else
    error('Row and column numbers of the matrices must be the same.');     
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