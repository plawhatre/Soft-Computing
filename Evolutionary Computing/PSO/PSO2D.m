clc,clear,close all;
%%range of solutions
a1 = -10;
b1 = 10;
a2 = -10;
b2 = 10;
itr=0;
%%initial population of particles
    % we need not take two population vectors since x1 and x2 ranges are same.
x= (b1-a1).*rand(20,2) + a1;
    % fitness function
x(:,3)=((x(:,1)-1).^2+(x(:,2)-2).^2);              
    % arrange rows in accordance to the fitness in descending order
x=sortrows(x,3);
    % global best
gbest=[x(1,1:2)];
    %fitness value at global best
fvg=((gbest(1)-1).^2+(gbest(2)-2).^2);
    % personal best
pbest=[x(:,1:2)];
    %fitness value at global best
fvp=((pbest(:,1)-1).^2+(pbest(:,2)-2).^2);
    % declaring constants
alpha=0.8;
count=0;
c1=2;
c2=2;
    %initial velocities of particles
v=ones(20,2);
    % run loop till the value saturates for at least 50 iteration
while count<=100
    for j=1:20
        % cond. to ensure that particle does not move out of search range
       if x(j,1)<=a1|x(j,1)>=b1|x(j,2)<=a2|x(j,2)>=b2
           x(j,1:2)=pbest(j,1:2);
       end
       % update fitness value at gbest 
       if fvg>=x(1,3) 
        gbest=x(1,1:2);
        fvg=(gbest(1)-1).^2+(gbest(2)-2).^2;
       end
       % updating fitness value at pbest
       if fvp(j)>=x(j,3)
           pbest(j,1:2)=x(j,1:2);
           fvp(j)=((pbest(j,1)-1).^2+(pbest(j,2)-2).^2);
       end
    end
    temp_x=x(:,1:2);
    % updating particle positions and velocities
    v=alpha*v+c1*rand*(pbest-x(:,1:2))+c2*rand*(repmat(gbest,20,1)-x(:,1:2));
    x(:,1:2)=x(:,1:2)+v;
    %updating objective function
    x(:,3)=((x(:,1)-1).^2+(x(:,2)-2).^2);
    x=sortrows(x,3);
    if temp_x(1,1:2)-x(1,1:2)<=[0.0001,0.0001]
        count=count+1;
    end
    itr=itr+1;
end
disp('optimal solution is ')
gbest