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
  dice : array[1..5] of integer; //Array für 5 Würfelwerte
  i,j,temp : integer;            //Laufvariablen

begin
  randomize;                     //Startwert erzeugen

   for i := 1 to 5 do            //5x würfeln
       begin
         dice[i]:=random(6)+1;   //Zufallszahl zw 1..6 erzeugen, in Array schreiben
       end;

   //Debugausgabe der Werte
   writeln(dice[1],' ',dice[2],' ',dice[3],' ',dice[4],' ',dice[5]);

  //sortieren
   //for j := 4 downto 1 do
   //  for i := 1 to j do
   //      if dice[i] > dice[i+1] then
   //         begin
   //              temp := dice[i];
   //              dice[i] := dice[i+1];
   //              dice[i+1] := temp;
   //         end;

  pnl1.caption := IntToStr(dice[1]);//Werte auf Panals anzeigen
  pnl2.caption := IntToStr(dice[2]);
  pnl3.caption := IntToStr(dice[3]);
  pnl4.caption := IntToStr(dice[4]);
  pnl5.caption := IntToStr(dice[5]);

end;




end.

