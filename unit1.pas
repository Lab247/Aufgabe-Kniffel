unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TfrmDice }

  TfrmDice = class(TForm)
    btnPlay: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    procedure btnPlayClick(Sender: TObject);
  private

  public

  end;

var
  frmDice: TfrmDice;

implementation

{$R *.lfm}

{ TfrmDice }

procedure TfrmDice.btnPlayClick(Sender: TObject);
var
  dice : array[1..5] of integer;
  i    : integer;
begin
     randomize;

     for i := 1 to 5 do
         begin
           dice[i]:=random(6)+1;
           writeln(i,' ',dice[i]);
         end;

     pnl1.caption := IntToStr(dice[1]);
     pnl2.caption := IntToStr(dice[2]);
     pnl3.caption := IntToStr(dice[3]);
     pnl4.caption := IntToStr(dice[4]);
     pnl5.caption := IntToStr(dice[5]);

end;

end.

