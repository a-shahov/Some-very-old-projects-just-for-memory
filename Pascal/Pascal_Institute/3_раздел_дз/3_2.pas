var a,b,c,d,f,g,q:real;
begin 
readln(a,b,c,d,f,g);
q:=a*f-b*d;
if q<>0 then begin
             writeln('x = ',(f*c-b*g)*exp(-1*ln(q)));
             writeln('y = ',(a*g-d*c)*exp(-1*ln(q)));
             end
        else writeln('Cистема не имеет решений');
end.
