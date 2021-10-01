function [answer] = table(x,y,x_lookup)
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
        sum = x(LengthOfx) + deltaf(LengthOfx);
        for j = 0: LengthOfx-2
            coefficient=getcoefficient(s,j);
            %disp(coefficient);
            deltaf=calculatedifference(deltaf);
            %disp(deltaf)
            LengthOfdeltaf = length(deltaf);
            term=coefficient*deltaf(LengthOfdeltaf);
            sum=sum+term;
        end
        answer(x_i)=sum
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