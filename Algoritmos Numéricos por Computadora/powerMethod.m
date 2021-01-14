%Power method
A=[2,-12; 1,-5];
powerMet(A)
function [value,vector]=powerMet(A)
    if length(A)~=length(A'), error('La matriz no es cuadrada'),end
    i=0;
    MAX=5;
    %Qué valor elegir como máximo en el random?
    vector=randi(MAX,[1,length(A)])';
    while i<MAX
        aux=A*vector;
        vector=aux/norm(aux);
        value=(dot(vector,aux))/(dot(vector,vector));
        i=i+1;
    end
end