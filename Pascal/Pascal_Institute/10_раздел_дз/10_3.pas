Function q1(x:real):real;
 var x1:real;
 const q=0.000001;
 begin x1:=x; while abs(exp(-x1)-x1)>q do x1:=exp(-x1); q1:=x1 end;
Function q2(x:real):real;
 var x1:real;
 const q=0.000001;
 begin x1:=x; while abs(sin(x1)+1-x1)>q do x1:=sin(x1)+1; q2:=x1 end;
Function q3(x:real):real;
 var x1:real;
 const q=0.000001;
 begin x1:=x; while abs(x1-0.5*sqr(cos(x1)))>q do x1:=0.5*sqr(cos(x1)); q3:=x1 end;
Function q4(x:real):real;
 var x1:real;
 const q=0.000001;
 begin x1:=x; while abs(x1-cos(0.5*x1))>q do x1:=cos(0.5*x1); q4:=x1 end;

var 
 x,x1,x2,x3,x4:real;
 
begin
 writeln('¬ведите x');
 readln(x);
 writeln(q1(x)); writeln(q2(x)); writeln(q3(x)); writeln(q4(x));
end.