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
    btnInsertSort: TButton;
    btnZufallszahlen: TButton;
    btnBubbleSort: TButton;
    btnClose: TButton;
    edtCounter: TEdit;
    edtAnzahl: TEdit;
    lblBubbleSort: TLabel;
    lblAnzahl: TLabel;
    lblSelectSort: TLabel;
    lblInsertSort: TLabel;
    lblUnsortiert: TLabel;
    ListBoxBubbleSort: TListBox;
    ListBoxSelectSort: TListBox;
    ListBoxInsertSort: TListBox;
    ListBoxUnsortiert: TListBox;
    pnlSortHead: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnlErgebnis: TPanel;
    procedure btnBubbleSortClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnInsertSortClick(Sender: TObject);
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
  pnlErgebnis.Caption := '';

  //repeat
     //counter := counter +1;
     for i := 1 to 5 do            //5x würfeln
         begin
           dice[i]:=random(6)+1;   //Zufallszahl zw 1..6 erzeugen, in Array schreiben
         end;

     //Debugausgabe der Werte
     //writeln(dice[1],' ',dice[2],' ',dice[3],' ',dice[4],' ',dice[5]);

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
        then
           begin
                pasch := True;
                pnlErgebnis.Caption := 'PASCH !'
           end;
     //prüfen auf kleine Strasse
     if ((dice[2] = dice[1]+1) and (dice[3] = dice[2]+1) and (dice[4] = dice[3]+1)) OR
        ((dice[3] = dice[2]+1) and (dice[4] = dice[3]+1) and (dice[5] = dice[4]+1))
        then
           begin
                pnlErgebnis.Caption := 'kleine Straße !'
           end;
     //prüfen auf große Strasse
     if (dice[2] = dice[1]+1) and (dice[3] = dice[2]+1) and (dice[4] = dice[3]+1) and (dice[5] = dice[4]+1)
        then
           begin
                pnlErgebnis.Caption := 'große Straße !'
           end;

    //Werte auf Panals anzeigen
    pnl1.caption := IntToStr(dice[1]);
    pnl2.caption := IntToStr(dice[2]);
    pnl3.caption := IntToStr(dice[3]);
    pnl4.caption := IntToStr(dice[4]);
    pnl5.caption := IntToStr(dice[5]);
    //edtCounter.Text := IntToStr(counter);
  //until pasch = true;
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

procedure TfrmDice.btnCloseClick(Sender: TObject);
begin
  close;
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

procedure TfrmDice.btnInsertSortClick(Sender: TObject);
var i, j, Merke : integer; //Variablen deklarieren
begin
  for i := 2 to Anzahl do  //von 2. Stelle beginnen
     begin
         Merke := ArrayZahlen[i-1]; // 2. Zahl im Array merken
         j := i;
         while (j>1) and (ArrayZahlen[j-2] > Merke) do //wenn Vorgänger größer als Merke
               begin
                    ArrayZahlen[j-1] := ArrayZahlen[j-2]; // Vorgänger eine Pos weiter schieben
                    Dec(j); //j-1
               end;
         ArrayZahlen[j-1] := Merke; // Wenn j am Arrayanfang oder Merke größer - Merke einsortieren
     end;
  for i:=0 to Anzahl-1 do //sortiertes Array in Listbox schreiben
         ListBoxInsertSort.Items.Insert(i,IntToStr(ArrayZahlen[i]));
end;
{//writeln(i,' ',j,' ',Merke,' ',ArrayZahlen[0],
' ',ArrayZahlen[1],' ',ArrayZahlen[2],' ',ArrayZahlen[3],
' ',ArrayZahlen[4],' ',ArrayZahlen[5],' ',ArrayZahlen[6]);}

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

