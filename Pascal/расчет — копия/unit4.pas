unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, TASources, Forms, Controls,
  Graphics, Dialogs, Grids, ExtCtrls, StdCtrls;

type

  { Tgraf }

  Tgraf = class(TForm)
    aproksim: TLabel;
    Chart1: TChart;
    approximationSeries: TLineSeries;
    scaleSeries: TLineSeries;
    experimentalPoints: TLineSeries;
    koffa: TLabel;
    koffb: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    skoa: TLabel;
    StringGrid1: TStringGrid;
    vidfunc: TLabel;
    yravnenie: TLabel;
  private

  public

  end;

var
  graf: Tgraf;

implementation

{$R *.lfm}

end.

