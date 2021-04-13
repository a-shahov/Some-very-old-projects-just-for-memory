unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, TATransformations, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Menus, DBGrids, DbCtrls,
  Grids, ValEdit;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    Panel2: TPanel;
    wwedite: TLabel;
    LabelX: TLabel;
    LabelY: TLabel;
    wwodx: TMemo;
    wwody: TMemo;
    opcii: TMenuItem;
    regim: TMenuItem;
    statobr: TMenuItem;
    mnkobr: TMenuItem;
    graphik: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    wwod: TButton;
    ochisti: TButton;
    MainMenu1: TMainMenu;
    aboutprog: TMenuItem;
    exti: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure statobrClick(Sender: TObject);
    procedure mnkobrClick(Sender: TObject);
    procedure graphikClick(Sender: TObject);
    procedure ochistiClick(Sender: TObject);
    procedure wwodClick(Sender: TObject);
    procedure aboutprogClick(Sender: TObject);
    procedure extiClick(Sender: TObject);
    procedure wwodxChange(Sender: TObject);
    procedure wwodxKeyPress(Sender: TObject; var Key: char);
    procedure wwodyChange(Sender: TObject);
    procedure wwodyKeyPress(Sender: TObject; var Key: char);

  private

  public

  end;


var
  Form1: TForm1;

implementation
uses unit2, unit4, Unit5;

{$R *.lfm}

{ TForm1 }
type
  dat=array of double;



procedure MNK4;

var
 xmas,ymas:dat;
 i,nx,ny,step,p:integer;
 helpstr:string;
 ex:longint;
 a11,a12,a21,a22,b1,b2,o:double;  // y=a*exp(b/x)
 a,b,sa:double; //коэффициенты уравнения
 x:double; //для построения графика аппроксимирующей функции
 xsr,sumch,sumz:double;
 maxX,minX,maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика


begin

 //Проверка на заполненность полей ввода

 if unit1.form1.wwodx.text='' then
 begin
 showmessage('Введите значения X'); exit;
 end;

 if unit1.form1.wwody.text='' then
 begin
 showmessage('Введите значения Y'); exit;
 end;

 //замена '.' на ','

for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwodx.Lines[i]:=helpstr;
end;

