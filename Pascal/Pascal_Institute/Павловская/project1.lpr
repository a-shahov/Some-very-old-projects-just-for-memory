program project1;
 uses crt;
const max = 10;

var
  i,k,n:integer;
begin
 clrscr;
 randomize;
 i:=random(10);
 window(20,5,60,20);
 textbackground(blue);
 clrscr;
 textcolor(lightgray);
 k:=-1;
 gotoXY(11,5); writeln(' Enter the number : ');
 repeat
   gotoxy(20,9);
   readln(n);
   inc(k);
 until i = n ;
 window(20,22,60,24);
 textattr:= 2 shl 4 + 14;
 clrscr;
 gotoxy(6,2);
 writeln(' coefficient of failure : ',k/max:5:1);
 readkey;
 textattr:=15;
 clrscr;
 readkey;

end.

