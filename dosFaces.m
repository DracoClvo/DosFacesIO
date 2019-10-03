function dosFaces()
%**METODO SIMPLEX**
 
%**Para cambiar a metodo simplex de tres dimensiones es necesario agregar
%las terceras variables a cada matriz respectivamente
 
C=input('C = '); %[-300 -400]; %Se define A como funcion objetivo
A=input('A = '); %[ 3 3 ;3 6];     %Se define B como restricciones 
B=input('B = '); %[ 120; 180];       %Se define C como recursos

In=size(A,1); %Se guarda en In el número de restricciones
Xsol=[A eye(In) B ; C zeros(1,In) 0]

[A eye(size(B,1)) B;zeros(1,size(C,2)) ones(1,size(B,1)) 0]
end