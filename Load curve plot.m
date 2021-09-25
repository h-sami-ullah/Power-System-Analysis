[t1 t2 P]=textread('load1.txt');
n=max(size(t1));
b=1;
for a=1:n
    
    x(b)=t1(a);
    y(b)=P(a)
    b=b+1;
    y(b)=P(a)
    x(b)=t2(a);
b=b+1;
end
plot(x,y);
grid on
xlabel('time');
ylabel('p(kw)');
title('Load Curve');
