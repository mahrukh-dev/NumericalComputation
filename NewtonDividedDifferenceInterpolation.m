%poly(1)
%1 -1
%x-1

function [interpolateval] = NewtonDividedDiffferenceInterpolation()
x = input('Enter x: ');
y = input('Enter y: ');

n = length(y); %rows
D = zeros(n,n);
D(:,1) = y;
for j = 2:n
    for i=j:n
        D(i,j) = (D(i, j - 1) - D(i - 1, j - 1))/(x(i) - x(i-j+1));
    end
end

disp('Divided Differences Table:');
disp(D);

C=D(n,n);
for k=n-1:-1:1
    C=conv(C,poly(x(k)))
    m=length(C)
    C(m)=C(m)+D(k,k)
end
C

X=linspace(x(1),x(n),100);
Y=polyval(C,X);
plot(x,y,'k')
hold on
plot(X,Y,'*')

end