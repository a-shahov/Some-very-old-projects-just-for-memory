Type
 res=array[1..100, 1..2] of integer;
 
Procedure dio(a,b,c:integer; var m:res; var o:integer);
 var x,y:integer;
begin
 o:=0;
 for x:=1 to 100 do
 for y:=1 to 100 do if a*x+b*y=c then begin inc(o); m[o,1]:=x; m[o,2]:=y  end
                                 else continue;
end;

const
 r='C:/Users/Андрей/Desktop/in.txt';
 r1='C:/Users/Андрей/Desktop/out.txt';
 
var
 in1,out1:text;
 a,b,c,o,n:integer;
 m:res;
 
begin
 assign(in1,r); assign(out1,r1);
 reset(in1);
 read(in1,a,b,c);
 close(in1);
 rewrite(out1);
 dio(a,b,c,m,o);
 for n:=1 to o do begin write(out1,m[n,1]:3); write(out1,m[n,2]:3); writeln(out1) end;
 if o=0 then write(out1,'Это уравнение не имеет решений');
 close(out1);
end.
 
 
 
 