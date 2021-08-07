unit Uframe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus;

type
  TFrametopo = class(TFrame)
    mm1: TMainMenu;
    Arquivo1: TMenuItem;
    GeradordeClasses1: TMenuItem;
    CodigosProntos1: TMenuItem;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    procedure Sobre2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Usobre;

{$R *.dfm}

procedure TFrametopo.Sobre2Click(Sender: TObject);
begin
   AboutBox.Show;
end;

end.
