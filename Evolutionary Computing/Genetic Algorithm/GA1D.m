clc,clear,close all;
size=10;
pop=randi([0,1],size,8);
pop(:,9)=bin2dec(num2str(pop(:,1:8))); % decimal value
pop(:,10)=((pop(:,9)./255)*2*pi)-pi;    % value of x between -pi to pi
pop(:,11)=sin(pop(:,10));              % fitness function
pop=sortrows(pop,-11);                 % arrange rows in accordance to the fitness in descending order
pc=0.8;
count=0;
fv=[2 2];
lp=0;
pop
while count<=200
    lp=lp+1;
    ip=randperm(ceil(pc*size),8);          % selection
    cop=randi([1,8],1,1);                  % crossover (for one child)
    i=1;
    for j=1:2:ceil(pc*size)
         pop(size+i,1:cop)=pop(ip(i),1:cop);
         pop(size+i,(cop+1):8)=pop(ip(i+1),(cop+1):8);
         i=i+1;
    end
    for i=11:1:14                           % mutation
        mp=randi([1,8],1,1);
        pop(i,mp)=not(pop(i,mp));
    end
    pop(:,9)=bin2dec(num2str(pop(:,1:8))); % decimal value
    pop(:,10)=((pop(:,9)./255)*2*pi)-pi;    % value of x between -pi to pi
    pop(:,11)=sin(pop(:,10));              %fitness function
    pop=sortrows(pop,-11);
    fv(2)=pop(1,11);
    efv=fv(2)-fv(1);
    if efv<=0.00001
        count=count+1;
    end
    pop(11:14,:)=[];
end
x=pop(1,10)