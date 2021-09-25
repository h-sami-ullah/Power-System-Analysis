A=textread('linedata.txt')
%where linedata.txt is
%1 0 0 0.5
%1 2 0 0.25
%2 0 0 0.166
%2 3 0 0.125
%3 0 0 0.10

n=max(max(A(:,1)),max(A(:,2)))
y_bus=zeros(n,n)
R=A(:,3)
X=A(:,4)
z=R+j*X
y=1./z
nbr=max(size(A(:,1)))
for b=1:n
    for a=1:nbr
        if(A(a,1)==b|A(a,2)==b)
            y_bus(b,b)=y_bus(b,b)+y(a,1)
        end
    end
end
for a=1:nbr
    if(A(a,1)~=0&A(a,2)~=0)
        y_bus(A(a,1),A(a,2))=y_bus(A(a,1),A(a,2))-y(a,1)
         y_bus(A(a,2),A(a,1))=y_bus(A(a,2),A(a,1))-y(a,1)
    end
end
