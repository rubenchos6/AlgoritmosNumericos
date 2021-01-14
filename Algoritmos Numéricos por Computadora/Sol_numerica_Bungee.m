% v(i+1)=v(i)+d(v)/dt *(t(i+1)-t(i))
%syms v(t) g cd m;
%g=9.81;
%m=68.1;
%cd=0.25;
%tf=12;


%h=2;
function [t,v]=Sol_numerica_Bungee(h,tf,g,m,cd)
    
    if m==0, error('m: zero value encountered'), end

    a= @(v) g -(cd/m)*v^2;
    
    t=0:h:tf;
    v=zeros(size(t));

    for i=1:1:length(v)-1
        v(i+1)=v(i) + a(v(i))*h;
    end

    %plot(t,v);
    %res=[t;v];
    %fprintf('\tt     v\n');
    %fprintf('%5d %10.3f\n',res);
end