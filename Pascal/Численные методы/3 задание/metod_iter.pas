program metod_iter;

const p=4;

type
 mas1=array[1..p,1..p] of extended;
 mas2=array[1..p] of extended;



var
  A: mas1;
  x,ck,maxi,maxj,sum,las: mas2;
  q:real;
  k,o: integer;
  pops,s1,s2,s3,work: boolean;


procedure itr(a:mas1; ck,las:mas2; var x:mas2);
 var i,k:integer;
 begin
  for i:=1 to 4 do begin
   x[i]:=x[i]+ck[i];
   for k:=1 to 4 do
    x[i]:=x[i]+a[i,k]*las[k]
  end;
 end;


begin

  //начальное приближение

 las[1]:=2.15;
 las[2]:=-0.83;
 las[3]:=1.16;
 las[4]:=0.44;

 for k:=1 to 4 do //свободные члены
 ck[k]:=las[k];

  //инициализация коэффициентов

 a[1,1]:=0.32; a[1,2]:=-0.05; a[1,3]:=0.11; a[1,4]:=-0.08;
 a[2,1]:=0.11; a[2,2]:=0.16; a[2,3]:=-0.28; a[2,4]:=-0.06;
 a[3,1]:=0.08; a[3,2]:=-0.15; a[3,3]:=0.12; a[3,4]:=1.16;
 a[4,1]:=-0.21; a[4,2]:=0.13; a[4,3]:=-0.27; a[4,4]:=0.44;

  //расчёт q для выбора метрики

  for o:=1 to 4 do
   for k:=1 to 4 do
    begin
     maxi[o]:=abs(maxi[o])+ abs(a[o,k]);
     maxj[o]:=abs(maxj[o])+ abs(a[k,o]);
     sum:=sum+sqr(a[o,k]);
    end;
  sum:=sqrt(sum);

  //сортировка массивов

   for o:=1 to 4 do
    for k:=1 to 3 do
     begin

      if maxi[k]<maxi[k+1] then
       begin
        maxi[k]:=maxi[k+1]-maxi[k];
        maxi[k+1]:=maxi[k+1]-maxi[k];
        maxi[k]:=maxi[k]+maxi[k+1];
       end;

      if maxj[k]<maxj[k+1] then
       begin
        maxj[k]:=maxj[k+1]-maxj[k];
        maxj[k+1]:=maxj[k+1]-maxj[k];
        maxj[k]:=maxj[k]+maxj[k+1];
       end;

     end;

   //выбор q

   s1:=false; s2:=false; s3:=false;
   pops:=true;

    if (pops)and(maxi[1]<1) then begin
     q:=maxi[1]; pops:=false; s1:=true; end;

    if (pops)and(maxj[1]<1) then begin
     q:=maxj[1]; pops:=false; s2:=true; end;

    if (pops)and(sum<1) then begin
     q:=sum; pops:=false; s3:=true; end;

   //метод итераций

   work:=true;

   while work do
    begin
     itr
    end;





end.

