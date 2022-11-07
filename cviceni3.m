%Lukac
clear
B = round(randn(100,200));
disp('vstupní pole')
B
B_sorted = VecBubbleSort(B);
disp('seřazené pole')
B_sorted

function Y = VecBubbleSort(X)
B = round(X);
C = B;
for i=1:size(B,2)
    for x=2:size(B,2)
        for y=1:size(B,1)
            if B(y,x) < B(y,x-1)
                break
            end
            if B(y,x) > B(y,x-1)
               B(:,x-1) = B(:,x);
               B(:,x) = C(:,x-1);
               C = B;
               break
            end
        end
    end
end
Y = B;
end