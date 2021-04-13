const
 r='C:/Users/Андрей/Desktop/new2.txt';
 
var
 m,m1:array[1..10] of integer;
 f:text;
 i,q,t:integer;

begin
  randomize;
  for i:=1 to 10 do m[i]:=random(101);
  assign(f,r);
  rewrite(f);
  for i:=1 to 10 do write(f,m[i]:4);
  close(f);
  reset(f);
  for i:=1 to 10 do read(f,m1[i]);
  close(f);
  for i:=1 to 9 do
  for q:=i+1 to 10 do if m1[i]>m1[q] then begin t:=m1[i]; m1[i]:=m1[q]; m1[q]:=t end
                                     else continue;
  append(f);
  writeln(f);
  for i:=1 to 10 do write(f,m1[i]:4);
  close(f);
end.