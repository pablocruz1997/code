function [x,s]=curvas(t,A)
k=0;
n=100;
x=0:0.009:t/2;
s=0;  
while k<=n 
s=A*(((-1).^k)*((((2*pi)/t)*x).^(2*k+1))/factorial(2*k+1))+s;
 k=k+1;
end
end
