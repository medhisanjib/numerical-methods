clc;
close all;
clear all;

A = [3, -0.1, -0.2; 
    0.1, 7, -0.3;
    0.3, -0.2, 10];

B = [7.85;
    -19.3;
    71.4];

n = 3;

AA = A;
BB = B;

% Forward Elimination

for k = 1:n-1
   for i = k+1: n
       factor = A(i,k)/A(k,k);
       AA(i,:) = zeros(1,n);
       for j = k+1 : n
           AA(i,j) = A(i,j)-factor*A(k,j)
       end
       BB(i) = BB(i)-factor*BB(k);
   end
end

% Back Substitution

X = zeros(1,n);

X(n) = BB(n)/AA(n,n);

for i = n-1:-1:1
    sum = BB(i);
    for j = i+1:n
        sum = sum + AA(i,j)*X(j);
    end
    X(i) = sum/AA(i,i);
end

disp(X)

