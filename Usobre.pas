unit Usobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,Shellapi, RxGIF;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    img1: TImage;
    procedure OKButtonClick(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  close;
end;

procedure TAboutBox.img1Click(Sender: TObject);
var pg:PAnsiChar;
begin
    pg:=PAnsiChar('https://pagseguro.uol.com.br/checkout/v2/donation.html?currency=BRL&receiverEmail=gustavoprogramador@hotmail.com');
 //  WinExec(pg, SW_SHOWMINIMIZED);
   ShellExecute(handle,'open',pg, '','',SW_SHOWNORMAL);
//Tamanho da Janela = SW_SHOW ou SW_SHOWMAXIMAZED ou SW_SHOWMINIMIZED

end;

end.

