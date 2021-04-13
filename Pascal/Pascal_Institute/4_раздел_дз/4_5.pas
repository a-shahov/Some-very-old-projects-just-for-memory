var a,b,n,x,q:integer; 
begin 
a:=304561;
b:=306259;
n:=b-a+1;
q:=0;
for x:=a to b do if (((x div 100000)+((x div 10000)-(x div 100000)*10)+((x div 1000)-(x div 10000)*10)) = (((x div 100)-(x div 1000)*10)+((x div 10)-(x div 100)*10)+((x div 1)-(x div 10)*10))) then q:=q+1
                                                                                                                                                                                                 else continue;
writeln('Количество "счастливых" билетов ',q,'.     Количество билетов ',n,'.');
end.                