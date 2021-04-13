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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    opcii: TMenuItem;
    regim: TMenuItem;
    statobr: TMenuItem;
    mnkobr: TMenuItem;
    graphik: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    wwod: TButton;
    sohrani: TButton;
    ochisti: TButton;
    resultat: TEdit;
    pogreh: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    aboutprog: TMenuItem;
    exti: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure Label5ChangeBounds(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure statobrClick(Sender: TObject);
    procedure mnkobrClick(Sender: TObject);
    procedure graphikClick(Sender: TObject);
    procedure ochistiClick(Sender: TObject);
    procedure pogrehKeyPress(Sender: TObject; var Key: char);
    procedure resultatKeyPress(Sender: TObject; var Key: char);
    procedure sohraniClick(Sender: TObject);
    procedure wwodClick(Sender: TObject);
    procedure aboutprogClick(Sender: TObject);
    procedure extiClick(Sender: TObject);

  private

  public

  end;


var
  Form1: TForm1;

implementation
uses unit2, unit4;

{$R *.lfm}

{ TForm1 }
type
  dat=array of double;

procedure MNK;

var
 xmas,ymas,xmas1,ymas1:dat;
 resx,resy,ww1:string;
 lresx,lresy,i,nx,ny,step:integer;
 a11,a12,a21,a22,b1,b2,o:double;  //y=a*x+b
 t,r:double; //t=a r=b
 xsr,sumch,sumz,sa:double;
 maxY,minY,sclY,sclX:real; //Коэффициенты масштабирования графика

begin

 //Проверка на заполненность полей ввода

 if form1.resultat.text='' then
 begin
 showmessage('Введите координаты экспериментальных точек (X)'); exit;
 end;

 if form1.pogreh.text='' then
 begin
 showmessage('Введите координаты экспериментальных точек (Y)'); exit;
 end;

 //Замена в введенных строках символа '.' на ','

 resx:=form1.resultat.text;
 lresx:=length(resx);
 resy:=form1.pogreh.text;
 lresy:=length(resy);

 for i:=1 to lresx do if resx[i]='.' then resx[i]:=','
                                     else continue;

 for i:=1 to lresy do if resy[i]='.' then resy[i]:=','
                                     else continue;

 //Инициализация массивов с введенными данными

 i:=1; nx:=0;
 while i<=lresx do
 begin
  ww1:='';
  if resx[i]=' ' then begin inc(i); continue end
                else while (resx[i]<>' ')and(i<=lresx) do
   begin ww1:=ww1+resx[i]; inc(i) end;
  inc(nx); setlength(xmas,nx);
  xmas[nx-1]:=strtofloat(ww1);
 end;

 i:=1; ny:=0;
 while i<=lresy do
 begin
  ww1:='';
  if resy[i]=' ' then begin inc(i); continue end
                else while (resy[i]<>' ')and(i<=lresy) do
   begin ww1:=ww1+resy[i]; inc(i) end;
  inc(ny); setlength(ymas,ny);
  ymas[ny-1]:=strtofloat(ww1);
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

 //Упорядочение массива xmas и перестановка значений в ymas*

 setlength(ymas1,nx); setlength(xmas1,nx);

 for i:=0 to nx-1 do begin
  xmas1[i]:=xmas[i];
  ymas1[i]:=ymas[i];
 end;

 if xmas[0] > xmas[1] then
 for i:=0 to nx-1 do begin
  xmas[i]:=xmas1[nx-i];
  ymas[i]:=ymas1[nx-i];
 end;

 //Расчет коэффициентов для крамеровских уравнений

 a11:=0; a12:=0; b1:=0; b2:=0; a21:=0; a22:=0; r:=0; t:=0; o:=0;
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
 t:=((b1*a22-b2*a12)/o); //  t=a
 r:=((a11*b2-a21*b1)/o); //  r=b

 //Построение графика без округленных коэффициентов

 unit4.graf.approximationSeries.clear;
 unit4.graf.experimentalPoints.Clear;

 unit4.graf.approximationSeries.AddXY(xmas[0],t*xmas[0]+r);
 unit4.graf.approximationSeries.AddXY(xmas[nx-1],t*xmas[nx-1]+r);

 for i:=0 to nx-1 do
   unit4.graf.experimentalPoints.AddXY(xmas[i],ymas[i]);

 //Нахождение максимального и минимального значения из массива ymas

 maxy:=ymas[0]; miny:=ymas[0];
 for i:=1 to ny-1 do begin
  if maxy < ymas[i] then maxy:=ymas[i];
  if miny > ymas[i] then miny:=ymas[i];
  end;

 //Масштабирование графика

 scly:=0.05*(maxy-miny);
 sclx:=0.05*(xmas[nx-1]-xmas[0]);

 unit4.graf.scaleSeries.Clear;
 unit4.graf.scaleSeries.AddXY(xmas[0]-sclx,ymas[0]-scly);
 unit4.graf.scaleSeries.AddXY(xmas[nx-1]+sclx,ymas[nx-1]+scly);

 //Округление коэффициентов

 if t<>0 then begin
  step:=0;
  while abs(t)>=0.1 do begin t:=t/10; inc(step) end;
  while abs(t)<0.01 do begin t:=t*10; dec(step) end;   //a
  t:=(t/abs(t))*round(abs(t)*1e5)/1e5*exp(step*ln(10));
 end;
 if r<>0 then begin
  step:=0;
  while abs(r)>=0.1 do begin r:=r/10; inc(step) end;
  while abs(r)<0.01 do begin r:=r*10; dec(step) end;  //b
  r:=(r/abs(r))*round(abs(r)*1e5)/1e5*exp(step*ln(10));
 end;

 //Расчет SKO для коэффициента при x

 xsr:=0;  //cреднее x
 for i:=0 to nx-1 do xsr:=xsr+xmas[i];
 xsr:=xsr/nx;

 sumch:=0;  //Сумма числителя в формуле SKO
 for i:=0 to ny-1 do sumch:=sumch+sqr(ymas[i]-t*xmas[i]-r);

 sumz:=0;   //Сумма знаменателя в формуле SKO
 for i:=0 to nx-1 do sumz:=sumz+sqr(xmas[i]-xsr);

 sa:=sqrt(sumch/((nx-2)*sumz));

 //Округление SKO

 if sa<>0 then begin
  step:=0;
  while abs(sa)>=0.1 do begin sa:=sa/10; inc(step) end;
  while abs(sa)<0.01 do begin sa:=sa*10; dec(step) end;
  sa:=(sa/abs(sa))*round(abs(sa)*1e6)/1e6*exp(step*ln(10));
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

 unit4.graf.Show;
 if r<0 then
 unit4.graf.yravnenie.caption:='y = '+floattostr(t)+'*x - '+Floattostr(abs(r))
 else
 unit4.graf.yravnenie.caption:='y = '+floattostr(t)+'*x + '+Floattostr(abs(r));

 unit4.graf.koffa.caption:='a = '+floattostr(t);
 unit4.graf.koffb.caption:='b = '+floattostr(r);
 unit4.graf.skoa.caption:='SKO = '+floattostr(sa);

 unit4.graf.top:=unit1.form1.Top+80;
 unit4.graf.left:=unit1.form1.left+130;
 unit4.graf.show;
end;



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
 n,i,j,ww,si,ok,ext{,max,max1,max2}:integer;
 ran,sist,mean,sum,sko:double;
 meas,meas1,meas2:dat;
 {mea,mea1,mea2:dat1;}
 okr,q,wwo,ww1,sist1:string;
 miss:eror;

begin

 //Проверка режима работы

 if mnkobr.Checked then begin mnk; exit end;

 //Проверка на заполненность полей ввода

 if resultat.text='' then
 begin
 showmessage('Введите результаты измерений'); exit;
 end;

 if pogreh.text='' then
 begin
 showmessage('Введите систематическую погрешность'); exit;
 end;

wwo:=resultat.Text;
ww:=length(wwo);
sist1:=pogreh.Text;
si:=length(sist1);

//Замена в введенных строках символа '.' на ','

for i:=1 to si do if sist1[i]='.' then sist1[i]:=','
                                  else continue;

for i:=1 to ww do if wwo[i]='.' then wwo[i]:=','
                                else continue;

sist:=StrToFloat(sist1);

//Инициализация массива с введенными данными

i:=1; n:=0;
while i<=ww do
 begin
  ww1:='';
  if wwo[i]=' ' then begin inc(i); continue end
                else while (wwo[i]<>' ')and(i<=ww) do
   begin ww1:=ww1+wwo[i]; inc(i) end;
  inc(n); setlength(meas,n);
  meas[n-1]:=strtofloat(ww1);
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

//Округление значений в массивах с разностью и (разностью)^2
{
for i:=0 to n-1 do begin
  ext:=0;
  while abs(meas1[i])>=0.1 do begin meas1[i]:=meas1[i]/10; inc(ext) end;
  while abs(meas1[i])<0.01 do begin meas1[i]:=meas1[i]*10; dec(ext) end;
  meas1[i]:=meas1[i]/abs(meas1[i])*round(abs(meas1[i])*1e4)/1e4*exp(ext*ln(10));
end;

for i:=0 to n-1 do begin
  ext:=0;
  while meas2[i]>=0.1 do begin meas2[i]:=meas2[i]/10; inc(ext) end;
  while meas2[i]<0.01 do begin meas2[i]:=meas2[i]*10; dec(ext) end;
  meas2[i]:=(meas2[i]/abs(meas2[i]))*round(abs(meas2[i])*1e5)/1e5*exp(ext*ln(10));
end;
}
//Расчет СКО

sum:=0;
for i:=0 to n-1 do sum:=sum+meas2[i];
sko:=sqrt(sum/(n*(n-1)));

//Расчет случайной погрешности

ran:=st[n]*sko;

//Вычисление полной погрешности

miss.numb:=sqrt(sqr(ran)+sqr(sist));

//Ограничение для статистической обработки

if miss.numb = 0 then begin
showmessage('Невозможно провести стат. обработку с этими данными'); exit;
end;

//Округление полной погрешности

miss.zer:=false;
miss.order:=0;
while miss.numb>=0.1 do begin miss.numb:=miss.numb/10; inc(miss.order) end;
while miss.numb<0.01 do begin miss.numb:=miss.numb*10; dec(miss.order) end;
okr:=FloatToStr(miss.numb)+'00';
ok:=length(okr);

for i:=4 to ok do
 case okr[i] of

  '9': if okr[i+1]<='4'
    then begin
    for j:=i+1 to ok do okr[j]:='0'; break
    end
    else begin
    q:=IntToStr(StrToInt(okr[i-1])+1);
    okr[i-1]:=q[1];
    okr[i]:='0';
    for j:=i+1 to ok do okr[j]:='0'; miss.zer:=true; break
    end;

  '4'..'8': if okr[i+1]<='4'
    then begin
    for j:=i+1 to ok do okr[j]:='0'; break
    end
    else begin
    q:=IntToStr(StrToInt(okr[i])+1);
    okr[i]:=q[1];
    for j:=i+1 to ok do okr[j]:='0'; break
    end;

  '1'..'3': case okr[i+1] of

     '9': if okr[i+2]<='4'
       then begin
       for j:=i+2 to ok do okr[j]:='0'; break
       end
       else begin
       q:=IntToStr(StrToInt(okr[i])+1);
       okr[i]:=q[1];
       okr[i+1]:='0';
       for j:=i+2 to ok do okr[j]:='0'; miss.zer:=true; break
       end;

     '1'..'8': if okr[i+2]<='4'
       then begin
       for j:=i+2 to ok do okr[j]:='0'; break
       end
       else begin
       q:=IntToStr(StrToInt(okr[i+1])+1);
       okr[i+1]:=q[1];
       for j:=i+2 to ok do okr[j]:='0'; break
       end;

     '0': if okr[i+2]<='4'
       then begin
       for j:=i+2 to ok do okr[j]:='0'; miss.zer:=true; break
       end
       else begin
       q:=IntToStr(StrToInt(okr[i+1])+1);
       okr[i+1]:=q[1];
       for j:=i+2 to ok do okr[j]:='0'; break
       end;
  end;
 end;

miss.numb:=StrToFloat(okr)*exp(miss.order*ln(10));

//Задание количества строк и их заполнение

StringGrid1.RowCount:=StringGrid1.RowCount+n+8;

j:=0;
for i:=(StringGrid1.RowCount-n-8) to StringGrid1.RowCount-8-1 do begin
StringGrid1.Cells[0,i]:=inttostr(j+1);
StringGrid1.Cells[1,i]:=floattostr(meas[j]);
StringGrid1.Cells[2,i]:=floattostr(meas1[j]);
StringGrid1.Cells[3,i]:=floattostr(meas2[j]);
inc(j);
end;

stringgrid1.Cells[1,StringGrid1.RowCount-7]:='Xsr =';
stringgrid1.Cells[2,StringGrid1.RowCount-7]:=FloatToStr(mean);
stringgrid1.Cells[1,StringGrid1.RowCount-6]:='t = ';
stringgrid1.Cells[2,StringGrid1.RowCount-6]:=FloatToStr(st[n]);
stringgrid1.Cells[1,StringGrid1.RowCount-5]:='SKO =';
stringgrid1.Cells[2,StringGrid1.RowCount-5]:=FloatToStr(sko);
stringgrid1.Cells[1,StringGrid1.RowCount-4]:='случ. погр. =';
stringgrid1.Cells[2,StringGrid1.RowCount-4]:='±'+FloatToStr(ran);
stringgrid1.Cells[1,StringGrid1.RowCount-3]:='сист. погр. =';
stringgrid1.Cells[2,StringGrid1.RowCount-3]:='±'+FloatToStr(sist);
stringgrid1.Cells[1,StringGrid1.RowCount-2]:='полная погр. =';
stringgrid1.Cells[2,StringGrid1.RowCount-2]:='±'+FloatToStr(miss.numb);

if miss.zer and (miss.numb<10) and (miss.numb>=1) then
stringgrid1.Cells[2,StringGrid1.RowCount-2]:='±'+FloatToStr(miss.numb)+',0';

if miss.zer and (miss.numb<1) then
stringgrid1.Cells[2,StringGrid1.RowCount-2]:='±'+FloatToStr(miss.numb)+'0';




{
//Создание массивов

setlength(mea,n);
setlength(mea1,n);
setlength(mea2,n);
for i:=0 to n-1 do begin
mea[i]:=length(FloatToStr(meas[i]));
mea1[i]:=length(FloatToStr(meas1[i]));
mea2[i]:=length(FloatToStr(meas2[i]));
end;

//Вычисление маскимальных чисел из массивов

max:=mea[0];
for i:=1 to n-1 do if max<mea[i] then max:=mea[i] else continue;

max1:=mea1[0];
for i:=1 to n-1 do if max1<mea1[i] then max1:=mea1[i] else continue;

max2:=mea2[0];
for i:=1 to n-1 do if max2<mea2[i] then max2:=mea2[i] else continue;
}


end;



procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 if (unit1.form1.stringgrid1.rowcount = 1) and
    (unit4.graf.stringgrid1.rowcount = 1) then exit;
 CanClose:=MessageDlg('Вы уверены?', mtConfirmation,
 [mbYes,mbNo],0)=mrYes;
end;

procedure TForm1.Label5ChangeBounds(Sender: TObject);
begin
   if (statobr.Checked) and (pogreh.Text='') then pogreh.Text:='0';
  if (mnkobr.Checked) and (pogreh.text='0') then pogreh.Text:='';
end;


procedure TForm1.Panel1Click(Sender: TObject);
begin

  if statobr.Checked then begin
   mnkobr.Checked:=true;
   label1.Caption:='Введите координаты экспериментальных точек (X)';
   label2.caption:='Введите координаты экспериментальных точек (Y)';
   label4.Left:=38;
   label4.caption:='МНК';
   label5.Caption:='';
  end
  else begin
   statobr.Checked:=true;
   label1.Caption:='Введите результаты измерений';
   label2.caption:='Введите систематическую погрешность';
   label4.Left:=4;
   label4.caption:='Статистическая';
   label5.Caption:='обработка';
  end;

end;


procedure TForm1.statobrClick(Sender: TObject);
begin
  statobr.Checked:=true;
  label1.Caption:='Введите результаты измерений';
  label2.caption:='Введите систематическую погрешность';
  label4.Left:=4;
  label4.caption:='Статистическая';
  label5.Caption:='обработка';
end;

procedure TForm1.mnkobrClick(Sender: TObject);
begin
 mnkobr.Checked:=true;
 label1.Caption:='Введите координаты экспериментальных точек (X)';
 label2.caption:='Введите координаты экспериментальных точек (Y)';
 label4.Left:=38;
 label4.caption:='МНК';
 label5.Caption:='';
end;

procedure TForm1.graphikClick(Sender: TObject);
begin
  unit4.graf.show;
  unit4.graf.top:=unit1.form1.Top+80;
  unit4.graf.left:=unit1.form1.left+130;
end;



procedure TForm1.ochistiClick(Sender: TObject);
begin
  stringgrid1.RowCount:=1;
end;

procedure TForm1.pogrehKeyPress(Sender: TObject; var Key: char);
begin
  if mnkobr.Checked
    then
     case key of
       '0'..'9',#8,#32,#44,#46: ;
        else key:=chr(0);
     end
    else
    case key of
       '0'..'9',#8,#44,#46: ;
        else key:=chr(0);
     end;
end;

procedure TForm1.resultatKeyPress(Sender: TObject; var Key: char);
begin
  case key of
     '0'..'9',#8,#32,#44,#46: ;
     else key:=chr(0);
  end;
end;

procedure TForm1.sohraniClick(Sender: TObject);

begin

end;


procedure TForm1.aboutprogClick(Sender: TObject);
begin
 unit2.form2.show;
end;

procedure TForm1.extiClick(Sender: TObject);
begin
  close;
end;

end.

