f=@(x) -12 -21*x +18*x.^2-2.75*x^3;
%[x,i]=bisect(f,-2,6);
[x,i]=newRap(f,22)
function [x,i]=bisect(f,a,b)
    if f(a)*f(b)>0, error('f(a) y f(b) deben tener distinto signo'), end
    min=a;
    max=b;
    xr=(min+max)/2;
    i=1;
    while abs(xr-max)>eps && f(xr)~=0
        if f(xr)*f(min)>0
            min=xr;
        else
            max=xr;
        end
        i=i+1;
        xr=(min+max)/2;
    end
    x=xr;
end

function [x,i]=newRap(f,xi)
    %xn+1=xn-f(xn)/f´(xn)
    xp=xi;
    x=xp+10;
    i=0;
    fsym=sym(f);
    dfs=diff(fsym);
    df=matlabFunction(dfs);
    if dfs==0, error('La derivada de la función es 0'), end
    while abs((x-xp)/x)>eps && f(x)~=0
        xp=x;
        x=xp-f(xp)/df(xp);
        i=i+1;
    end
end