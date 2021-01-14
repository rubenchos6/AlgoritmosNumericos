% message='Hola como estas 12344213 asdasd á é';
% p=29;
% q=23;
% [msgEncrypt,e]=encryptRSA(message,p,q);
% msgDecrypt=decryptRSA(msgEncrypt,p,q,e);
% msgEncrypt
% msgDecrypt


stringEqual('Hola','Hola')
function bool=RSA(msg,p,q)
    [msgEncrypt,e]=encryptRSA(message,p,q);
    %Imprimimos la llave pública, el mensaje encriptado
    msgDecrypt=decryptRSA(msgEncrypt,p,q,e);
    %Imprimimos la llave privada, el mensaje decriptado
    
    bool=stringEqual(msgDecrypt,msg);
    %Imprimimos si son iguales los mensajes
end
function bool=stringEqual(str1,str2)
    bool='Cadenas Distintas';
    if strcmp(str1,str2)==1
        bool='Cadenas Iguales';
    end
end
function [msg,e]=encryptRSA(message,p,q)
     [n,e]=pickPublicKeyRSA(p,q);
     fprintf('Public key is (%d,%d) \n',e,n);
     msg=moduleRSA(message,n,e);
end

function msg=decryptRSA(message,p,q,e)
    [n,d]=pickPrivateKeyRSA(p,q,e);
    msg=moduleRSA(message,n,d);
end

function [n,e]=pickPublicKeyRSA(p,q)
    if isprime(p)==0, error('p: is not a prime number'), end
    if isprime(q)==0, error('q: is not a prime number'), end
    if p==q, error('p is equal q'),end
    n=p*q;
    phi=(p-1)*(q-1);
    e=1;
    emax=0;

    while e<n && emax< n*0.4
        %Recorremos los valores de e a partir de 2 y hasta llegar a n.
        %Buscamos un valor más alto que n/limit que cumpla las condiciones de e
        %No nos queremos quedar con el mínimo, buscamos un numero alto para
        %que el cifrado sea seguro.
        e=e+1;
        %Buscamos un primo relativo, o sea que su great common divider sea
        %1
        if gcd(phi,e)==1
            emax=e;
        end
    end
    e=emax;
end

function [n,d]=pickPrivateKeyRSA(p,q,e)
    if isprime(p)==0, error('p: is not a prime number'), end
    if isprime(q)==0, error('q: is not a prime number'), end
    if p==q, error('p is equal q'),end
    n=p*q;
    phi=(p-1)*(q-1);
    d=0;
    dmax=0;
    while d<n && dmax<n*0.3
        %Recorremos los valores de e a partir de 2 y hasta llegar a n.
        %Buscamos un valor más alto que n/limit que cumpla las condiciones de d
        %No nos queremos quedar con el mínimo, buscamos un numero alto para
        %que el cifrado sea seguro.
        d=d+1;
        %Buscamos que el modulo de e*d con phi sea 1
        if mod(d*e,phi)==1
            dmax=d;
        end
    end
    d=dmax;
end

function msg=moduleRSA(ms,n,e)
    mess=double(ms);
    %Recorrer mess <n
    if sum(mess>n)>0, error('n is too small to encrypt this message, pick larger numbers'), end
    if e==0, error('e: value <1'), end
    %Aplicamos el modulo al mensaje
    msg=expBinaria(mess,n,e);
    %Convertimos el arreglo decimal a sus correspondientes caracteres
    msg=char(msg);
end

function res=expBinaria(m,n,e)
        %La operación que se desea realizar es mod(m^e,n)
        %Utilizamos el concepto de exponenciación binaria
        %Primero se calcula el cuadrado de m y su modulo con m
        res=mod(m,n);
        %Posteriormente de forma cíclica multiplicamos el resultado del modulo
        %con el m y se repite el cálculo del módulo
        for j=1:(e-1)
            c=res.*m;
            res=mod(c,n);
        end
end