for i:=0 to unit1.form1.wwody.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwody.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwody.Lines[i]:=helpstr;
end;

 //Инициализация массивов с введенными данными

 nx:=0;
 for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
  if unit1.form1.wwodx.Lines[i]<>'' then begin
  inc(nx); setlength(xmas,nx);
  try
  xmas[nx-1]:=strtofloat(unit1.form1.wwodx.Lines[i]);
  except
      showmessage('Ошибка в введенных вами данных');
      exit;
  end;
  end;

 ny:=0;
 for i:=0 to unit1.form1.wwody.Lines.Count-1 do
  if unit1.form1.wwody.Lines[i]<>'' then begin
  inc(ny); setlength(ymas,ny);
  try
  ymas[ny-1]:=strtofloat(unit1.form1.wwody.Lines[i]);
  except
      showmessage('Ошибка в введенных вами данных');
      exit;
  end;
  end;

 //Проверка на равенство nx = ny

 if nx<>ny then begin
 showmessage('Количество значений X и Y не совпадают'); exit;
 end;

 //Проверка на минимальное число координат

 if nx<3 then begin
 showmessage('Количество координат точек должно быть больше 2');
 exit;
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; a:=0; b:=0; o:=0;
 for i:=0 to nx-1 do
 begin
 a11:=a11+sqr(1/xmas[i]);
 a12:=a12+1/xmas[i];
 b1:=b1+(1/xmas[i])*ln(ymas[i]);
 b2:=b2+ln(ymas[i]);
 end;
 a22:=nx;
 a21:=a12;

 //Расчет коэффициентов для линейной аппроксимации

 o:=a11*a22-a21*a12;
 b:=((b1*a22-b2*a12)/o);
 a:=exp(((a11*b2-a21*b1)/o));

 //Нахождение максимального и минимального значения из массива ymas, xmas

 maxx:=xmas[0]; minx:=xmas[0];
 for i:=1 to ny-1 do begin
  if maxx < xmas[i] then maxx:=xmas[i];
  if minx > xmas[i] then minx:=xmas[i];
  end;

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 x:=minx;
 for i:=1 to 151 do begin
   unit4.graf.approximationSeries.AddXY(x,a*exp(b/x));
   x:=x+(maxx-minx)/150;
 end;

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(maxx-minx);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(minx-sclx,miny-scly);
 unit4.graf.scaleSeries.AddXY(maxx+sclx,maxy+scly);

 //Округление коэффициентов

 if b<>0 then begin
  step:=0; ex:=1;
  while abs(b)>=0.1 do begin b:=b/10; inc(step) end;
  while abs(b)<0.01 do begin b:=b*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then b:=round(b*100000)*ex/100000
             else b:=round(b*100000)/ex/100000;
 end;
 if a<>0 then begin
  step:=0; ex:=1;
  while abs(a)>=0.1 do begin a:=a/10; inc(step) end;
  while abs(a)<0.01 do begin a:=a*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then a:=round(a*100000)*ex/100000
             else a:=round(a*100000)/ex/100000;
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+1/xmas[i];
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ln(ymas[i])-ln(a)-b/xmas[i]);

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(1/xmas[i]-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0; ex:=1;
  while sa>=0.1 do begin sa:=sa/10; inc(step) end;
  while sa<0.01 do begin sa:=sa*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then sa:=round(sa*1000000)*ex/1000000
             else sa:=round(sa*1000000)/ex/1000000;
 end;

 //Заполнение таблицы

 unit4.graf.StringGrid1.RowCount:=1;
 unit4.graf.StringGrid1.RowCount:=nx+1;

 for i:=0 to nx-1 do begin
 with unit4.graf.StringGrid1 do begin
 cells[1,i+1]:=FloatToStr(xmas[i]);
 cells[2,i+1]:=FloatToStr(ymas[i]);
 cells[0,i+1]:=IntToStr(i+1);
 end;
 end;

 //Вывод функции и ее коэффициентов

 unit4.graf.Width:=972;
 unit4.graf.Height:=534;

 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+'*exp('+floattostr(b)+'/x)';

 unit4.graf.vidfunc.Caption:='Вид функции: y=a*exp(b/x)';

 unit4.graf.koffa.caption:='b = '+floattostr(b);
 unit4.graf.koffb.caption:='a = '+floattostr(a);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+255;
 unit4.graf.show;
end;

//////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


procedure MNK3;

var
 xmas,ymas:dat;
 i,nx,ny,step,p:integer;
 helpstr:string;
 ex:longint;
 a11,a12,a21,a22,b1,b2,o:double;  // y=a*exp(b*x)
 a,b,sa:double; //коэффициенты уравнения
 x:double; //для построения графика аппроксимирующей функции
 xsr,sumch,sumz:double;
 maxX,minX,maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика


begin

 //Проверка на заполненность полей ввода

 if unit1.form1.wwodx.text='' then
 begin
 showmessage('Введите значения X'); exit;
 end;

 if unit1.form1.wwody.text='' then
 begin
 showmessage('Введите значения Y'); exit;
 end;

 //замена '.' на ','

for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwodx.Lines[i]:=helpstr;
end;

for i:=0 to unit1.form1.wwody.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwody.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwody.Lines[i]:=helpstr;
end;

 //Инициализация массивов с введенными данными

 nx:=0;
 for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
  if unit1.form1.wwodx.Lines[i]<>'' then begin
  inc(nx); setlength(xmas,nx);
  try
    xmas[nx-1]:=strtofloat(unit1.form1.wwodx.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
  end;

 ny:=0;
 for i:=0 to unit1.form1.wwody.Lines.Count-1 do
  if unit1.form1.wwody.Lines[i]<>'' then begin
  inc(ny); setlength(ymas,ny);
  try
  ymas[ny-1]:=strtofloat(unit1.form1.wwody.Lines[i]);
  except
      showmessage('Ошибка в введенных вами данных');
      exit;
  end;
  end;

 //Проверка на равенство nx = ny

 if nx<>ny then begin
 showmessage('Количество значений X и Y не совпадают'); exit;
 end;

 //Проверка на минимальное число координат

 if nx<3 then begin
 showmessage('Количество координат точек должно быть больше 2');
 exit;
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; a:=0; b:=0; o:=0;
 for i:=0 to nx-1 do
 begin
 a11:=a11+sqr(xmas[i]);
 a12:=a12+xmas[i];
 b1:=b1+xmas[i]*ln(ymas[i]);
 b2:=b2+ln(ymas[i]);
 end;
 a22:=nx;
 a21:=a12;

 //Расчет коэффициентов для линейной аппроксимации

 o:=a11*a22-a21*a12;
 b:=((b1*a22-b2*a12)/o);
 a:=exp(((a11*b2-a21*b1)/o));

 //Нахождение максимального и минимального значения из массива ymas, xmas

 maxx:=xmas[0]; minx:=xmas[0];
 for i:=1 to ny-1 do begin
  if maxx < xmas[i] then maxx:=xmas[i];
  if minx > xmas[i] then minx:=xmas[i];
  end;

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 x:=minx;
 for i:=1 to 151 do begin
   unit4.graf.approximationSeries.AddXY(x,a*exp(b*x));
   x:=x+(maxx-minx)/150;
 end;

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(maxx-minx);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(minx-sclx,miny-scly);
 unit4.graf.scaleSeries.AddXY(maxx+sclx,maxy+scly);

 //Округление коэффициентов

 if b<>0 then begin
  step:=0; ex:=1;
  while abs(b)>=0.1 do begin b:=b/10; inc(step) end;
  while abs(b)<0.01 do begin b:=b*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then b:=round(b*100000)*ex/100000
             else b:=round(b*100000)/ex/100000;
 end;
 if a<>0 then begin
  step:=0; ex:=1;
  while abs(a)>=0.1 do begin a:=a/10; inc(step) end;
  while abs(a)<0.01 do begin a:=a*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then a:=round(a*100000)*ex/100000
             else a:=round(a*100000)/ex/100000;
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+xmas[i];
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ln(ymas[i])-ln(a)-b*xmas[i]);

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(xmas[i]-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0; ex:=1;
  while sa>=0.1 do begin sa:=sa/10; inc(step) end;
  while sa<0.01 do begin sa:=sa*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then sa:=round(sa*1000000)*ex/1000000
             else sa:=round(sa*1000000)/ex/1000000;
 end;

 //Заполнение таблицы

 unit4.graf.StringGrid1.RowCount:=1;
 unit4.graf.StringGrid1.RowCount:=nx+1;

 for i:=0 to nx-1 do begin
 with unit4.graf.StringGrid1 do begin
 cells[1,i+1]:=FloatToStr(xmas[i]);
 cells[2,i+1]:=FloatToStr(ymas[i]);
 cells[0,i+1]:=IntToStr(i+1);
 end;
 end;

 //Вывод функции и ее коэффициентов

 unit4.graf.Width:=972;
 unit4.graf.Height:=534;

 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+'*exp('+floattostr(b)+'*x)';

 unit4.graf.vidfunc.Caption:='Вид функции: y=a*exp(b*x)';

 unit4.graf.koffa.caption:='b = '+floattostr(b);
 unit4.graf.koffb.caption:='a = '+floattostr(a);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+255;
 unit4.graf.show;
end;

////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure MNK2;

var
 xmas,ymas:dat;
 i,nx,ny,step,p:integer;
 helpstr:string;
 ex:longint;
 a11,a12,a21,a22,b1,b2,o:double;  // y=a*x^b
 a,b,sa:double; //коэффициенты уравнения
 x:double; //для построения графика аппроксимирующей функции
 xsr,sumch,sumz:double;
 maxX,minX,maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика


begin

 //Проверка на заполненность полей ввода

 if unit1.form1.wwodx.text='' then
 begin
 showmessage('Введите значения X'); exit;
 end;

 if unit1.form1.wwody.text='' then
 begin
 showmessage('Введите значения Y'); exit;
 end;

 //замена '.' на ','

for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwodx.Lines[i]:=helpstr;
end;

for i:=0 to unit1.form1.wwody.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwody.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwody.Lines[i]:=helpstr;
end;

 //Инициализация массивов с введенными данными

 nx:=0;
 for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
  if unit1.form1.wwodx.Lines[i]<>'' then begin
  inc(nx); setlength(xmas,nx);
  try
    xmas[nx-1]:=strtofloat(unit1.form1.wwodx.Lines[i]);
  except
      showmessage('Ошибка в введенных вами данных');
      exit;
  end;
  end;

 ny:=0;
 for i:=0 to unit1.form1.wwody.Lines.Count-1 do
  if unit1.form1.wwody.Lines[i]<>'' then begin
  inc(ny); setlength(ymas,ny);
  try
  ymas[ny-1]:=strtofloat(unit1.form1.wwody.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
  end;

 //Проверка на равенство nx = ny

 if nx<>ny then begin
 showmessage('Количество значений X и Y не совпадают'); exit;
 end;

 //Проверка на минимальное число координат

 if nx<3 then begin
 showmessage('Количество координат точек должно быть больше 2');
 exit;
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; a:=0; b:=0; o:=0;
 for i:=0 to nx-1 do
 begin
 a11:=a11+sqr(ln(xmas[i]));
 a12:=a12+ln(xmas[i]);
 b1:=b1+ln(xmas[i])*ln(ymas[i]);
 b2:=b2+ln(ymas[i]);
 end;
 a22:=nx;
 a21:=a12;

 //Расчет коэффициентов для линейной аппроксимации

 o:=a11*a22-a21*a12;
 b:=((b1*a22-b2*a12)/o);
 a:=exp(((a11*b2-a21*b1)/o));

 //Нахождение максимального и минимального значения из массива ymas, xmas

 maxx:=xmas[0]; minx:=xmas[0];
 for i:=1 to ny-1 do begin
  if maxx < xmas[i] then maxx:=xmas[i];
  if minx > xmas[i] then minx:=xmas[i];
  end;

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 x:=minx;
 for i:=1 to 151 do begin
   unit4.graf.approximationSeries.AddXY(x,a*exp(b*ln(x)));
   x:=x+(maxx-minx)/150;
 end;

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(maxx-minx);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(minx-sclx,miny-scly);
 unit4.graf.scaleSeries.AddXY(maxx+sclx,maxy+scly);

 //Округление коэффициентов

 if b<>0 then begin
  step:=0; ex:=1;
  while abs(b)>=0.1 do begin b:=b/10; inc(step) end;
  while abs(b)<0.01 do begin b:=b*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then b:=round(b*100000)*ex/100000
             else b:=round(b*100000)/ex/100000;
 end;
 if a<>0 then begin
  step:=0; ex:=1;
  while abs(a)>=0.1 do begin a:=a/10; inc(step) end;
  while abs(a)<0.01 do begin a:=a*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then a:=round(a*100000)*ex/100000
             else a:=round(a*100000)/ex/100000;
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+ln(xmas[i]);
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ln(ymas[i])-ln(a)-b*ln(xmas[i]));

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(ln(xmas[i])-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0; ex:=1;
  while sa>=0.1 do begin sa:=sa/10; inc(step) end;
  while sa<0.01 do begin sa:=sa*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then sa:=round(sa*1000000)*ex/1000000
             else sa:=round(sa*1000000)/ex/1000000;
 end;

 //Заполнение таблицы

 unit4.graf.StringGrid1.RowCount:=1;
 unit4.graf.StringGrid1.RowCount:=nx+1;

 for i:=0 to nx-1 do begin
 with unit4.graf.StringGrid1 do begin
 cells[1,i+1]:=FloatToStr(xmas[i]);
 cells[2,i+1]:=FloatToStr(ymas[i]);
 cells[0,i+1]:=IntToStr(i+1);
 end;
 end;

 //Вывод функции и ее коэффициентов

 unit4.graf.Width:=972;
 unit4.graf.Height:=534;

 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+'*x^'+floattostr(b);

 unit4.graf.vidfunc.Caption:='Вид функции: y=a*x^b';

 unit4.graf.koffa.caption:='b = '+floattostr(b);
 unit4.graf.koffb.caption:='a = '+floattostr(a);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+255;
 unit4.graf.show;
end;

/////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure MNK1;

var
 xmas,ymas:dat;
 i,nx,ny,step,p:integer;
 helpstr:STRING;
 ex:longint;
 a11,a12,a21,a22,b1,b2,o:double;  // y=b/x+a
 a,b,sa:double; //коэффициенты уравнения
 xsr,sumch,sumz:double;
 x:double; //для построения графика аппроксимирующей функции
 maxX,minX,maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика


begin

 //Проверка на заполненность полей ввода

 if unit1.form1.wwodx.text='' then
 begin
 showmessage('Введите значения X'); exit;
 end;

 if unit1.form1.wwody.text='' then
 begin
 showmessage('Введите значения Y'); exit;
 end;

//замена '.' на ','

for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwodx.Lines[i]:=helpstr;
end;

for i:=0 to unit1.form1.wwody.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwody.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwody.Lines[i]:=helpstr;
end;

 //Инициализация массивов с введенными данными

 nx:=0;
 for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
  if unit1.form1.wwodx.Lines[i]<>'' then begin
  inc(nx); setlength(xmas,nx);
  try
    xmas[nx-1]:=strtofloat(unit1.form1.wwodx.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
  end;

 ny:=0;
 for i:=0 to unit1.form1.wwody.Lines.Count-1 do
  if unit1.form1.wwody.Lines[i]<>'' then begin
  inc(ny); setlength(ymas,ny);
  ymas[ny-1]:=strtofloat(unit1.form1.wwody.Lines[i])
  end;

 //Проверка на равенство nx = ny

 if nx<>ny then begin
 showmessage('Количество значений X и Y не совпадают'); exit;
 end;

 //Проверка на минимальное число координат

 if nx<3 then begin
 showmessage('Количество координат точек должно быть больше 2');
 exit;
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; a:=0; b:=0; o:=0;
 for i:=0 to nx-1 do
 begin
 a11:=a11+sqr(1/xmas[i]);
 a12:=a12+(1/xmas[i]);
 b1:=b1+(1/xmas[i])*ymas[i];
 b2:=b2+ymas[i];
 end;
 a22:=nx;
 a21:=a12;

 //Расчет коэффициентов для гиперболической аппроксимации

 o:=a11*a22-a21*a12;
 b:=((b1*a22-b2*a12)/o);
 a:=((a11*b2-a21*b1)/o);

 //Нахождение максимального и минимального значения из массива ymas, xmas

 maxx:=xmas[0]; minx:=xmas[0];
 for i:=1 to ny-1 do begin
  if maxx < xmas[i] then maxx:=xmas[i];
  if minx > xmas[i] then minx:=xmas[i];
  end;

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 x:=minx;
 for i:=1 to 151 do begin
   unit4.graf.approximationSeries.AddXY(x,b/x+a);
   x:=x+(maxx-minx)/150;
 end;

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(maxx-minx);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(minx-sclx,miny-scly);
 unit4.graf.scaleSeries.AddXY(maxx+sclx,maxy+scly);

 //Округление коэффициентов

 if b<>0 then begin
  step:=0; ex:=1;
  while abs(b)>=0.1 do begin b:=b/10; inc(step) end;
  while abs(b)<0.01 do begin b:=b*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then b:=round(b*100000)*ex/100000
             else b:=round(b*100000)/ex/100000;
 end;
 if a<>0 then begin
  step:=0; ex:=1;
  while abs(a)>=0.1 do begin a:=a/10; inc(step) end;
  while abs(a)<0.01 do begin a:=a*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then a:=round(a*100000)*ex/100000
             else a:=round(a*100000)/ex/100000;
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+1/xmas[i];
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ymas[i]-b/xmas[i]-a);

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(1/xmas[i]-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0; ex:=1;
  while sa>=0.1 do begin sa:=sa/10; inc(step) end;
  while sa<0.01 do begin sa:=sa*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then sa:=round(sa*1000000)*ex/1000000
             else sa:=round(sa*1000000)/ex/1000000;
 end;

 //Заполнение таблицы

 unit4.graf.StringGrid1.RowCount:=1;
 unit4.graf.StringGrid1.RowCount:=nx+1;

 for i:=0 to nx-1 do begin
 with unit4.graf.StringGrid1 do begin
 cells[1,i+1]:=FloatToStr(xmas[i]);
 cells[2,i+1]:=FloatToStr(ymas[i]);
 cells[0,i+1]:=IntToStr(i+1);
 end;
 end;

 //Вывод функции и ее коэффициентов

 unit4.graf.Width:=972;
 unit4.graf.Height:=534;

 if b<0 then
 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+' - '+floattostr(abs(b))+'/x'
 else
 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+' + '+floattostr(abs(b))+'/x';

 unit4.graf.vidfunc.Caption:='Вид функции: y=a+b/x';

 unit4.graf.koffa.caption:='b = '+floattostr(b);
 unit4.graf.koffb.caption:='a = '+floattostr(a);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+255;
 unit4.graf.show;
end;

///////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure MNK0;

var
 xmas,ymas:dat;
 i,nx,ny,step,p:integer;
 helpstr:string;
 ex:longint;
 a11,a12,a21,a22,b1,b2,o:double;  //y=b*x+a
 a,b,sa:double; //коэффициенты уравнения
 xsr,sumch,sumz:double;
 maxX,minX,maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика


begin

 //Проверка на заполненность полей ввода

 if unit1.form1.wwodx.text='' then
 begin
 showmessage('Введите значения X'); exit;
 end;

 if unit1.form1.wwody.text='' then
 begin
 showmessage('Введите значения Y'); exit;
 end;

 //замена '.' на ','

for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwodx.Lines[i]:=helpstr;
end;

for i:=0 to unit1.form1.wwody.Lines.Count-1 do
begin
  helpstr:=unit1.form1.wwody.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  unit1.form1.wwody.Lines[i]:=helpstr;
end;

 //Инициализация массивов с введенными данными

 nx:=0;
 for i:=0 to unit1.form1.wwodx.Lines.Count-1 do
  if unit1.form1.wwodx.Lines[i]<>'' then begin
  inc(nx); setlength(xmas,nx);
  try
    xmas[nx-1]:=strtofloat(unit1.form1.wwodx.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
  end;

 ny:=0;
 for i:=0 to unit1.form1.wwody.Lines.Count-1 do
  if unit1.form1.wwody.Lines[i]<>'' then begin
  inc(ny); setlength(ymas,ny);
  try
    ymas[ny-1]:=strtofloat(unit1.form1.wwody.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
  end;

 //Проверка на равенство nx = ny

 if nx<>ny then begin
 showmessage('Количество значений X и Y не совпадают'); exit;
 end;

 //Проверка на минимальное число координат

 if nx<3 then begin
 showmessage('Количество координат точек должно быть больше 2');
 exit;
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; a:=0; b:=0; o:=0;
 for i:=0 to nx-1 do
 begin
 a11:=a11+sqr(xmas[i]);
 a12:=a12+xmas[i];
 b1:=b1+xmas[i]*ymas[i];
 b2:=b2+ymas[i];
 end;
 a22:=nx;
 a21:=a12;

 //Расчет коэффициентов для линейной аппроксимации

 o:=a11*a22-a21*a12;
 b:=((b1*a22-b2*a12)/o);
 a:=((a11*b2-a21*b1)/o);

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 for i:=0 to nx-1 do
   unit4.graf.approximationSeries.AddXY(xmas[i],b*xmas[i]+a);

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Нахождение максимального и минимального значения из массива ymas, xmas

 maxx:=xmas[0]; minx:=xmas[0];
 for i:=1 to ny-1 do begin
  if maxx < xmas[i] then maxx:=xmas[i];
  if minx > xmas[i] then minx:=xmas[i];
  end;

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(maxx-minx);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(minx-sclx,miny-scly);
 unit4.graf.scaleSeries.AddXY(maxx+sclx,maxy+scly);

 //Округление коэффициентов

 if b<>0 then begin
  step:=0; ex:=1;
  while abs(b)>=0.1 do begin b:=b/10; inc(step) end;
  while abs(b)<0.01 do begin b:=b*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then b:=round(b*100000)*ex/100000
             else b:=round(b*100000)/ex/100000;
 end;
 if a<>0 then begin
  step:=0; ex:=1;
  while abs(a)>=0.1 do begin a:=a/10; inc(step) end;
  while abs(a)<0.01 do begin a:=a*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then a:=round(a*100000)*ex/100000
             else a:=round(a*100000)/ex/100000;
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+xmas[i];
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ymas[i]-b*xmas[i]-a);

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(xmas[i]-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0; ex:=1;
  while sa>=0.1 do begin sa:=sa/10; inc(step) end;
  while sa<0.01 do begin sa:=sa*10; dec(step) end;
  if step<>0 then for i:=1 to abs(step) do ex:=ex*10;
  if step>=0 then sa:=round(sa*1000000)*ex/1000000
             else sa:=round(sa*1000000)/ex/1000000;
 end;

 //Заполнение таблицы

 unit4.graf.StringGrid1.RowCount:=1;
 unit4.graf.StringGrid1.RowCount:=nx+1;

 for i:=0 to nx-1 do begin
 with unit4.graf.StringGrid1 do begin
 cells[1,i+1]:=FloatToStr(xmas[i]);
 cells[2,i+1]:=FloatToStr(ymas[i]);
 cells[0,i+1]:=IntToStr(i+1);
 end;
 end;

 //Вывод функции и ее коэффициентов

 unit4.graf.Width:=972;
 unit4.graf.Height:=534;

 if b<0 then
 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+' - '+floattostr(abs(b))+'*x'
 else
 unit4.graf.yravnenie.caption:='y = '+Floattostr(a)+' + '+floattostr(abs(b))+'*x';

 unit4.graf.vidfunc.Caption:='Вид функции: y=a+b*x';

 unit4.graf.koffa.caption:='b = '+floattostr(b);
 unit4.graf.koffb.caption:='a = '+floattostr(a);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+255;
 unit4.graf.show;
end;

//////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure TForm1.wwodClick(Sender: TObject);

Type
 {dat1=array of integer;}
 Students=array[2..31] of real;
 eror=record
     numb: double;
     order: integer;
     zer: boolean;
 end;

 const
 st: Students=(12.706, 4.303, 3.182, 2.776, 2.571, 2.447, 2.365, 2.306, 2.262,
 2.228, 2.201, 2.179, 2.16, 2.145, 2.131, 2.12, 2.11, 2.101, 2.093, 2.086, 2.08,
 2.074, 2.069, 2.064, 2.06, 2.056, 2.052, 2.048, 2.045, 2.042);

var
 ex:longint;
 n,i,j,ext,p:integer;
 mean,sum,sko:double;
 meas,meas1,meas2,meas11,meas22:dat;
 miss:eror;
 helpstr:string;

begin

 //Проверка режима работы

 if (mnkobr.Checked) and (combobox1.ItemIndex=0) then begin mnk0; exit end;
 if (mnkobr.Checked) and (combobox1.ItemIndex=1) then begin mnk1; exit end;
 if (mnkobr.Checked) and (combobox1.ItemIndex=2) then begin mnk2; exit end;
 if (mnkobr.Checked) and (combobox1.ItemIndex=3) then begin mnk3; exit end;
 if (mnkobr.Checked) and (combobox1.ItemIndex=4) then begin mnk4; exit end;

 //Проверка на заполненность полей ввода

 if wwodx.text='' then
 begin
 showmessage('Введите результаты измерений'); exit;
 end;

//замена '.' на ','

for i:=0 to wwodx.Lines.Count-1 do
begin
  helpstr:=wwodx.Lines[i];
  for p:=1 to length(helpstr) do
   if helpstr[p]='.' then helpstr[p]:=',';
  wwodx.Lines[i]:=helpstr;
end;

//Инициализация массива с введенными данными

 n:=0;
 for i:=0 to wwodx.Lines.Count-1 do
  if wwodx.Lines[i]<>'' then begin
  inc(n); setlength(meas,n);
  try
    meas[n-1]:=strtofloat(wwodx.Lines[i]);
  except
    showmessage('Ошибка в введенных вами данных');
    exit;
  end;
 end;

//Проверка на количество измерений

if n<2 then begin
showmessage('Введите количество измерений n>1'); exit
end;

//Инициализация массивов с разностью и (разностью)^2

setlength(meas1,n);
setlength(meas2,n);
mean:=0;
for i:=0 to n-1 do mean:=mean+meas[i]; //Расчет среднего значения
mean:=mean/n;
for i:=0 to n-1 do
begin meas1[i]:=meas[i]-mean; meas2[i]:=sqr(meas1[i]) end;

//Расчет СКО

sum:=0;
for i:=0 to n-1 do sum:=sum+meas2[i];
sko:=sqrt(sum/(n*(n-1)));

//Округление значений в массивах с разностью и (разностью)^2

setlength(meas11,n); setlength(meas22,n);
for i:=0 to n-1 do begin
 meas11[i]:=round(meas1[i]*1000000)/1000000;
 meas22[i]:=round(meas2[i]*10000000)/10000000;
 end;

//Расчет случайной погрешности

miss.numb:=st[n]*sko;

//Ограничение для статистической обработки

if miss.numb = 0 then begin
showmessage('Невозможно провести стат. обработку с этими данными'); exit;
end;

//Округление cлучайной погрешности, sko, среднего

ext:=0; ex:=1;
while miss.numb >= 1000 do begin miss.numb:=miss.numb/10; inc(ext) end;
while miss.numb < 100 do begin miss.numb:=miss.numb*10; dec(ext) end;
miss.numb:=round(miss.numb);
if ext<>0 then for i:=1 to abs(ext) do ex:=ex*10;
if ext>=0 then miss.numb:=miss.numb*ex
          else miss.numb:=miss.numb/ex;


ext:=0; ex:=1;
while sko >= 10000 do begin sko:=sko/10; inc(ext) end;
while sko < 1000 do begin sko:=sko*10; dec(ext) end;
sko:=round(sko);
if ext<>0 then for i:=1 to abs(ext) do ex:=ex*10;
if ext>=0 then sko:=sko*ex
          else sko:=sko/ex;

ext:=0; ex:=1;
while abs(mean) >= 10000 do begin mean:=mean/10; inc(ext) end;
while abs(mean) < 1000 do begin mean:=mean*10; dec(ext) end;
mean:=round(mean);
if ext<>0 then for i:=1 to abs(ext) do ex:=ex*10;
if ext>=0 then mean:=mean*ex
          else mean:=mean/ex;

//Задание количества строк и их заполнение

StringGrid1.RowCount:=1;
StringGrid1.RowCount:=n+6;

j:=0;
for i:=1 to n do begin
StringGrid1.Cells[0,i]:=inttostr(j+1);
StringGrid1.Cells[1,i]:=floattostr(meas[j]);
StringGrid1.Cells[2,i]:=floattostr(meas11[j]);
StringGrid1.Cells[3,i]:=floattostr(meas22[j]);
inc(j);
end;

stringgrid1.Cells[1,StringGrid1.RowCount-4]:='Xsr =';
stringgrid1.Cells[2,StringGrid1.RowCount-4]:=FloatToStr(mean);
stringgrid1.Cells[1,StringGrid1.RowCount-3]:='t = ';
stringgrid1.Cells[2,StringGrid1.RowCount-3]:=FloatToStr(st[n]);
stringgrid1.Cells[1,StringGrid1.RowCount-2]:='SKO =';
stringgrid1.Cells[2,StringGrid1.RowCount-2]:=FloatToStr(sko);
stringgrid1.Cells[1,StringGrid1.RowCount-1]:='случ. погр. =';
stringgrid1.Cells[2,StringGrid1.RowCount-1]:='±'+FloatToStr(miss.numb);
end;



procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 if (unit1.form1.stringgrid1.rowcount = 1) and
    (unit4.graf.stringgrid1.rowcount = 1) then exit;
 CanClose:=MessageDlg('Вы точно хотите закрыть программу?', mtConfirmation,
 [mbYes,mbNo],0)=mrYes;
end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  Unit5.Form4.show;
end;


procedure TForm1.Panel1Click(Sender: TObject);
var
 i:integer;
begin

  if statobr.Checked then begin
   mnkobr.Checked:=true;
   label4.Left:=64;
   label4.caption:='МНК';
   wwedite.Caption:='';
   wwody.Height:=321;
   wwodx.width:=120;
   labelX.Caption:='X';
   labely.Caption:='Y';
   wwody.Top:=112;
   label5.caption:='Вид функции';
   combobox1.left:=110;
  end
  else begin
   statobr.Checked:=true;
   label4.Left:=30;
   label4.caption:='Расчет среднего';
   wwedite.Caption:='Введите результаты измерений';
   wwody.Height:=0;
   wwody.Top:=0;
   wwodx.width:=248;
   labelX.Caption:='';
   labely.Caption:='';
   label5.caption:='p = 0,95';
   combobox1.left:=1120;
   if wwodx.Lines.Count>=30 then
   for i:=wwodx.lines.Count downto 30 do wwodx.lines.Delete(i);
  end;

end;


procedure TForm1.statobrClick(Sender: TObject);
var
 i:integer;
begin
   statobr.Checked:=true;
   label4.Left:=30;
   label4.caption:='Расчет среднего';
   wwedite.Caption:='Введите результаты измерений';
   wwody.Height:=0;
   wwody.Top:=0;
   wwodx.width:=248;
   labelX.Caption:='';
   labely.Caption:='';
   label5.caption:='p = 0,95';
   combobox1.left:=1120;
   if wwodx.Lines.Count>=30 then
   for i:=wwodx.lines.Count downto 30 do wwodx.lines.Delete(i);
end;

procedure TForm1.mnkobrClick(Sender: TObject);
begin
   mnkobr.Checked:=true;
   label4.Left:=64;
   label4.caption:='МНК';
   wwedite.Caption:='';
   wwody.Height:=321;
   wwodx.width:=120;
   labelX.Caption:='X';
   labely.Caption:='Y';
   wwody.Top:=112;
   label5.caption:='Вид функции';
   combobox1.left:=110;
end;

procedure TForm1.graphikClick(Sender: TObject);
begin
  unit4.graf.Left:=form1.Left+255;
  unit4.graf.Top:=form1.top+80;
  unit4.graf.Width:=972;
  unit4.graf.Height:=534;
  unit4.graf.show;
end;

procedure TForm1.ochistiClick(Sender: TObject);
begin
  wwodx.Clear;
  wwody.Clear;
end;

procedure TForm1.aboutprogClick(Sender: TObject);
begin
 unit2.form2.show;
end;

procedure TForm1.extiClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.wwodxChange(Sender: TObject);
var
 i:integer;
begin

 if statobr.Checked then
   if wwodx.Lines.Count>=30 then
   for i:=wwodx.lines.Count downto 30 do wwodx.lines.Delete(i);

 if mnkobr.Checked then
   if wwodx.Lines.Count>=50 then
   for i:=wwodx.lines.Count downto 50 do wwodx.lines.Delete(i);

end;


procedure TForm1.wwodxKeyPress(Sender: TObject; var Key: char);
begin
if statobr.Checked then
  if wwodx.Lines.Count>29 then if key=#13 then key:=chr(0);

if mnkobr.Checked then
  if wwodx.Lines.Count>49 then if key=#13 then key:=chr(0);

    case key of
       '0'..'9',#8,#44,#13:;
       #46: key:= #44;
       else key:=chr(0);
    end;
end;

procedure TForm1.wwodyChange(Sender: TObject);
var
 i:integer;
begin
 if wwody.Lines.Count>=50 then
 for i:=wwody.lines.Count downto 50 do wwody.lines.Delete(i);
end;

procedure TForm1.wwodyKeyPress(Sender: TObject; var Key: char);
begin
 if wwodx.Lines.Count>49 then if key=#13 then key:=chr(0);
 case key of
    '0'..'9',#8,#44,#13:;
    #46: key:= #44;
    else key:=chr(0);
 end;
end;


end.

