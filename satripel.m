%% basic Requirements codes
clc;clear
format rat;

%% Variables
% row = input('rows = ');
% column = input('columns = ');
% Array = randi([0 100] , row, column);

row = 6;
column = 5;
Array = [0 0 0 0 3  ; 0 0 0 2 0 ; 0 0 0 0 9; 0 0 9 6 0 ; 0 0 0 0 1 ; 8 0 0 4 0 ];

disp(Array);

logiZeroes = logical(zeros(row , 1) + 1); % making a logical zero matrix

zeroColm = 1;   % number of the zeros columns

%% finding the first zero columns %
for col = 1 : column

    boolRes = Array(: , col) == zeros(row , col) ;
    if boolRes == logiZeroes
        zeroColm = zeroColm + 1;
    else
        break;    % arriving the nonZero column
    end

end

%% The row operation

for col = zeroColm : column

    disp('Operations on column : ');
    disp(col);

    if Array((col - zeroColm )+ 1, col) == 0            % check if the target inline is zero
         Array = changeZero(Array, (col - zeroColm )+ 1, col);
    end
    
    % make the target inline to 1
    Array = rowDivide(Array, (col - zeroColm )+ 1, col);

    % with row operations change the other inline to zero
    Array =  minesOper(Array , (col - zeroColm )+ 1, col);

    disp('this col is compelete');
    Array

end


%% Functions


function  [Array] = changeZero(a, r, c)

    arrSize = size(a);
    rowSize = arrSize(1);

    for i = r +1: rowSize
        if a(i, c) ~= 0         % if the a(i, c) is not zero change it with the inline that we passed to the function
            t = a(i , :);
            a(i , :) = a(r , :);
            a(r , :) = t;
                break;
        end
    end
    Array  = a
end

function [array] = rowDivide(arr, r , c)
   
    if arr(r, c) ~= 0
        pr = sprintf('dividing the row number %d by %d',r,arr(r,c));
        disp(pr);
        arr(r , :) = arr(r, :) / arr(r ,c);         % divide the whole row by the passed inline
    end
    array = arr
end

function [array] = minesOper(arr, r ,c)        % By subtracting  the Multiples the target inline from the col all the ecxept the target inline become zero

arrSize = size(arr);
rowSize = arrSize(1);

for i = 1 : rowSize
    
    if i == r || arr(i , c) == 0
        continue
    else
        arr(i , :) = (arr(r, :) * arr(i ,c) * -1) + arr(i , :);
    end
end

array = arr;

end


