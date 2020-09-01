clc,clear,close all
func=@(fx,fy)(0.5+(((sin(sqrt(fx.^2+fy.^2))).^2-0.5)./(1+0.001*(fx.^2+fy.^2)).^2));
% func=@(fx,fy)((fx-1).^2+(fy-2).^2);
x=[];
count=0;
%n=input('enter the number of vectors(take in order of 10k)');
n=10000;
v=randi([0, 100], [n,2])/10
for i=1:n
    v(i,3)=func(v(i,1),v(i,2));
end
x=[x v(1,3)];
for gen=1:100000
i=randperm(n,3);
targvect=v(1,1:2);
rndvect1=v(i(1),1:2);
rndvect2=v(i(2),1:2);
mutavect=v(i(3),1:2);
% mutation
diffvect=rndvect1-rndvect2;
wedfvect=rand*diffvect;
noisvect=wedfvect+mutavect;
%crossover
triavect=[ targvect(1) noisvect(2)];
%selection
val1=func(targvect(1),targvect(2));
val2=func(triavect(1),triavect(2));
if val1 > val2
    v(1,1)=triavect(1);
    v(1,2)=triavect(2);
    v(1,3)=val2;
end
x=[x v(1,3)];
if x(gen+1)== x(gen)
    count=count+1;
else 
    count=0;
end
if count > 20000
    break
end
end
v=sortrows(v,3);
sol=v(1,:)
plot(1:(gen+1),x)