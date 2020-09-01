%minimisation problem
clc,clear,close all;
size=10;
pop1=randi([0,1],size,8);
pop2=randi([0,1],size,8);
pop1(:,9)=bin2dec(num2str(pop1(:,1:8))); % decimal value
pop2(:,9)=bin2dec(num2str(pop2(:,1:8)));
pop1(:,10)=((pop1(:,9)./255)*2*pi)-pi;    % value of x between -pi to pi
pop2(:,10)=((pop2(:,9)./255)*2*pi)-pi;
pop1(:,11)=-((pop1(:,10)-1).^2+(pop2(:,10)-2).^2);              % fitness function
pop2(:,11)=-((pop1(:,10)-1).^2+(pop2(:,10)-2).^2);
pop1=sortrows(pop1,-11);                 % arrange rows in accordance to the fitness in descending order
pop2=sortrows(pop2,-11);
pc=0.8;
count=0;
lp=0;
while count<=1000
    lp=lp+1;
    ip1=randperm(ceil(pc*size),8);          % selection- generate random number array
    ip2=randperm(ceil(pc*size),8);
    cop1=randi([1,8],1,1);                  % crossover- point (for one child)
    cop2=randi([1,8],1,1);
    i=1;
    for j=1:2:ceil(pc*size)
         pop1(size+i,1:cop1)=pop1(ip1(i),1:cop1);
         pop2(size+i,1:cop2)=pop2(ip2(i),1:cop2);
         pop1(size+i,(cop1+1):8)=pop1(ip1(i+1),(cop1+1):8);
         pop2(size+i,(cop2+1):8)=pop2(ip2(i+1),(cop2+1):8);
         i=i+1;
    end
    for i=11:1:14                           % mutation
        mp1=randi([1,8],1,1);
        mp2=randi([1,8],1,1);
        pop1(i,mp1)=not(pop1(i,mp1));
        pop2(i,mp2)=not(pop2(i,mp2));
    end
    pop1(:,9)=bin2dec(num2str(pop1(:,1:8))); % decimal value
    pop2(:,9)=bin2dec(num2str(pop2(:,1:8)));
    pop1(:,10)=((pop1(:,9)./255)*2*pi)-pi;    % value of x between -pi to pi
    pop2(:,10)=((pop2(:,9)./255)*2*pi)-pi;
    pop1(:,11)=-((pop1(:,10)-1).^2+(pop2(:,10)-2).^2);             %fitness function
    pop2(:,11)=-((pop1(:,10)-1).^2+(pop2(:,10)-2).^2);
    pop1=sortrows(pop1,-11);
    pop2=sortrows(pop2,-11);
    pop1(11:14,:)=[];
    pop2(11:14,:)=[];
    x1=pop1(1,10);
    x2=pop2(1,10);
    count=count+1;
end
x1
x2