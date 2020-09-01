clc,clear,close all;
a = -pi;
b = pi;
p= (b-a).*rand(10,1) + a;
p(:,2)=sin(p(:,1));              % fitness function
p=sortrows(p,-2);                 % arrange rows in accordance to the fitness in descending order
gbest=[p(1,1)];
fvg=sin(gbest);
pbest=[p(:,1)];
fvp=sin(pbest);
alpha=0.8;
count=0;
c1=2;
c2=2;
v=ones(10,1);
while count<=50
    for j=1:10
       if p(j,1)<=a|p(j,1)>=b
           p(j,1)=pbest(j,1);
       end
       if fvg<=p(1,2)
        gbest=p(1,1);
        fvg=sin(gbest);
       end
       if fvp(j,1)<=p(j,2)
           pbest(j,1)=p(j,2);
           fvp(j,1)=sin(pbest(j,1));
       end
    end
    v=alpha*v+c1*rand*(pbest-p(:,1))+c2*rand*(gbest-p(1,1));
    p(:,1)=p(:,1)+v;
    p(:,2)=sin(p(:,1));
    p=sortrows(p,-2);
    count=count+1;
end
disp('optimal solution is ')
gbest