function [x, U] = gauss_elim(A,b)
s = length(A);
for j = 1:(s-1)
    %prohazovani radku
    [~,pi]= max(abs(A(j:s,j)));
    pi=pi+j-1;
    A([pi,j],:)=A([j,pi],:);
    b([pi,j],:)=b([j,pi],:);
    %deleni - delani spodniho trojuhelniku nul
    for i =s:-1:j+1
        m = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - m*A(j,:);
        b(i) = b(i) - m*b(j);
    end
end
U=A;
x = zeros(s,1);
x(s) = b(s)/A(s,s);
for i = s-1:-1:1                    
    sum = 0;
    for j = s:-1:i+1                
        sum = sum + A(i,j)*x(j);
    end 
    x(i) = (b(i)- sum)/A(i,i);
end 
end