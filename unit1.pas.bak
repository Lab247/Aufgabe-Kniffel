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
    btnZufallszahlen: TButton;
    btnBubbleSort: TButton;
    edtAnzahl: TEdit;
    lblBubbleSort: TLabel;
    lblAnzahl: TLabel;
    lblUnsortiert: TLabel;
    ListBoxBubbleSort: TListBox;
    ListBoxUnsortiert: TListBox;
    pnlSortHead: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    procedure btnBubbleSortClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnZufallszahlenClick(Sender: TObject);
  private

  public

  end;

var
  frmDice: TfrmDice;
  Anzahl : Integer;
  ArrayZahlen : array of Integer; //offenes Array für Zahlen

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

procedure TfrmDice.btnBubbleSortClick(Sender: TObject);
var i,j,Merker : integer;
begin
     for i:=Anzahl downto 1 do
         for j:=0 to i-1 do
             if ArrayZahlen[j] > ArrayZahlen[j+1] then
                begin
                     Merker := ArrayZahlen[j];
                     ArrayZahlen[j] := ArrayZahlen[j+1];
                     ArrayZahlen[j+1] := Merker;
                end;
     for i:=0 to Anzahl-1 do
         ListBoxBubbleSort.Items.Insert(i,IntToStr(ArrayZahlen[i]));
end;

procedure TfrmDice.btnZufallszahlenClick(Sender: TObject);
var i : Integer;

begin
     Anzahl := StrToInt(edtAnzahl.Text); //Anzahl auslesen
     setLength(ArrayZahlen,Anzahl);      //Array auf Größe Anzahl setzen
     randomize;                          //random init
     for i := 0 to Anzahl-1 do           //Schleife füllen des arrays
         Begin
           //Zufallszahl in Array
           ArrayZahlen[i] := Random(Anzahl)+1;
           //Zahl in Listbox schreiben
           ListBoxUnsortiert.Items.Insert(i,IntToStr(ArrayZahlen[i]));
         end;

end;




end.

