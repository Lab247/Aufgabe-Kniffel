unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TfrmDice }

  TfrmDice = class(TForm)
    btnSelectSort: TButton;
    btnPlay: TButton;
    btnZufallszahlen: TButton;
    btnBubbleSort: TButton;
    edtCounter: TEdit;
    edtAnzahl: TEdit;
    lblBubbleSort: TLabel;
    lblAnzahl: TLabel;
    lblSelectSort: TLabel;
    lblUnsortiert: TLabel;
    ListBoxBubbleSort: TListBox;
    ListBoxSelectSort: TListBox;
    ListBoxUnsortiert: TListBox;
    pnlSortHead: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    procedure btnBubbleSortClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnSelectSortClick(Sender: TObject);
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
  i,j,temp,counter : integer;            //Laufvariablen
  pasch : boolean;

begin
  randomize;                     //Startwert erzeugen
  pasch := false;
  //counter := 0;

  repeat
     //counter := counter +1;
     for i := 1 to 5 do            //5x würfeln
         begin
           dice[i]:=random(6)+1;   //Zufallszahl zw 1..6 erzeugen, in Array schreiben
         end;

     //Debugausgabe der Werte
     writeln(dice[1],' ',dice[2],' ',dice[3],' ',dice[4],' ',dice[5]);

    //sortieren
     for j := 4 downto 1 do
       for i := 1 to j do
           if dice[i] > dice[i+1] then
              begin
                   temp := dice[i];
                   dice[i] := dice[i+1];
                   dice[i+1] := temp;
              end;

     //prüfen auf pasch
     if (dice[1] = dice[2]) and (dice[2]=dice[3]) and (dice[3]=dice[4]) and (dice[4]=dice[5])
        then pasch := True;

    //Werte auf Panals anzeigen
    pnl1.caption := IntToStr(dice[1]);
    pnl2.caption := IntToStr(dice[2]);
    pnl3.caption := IntToStr(dice[3]);
    pnl4.caption := IntToStr(dice[4]);
    pnl5.caption := IntToStr(dice[5]);
    edtCounter.Text := IntToStr(counter);
  until pasch = true;
end;

procedure TfrmDice.btnBubbleSortClick(Sender: TObject);
var i,j,Merker : integer;
begin
     for i:=Anzahl downto 1 do // Durchläufe entspr. Anzahl

         for j:=1 to i-1 do // Vergleiche entspr. Anzahl und Fortschritt
             begin
               //writeln(i,' ',j,' ',ArrayZahlen[0],' ',ArrayZahlen[1],' ',ArrayZahlen[2],' ',ArrayZahlen[3],' ',ArrayZahlen[4],' ',ArrayZahlen[5],' ',ArrayZahlen[6]);
               if ArrayZahlen[j-1] > ArrayZahlen[j] then // wenn nächste Zahl kleiner
                  begin
                       Merker := ArrayZahlen[j-1]; // merken und vertauschen
                       ArrayZahlen[j-1] := ArrayZahlen[j];
                       ArrayZahlen[j] := Merker;
                  end;
             end;
     for i:=0 to Anzahl-1 do //sortiertes Array in Listbox schreiben
         ListBoxBubbleSort.Items.Insert(i,IntToStr(ArrayZahlen[i]));
end;

procedure TfrmDice.btnSelectSortClick(Sender: TObject);
var i,j,max,imax : integer;
begin
  for i:=Anzahl downto 1 do
      begin
        imax := i-1;
        max := ArrayZahlen[i-1];
        for j:= 1 to i-1 do
            begin
              //writeln(i,' ',j,' ',max,' ',ArrayZahlen[0],' ',ArrayZahlen[1],' ',ArrayZahlen[2],' ',ArrayZahlen[3],' ',ArrayZahlen[4],' ',ArrayZahlen[5],' ',ArrayZahlen[6]);
              if ArrayZahlen[j-1] > max then
                 begin
                      imax := j-1;
                      max := ArrayZahlen[j-1];
                 end;
            end;
        ArrayZahlen[imax] := ArrayZahlen[i-1];
        ArrayZahlen[i-1]:=max;
      end;
      for i:=0 to Anzahl-1 do //sortiertes Array in Listbox schreiben
         ListBoxSelectSort.Items.Insert(i,IntToStr(ArrayZahlen[i]));

end;

procedure TfrmDice.btnZufallszahlenClick(Sender: TObject);
var i : Integer;

begin
     Anzahl := StrToInt(edtAnzahl.Text); //Anzahl auslesen
     setLength(ArrayZahlen,Anzahl);      //Array auf Größe Anzahl setzen
     randomize;                          //random init
     for i := 0 to Anzahl-1 do           //Schleife Array füllen
         Begin
           //Zufallszahl in Array
           ArrayZahlen[i] := Random(Anzahl)+1;
           //Zahl in Listbox schreiben
           ListBoxUnsortiert.Items.Insert(i,IntToStr(ArrayZahlen[i]));
         end;

end;




end.

