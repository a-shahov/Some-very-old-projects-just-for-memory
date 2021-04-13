var s,m:string; n,x,n1,o,s1,s2:integer;
begin
readln(s);
n:=1; s1:=0; s2:=0;
x:=length(s);
for n1:=1 to x do m:=m+inttostr(ord(s[n1]));
o:=length(m);
while n<=o do if n>0.5*o then begin s2:=s2+ord(m[n]); n:=n+1 end
                         else begin s1:=s1+ord(m[n]); n:=n+1 end;
if s1=s2 then writeln('Билет № ',s,' счастливый')
         else writeln('Билет № ',s,' несчастливый');
end.