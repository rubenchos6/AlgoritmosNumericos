%Puntos aleatorios
%nRand=100000;
%Contador de puntos internos
%nIn=0;
%Ciclio para encontrar numeros aleatorios y checar si el radio es menor a 1
%for nloops=1:nRand
%    Xrand=rand;
%    Yrand=rand;
%    Rrand=Xrand^2+Yrand^2;
%    %Si el radio es menor a 1, aumentamos el contador de puntos internos
%    if(Rrand<1)
%        nIn=nIn+1;
%    end
%end






%%Segunda versión, usando vectores
%Puntos aleatorios
nRand=100;

%Crear vector aleatorio x y y
xRand=rand(1,nRand);
yRand=rand(1,nRand);

%Calcular radio como operacion vectorial
rRand=xRand.^2+yRand.^2;

%Vector booleano
nIn= rRand<1;

%Graficar puntos resultantes

angles=linspace(0,pi/2,200);
xCir=cos(angles);
yCir=sin(angles);
hold on
scatter(xRand,yRand);
plot(xCir,yCir);


%Desviación estándar de la binomial
p=sum(nIn)/nRand;
q=1-p;
std=sqrt(nRand*p*q);
std

%Resultados
%puntos internos/ puntos totales sería el cálculo de pi/4
%La aproximación sería 4* puntos internos/puntos totales
piaprox=4*sum(nIn)/nRand;
piaprox
%Error
error=abs((piaprox-pi)/pi);
error

%Formula de leibniz

aux=0;
intentos=1;
dif=1;

while(intentos<200000 || dif>0.0000001)
    
    aux=aux+(-1)^(intentos+1)*1/(2*intentos-1);
    dif=1/(2*intentos-1);
    intentos=intentos+1;
end
piaprox2=aux*4;
piaprox2