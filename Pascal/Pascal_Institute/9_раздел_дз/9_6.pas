procedure str(a:string; var t:string);
var x,n:integer;
begin x:=length(a); t:='';
      for n:=1 to x do t:=t+a[x-n+1] end;
var a,v:string;
begin
readln(a);
str(a,v);
writeln(v);
end.