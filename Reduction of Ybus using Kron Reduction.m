function [ ybus] = fun(q,p )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
z=length(q);
for j=1:z
    for k=1:z
ybus(j,k)=q(j,k)-(q(j,p)*q(p,k)/q(p,p));
    end
end
ybus(:,p)=[];
ybus(p,:)=[];
end
