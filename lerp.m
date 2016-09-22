function value = lerp(v, x)
    n=length(v);
    xa=floor(x);
    xb=xa+1;
    % determin marginea din stanga si marginea
    % din dreapta
    ok=0;
    if(x>=1 && x<length(v))   
            a=(v(xa)-v(xb))/((xa)-(xb));
            b=v(xa)-a*xa;
            value=a*x+b;
            ok=1;
    % aflu ecuatia dreptei si determin valoarea
    % in punctul dat
    end
    if (x<1)
    	value=0;
        ok=1;
    end
    if (x>=length(v))
    	value=0;
        ok=1;
    end
    % am tratat si cazurile extreme, cand 
    % nu se afla in interval
end
