function [answer] = zach(x,y,x_lookup)
    LengthOfLookup=length(x_lookup);
    h=x(2)-x(1);
    %disp(h);
    LengthOfx=length(x);
    x_n=x(LengthOfx);
    %disp(x_n);
    for i = 1:LengthOfLookup
        x_i=x_lookup(i);
        %disp(x_i);
        s=(x_i-x_n)/h;
        %disp(s)
        deltaf=y;
        %sum = x(LengthOfx) + deltaf(LengthOfx);
        
        for j = 0: LengthOfx-2

            
            
            %disp(coefficient);
            deltaf=calculatedifference(deltaf)
            deltafcols(j + 1) = deltaf(end);
            %disp(deltaf)
            %LengthOfdeltaf = length(deltaf);
            %term=coefficient*deltaf(LengthOfdeltaf);
            %sum=sum+term;
        end
        deltafcols;
        answer(i) = x(end) + y(end) + evalhornes(0, deltafcols, s)
    end
end

function [coefficient] = getcoefficient(s,limit)
    product=1;
    for i = 0:limit
        product=product*(s+i);
    end
    coefficient=product/factorial(limit+1);
end

function [difference] = calculatedifference(deltaf)
    LengthOfdeltaf = length(deltaf);
    for i = 1:LengthOfdeltaf-1
        difference(i)= deltaf(i+1)-deltaf(i);
    end
end

function [answer] = evalhornes(col,deltafcols,s)
    
    if col==length(deltafcols)-1
        deltacol=deltafcols(col+1);
        lastnumber=deltacol
       answer = ((s+col)/(col+1))*lastnumber;
   
    else 
        deltacol=deltafcols(col+1);
        answer=deltacol+((s+col)/(col+1))*(evalhornes(col+1,deltafcols,s));
    end
end
