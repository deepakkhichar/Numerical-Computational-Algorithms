%{

For the given matrix Hn, the value of conditional number obatained using
row-norm and column-norm is equal ( This is because matrix Hn is symmetric.
Since inverse of symmetric metrix is symmetric, therefore Hn_inverse is
also symmetric. If two metrix are symmetric, then their row-norm and column-norm
are equal. And therefore conditional number using row-norm and column-norm is equal.).

Some other observations:

*The conditional number increases on increasing the value of n

*The conditional number obtained using eucledian-norm is less than that
obatained by using row-norm or column-norm.



%}





for n = 3:1:6

    
    fprintf(" For n = %d \n",n);

    Hn = zeros(n,n);

    for i = 1:1:n
        for j = 1:1:n
            Hn(i,j) = 1/(i+j-1);
        end
    end
    
    Hn_inverse = inv(Hn);
    
    % row norm
    row_norm_Hn = 0;
    row_norm_Hn_inverse = 0;
    for i = 1:1:n
        aa=0;
        ai=0;
        for j = 1:1:n
            aa = aa + abs(Hn(i,j));
            ai = ai + abs(Hn_inverse(i,j));
        end
        if aa>row_norm_Hn
            row_norm_Hn = aa;
        end
        if ai>row_norm_Hn_inverse 
            row_norm_Hn_inverse = ai;
        end
    end
    
    conditional_number_row_norm = row_norm_Hn * row_norm_Hn_inverse;
    
    
    fprintf(" The Conditional number using row-norm is %f \n",conditional_number_row_norm);

    
    % column norm

    
    column_norm_Hn = 0;
    column_norm_Hn_inverse = 0;
    for j = 1:1:n
        aa=0;
        ai=0;
        for i = 1:1:n
            aa = aa + abs(Hn(i,j));
            ai = ai + abs(Hn_inverse(i,j));
        end
        if aa>column_norm_Hn
            column_norm_Hn = aa;
        end
        if ai>column_norm_Hn_inverse 
            column_norm_Hn_inverse = ai;
        end
    end
    
   
    conditional_number_column_norm = column_norm_Hn * column_norm_Hn_inverse;
    
    
    fprintf(" The Conditional number using column-norm is %f \n",conditional_number_column_norm);

    
    % eucledian norm
    aa=0;
    ai=0;
    for i = 1:1:n
        for j = 1:1:n
            aa = aa + Hn(i,j)^2;
            ai = ai + Hn_inverse(i,j)^2;
        end
    end
    
    euclidean_norm_Hn = aa^0.5;
    euclidean_norm_Hn_inverse = ai^0.5;
    
    conditional_number_euclidean_norm = euclidean_norm_Hn * euclidean_norm_Hn_inverse;
    
    
    fprintf(" The Conditional number using euclidean-norm is %f \n \n \n",conditional_number_euclidean_norm);

    
end

    
    
    
    
    
