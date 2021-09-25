function[bus,volt]=Gausssiedal(itr)
busdata=textread('busdata.txt');
A=textread('linedata.txt');
y_bus=ybus(A);
bus(:,1)=complex(busdata(:,1),busdata(:,2));
bus(:,2)=complex(busdata(:,3)-busdata(:,4),-(busdata(:,5)-busdata(:,6)));
nbus=max(size(bus));
volt=zeros(nbus,1);
 for p=1:itr-1
  volt=helper;
end
helper
 function [volt]=helper
 nbus=max(size(bus));
for i=2:nbus
    sum=0;
for j=1:nbus
if(i~=j)
    sum=sum+y_bus(i,j)*bus(j,1);
end
vnew(i,1)=((bus(i,2)/(bus(i,1))')-sum)/y_bus(i,i);
end
    volt(i,1)=vnew(i,1)
    bus(i,1)=volt(i,1);
  
end
end
end
 
function y_bus=ybus(A)
A=textread('linedata.txt');
n=max(max(A(:,1)),max(A(:,2)));
y_bus=zeros(n,n);
R=A(:,3);
X=A(:,4);
z=R+j*X;
y=1./z;
nbr=max(size(A(:,1)));
for b=1:n
    for a=1:nbr
        if(A(a,1)==b|A(a,2)==b)
            y_bus(b,b)=y_bus(b,b)+y(a,1);
        end
    end
end
for a=1:nbr
    if(A(a,1)~=0&A(a,2)~=0)
        y_bus(A(a,1),A(a,2))=y_bus(A(a,1),A(a,2))-y(a,1);
         y_bus(A(a,2),A(a,1))=y_bus(A(a,2),A(a,1))-y(a,1);
    end
end
end
