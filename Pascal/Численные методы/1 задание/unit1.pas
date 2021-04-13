unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


function f(x:double):double;    //Исследуемая функция
 begin
   f:=x+cos(x)*sin(2*x)-3/7;
 end;



procedure TForm1.Button1Click(Sender: TObject);   //Метод хорд
//Вторая производная отрицательна на итервале

 var
   a,b,x,eps,min:double;
   n:integer;
   work:boolean;

begin

 eps:=StrToFloat(edit1.Text);
 a:=0.1;
 b:=0.2;
 work:=true;
 min:=1+2*cos(b)*cos(2*b)-sin(b)*sin(2*b); //Минимум производной
 x:=b;
 n:=0;

 while work do
  begin
   inc(n);
   x:=a-(f(a)*(x-a))/(f(x)-f(a));
   if (abs(f(x))/min)<eps then work:=false;
  end;

 label1.Caption:='x= '+FloatToStr(x)+', n= '+IntToStr(n);

end;


Function fi(x,maxF:double):double;
 begin
  fi:=x-f(x)/(0.9*maxF); //L=maxF
 end;

procedure TForm1.Button2Click(Sender: TObject);  //Метод итераций

 var
   a,b,x,eps,maxF,minF,q,x1:double;
   n:integer;
   work:boolean;

begin

 eps:=StrToFloat(edit2.Text);
 a:=0.1;
 b:=0.2;
 work:=true;
 minF:=1+2*cos(b)*cos(2*b)-sin(b)*sin(2*b);  //минимум производной
 maxF:=1+2*cos(a)*cos(2*a)-sin(a)*sin(2*a);  //максимум производной
 if (1/9)>abs(1-minf/(0.9*maxf)) then q:=1/9
                                 else q:=abs(1-minf/(0.9*maxf));
 x:=b;
 n:=0;

 while work do
  begin
   inc(n);
   x1:=x;
   x:=fi(x,maxF);
   if (abs(x1-x)*q/(1-q))<eps then work:=false;
  end;

 label2.Caption:='x= '+FloatToStr(x)+', n= '+IntToStr(n);

end;

end.

