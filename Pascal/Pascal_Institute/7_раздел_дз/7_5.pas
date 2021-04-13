var s,c:string; n,l,q,k:integer;
begin
readln(s);
k:=0;
l:=length(s);
c:=s;
for n:=1 to l do
if s[n]=chr(8) then continue
               else begin for q:=1 to l do
                          if c[n]=s[q] then begin k:=k+1; s[q]:=chr(8) end
                                       else continue;
                          writeln(c[n],' - ',k); 
                          k:=0 end;
end.
                                 