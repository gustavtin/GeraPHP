unit Udm;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery, IBUpdateSQL;


type
  Tdmgeral = class(TDataModule)
    upcampos: TIBUpdateSQL;
    upclasses: TIBUpdateSQL;
    ibclasses: TIBQuery;
    ibcampos: TIBQuery;
    dbcode: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dscampos: TDataSource;
    dsclasses: TDataSource;
    ibcamposID_CAMPO: TIntegerField;
    ibcamposID_CLASSE: TIntegerField;
    ibcamposTIPO: TIBStringField;
    ibcamposCHAVE: TIBStringField;
    ibcamposPADRAO: TIBStringField;

    ibclassesID_CLASSE: TIntegerField;
    ibclassesNOME: TIBStringField;
    ibclassesCATEGORIA: TIBStringField;
    ibt1: TIBTransaction;
    ibcamposCAMPO: TIBStringField;
    ibcamposTAMANHO: TIntegerField;
    ibcamposMINIMO: TIntegerField;
    ibcamposOBRIGATORIO: TIBStringField;
    upcodes: TIBUpdateSQL;
    ibcodes: TIBQuery;
    dscodes1: TDataSource;
    ibcodesCODIGO: TBlobField;
    ibcodesDESCRICAO: TIBStringField;
    ibcodesCATEGORIA: TIBStringField;
    ibcodesID: TIntegerField;
    ibcamposLISTAR: TIBStringField;
    ibcamposUNICO: TIBStringField;
    ibcamposCDEC: TSmallintField;
    iblingua: TIBQuery;
    ibcodesLINGUA: TIBStringField;
    ibcodesGRAVAR: TSmallintField;
    ibcodesPASTA: TIBStringField;
    IBQuery1: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    ibclassesOPCOES: TIBStringField;
    procedure ibclassesAfterPost(DataSet: TDataSet);
    procedure ibclassesAfterOpen(DataSet: TDataSet);
    procedure ibcamposAfterInsert(DataSet: TDataSet);
    procedure ibcamposAfterPost(DataSet: TDataSet);
    procedure ibcamposTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ibcamposTIPOSetText(Sender: TField; const Text: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure dscodes1DataChange(Sender: TObject; Field: TField);
    procedure ibcodesAfterPost(DataSet: TDataSet);
    procedure ibcodesBeforePost(DataSet: TDataSet);
    procedure dscodes1StateChange(Sender: TObject);
  private
    { Private declarations }
  public
      tipos:Tstringlist;
    { Public declarations }
  end;

var
  dmgeral: Tdmgeral;
  tipos:TStringList;
  con:string;
  tp:string;


implementation

uses Ugerahp;

{$R *.dfm}

procedure Tdmgeral.ibclassesAfterPost(DataSet: TDataSet);
begin
   dmgeral.ibclasses.Transaction.Commit;
    dmgeral.ibclasses.Open;
end;

procedure Tdmgeral.ibclassesAfterOpen(DataSet: TDataSet);
begin
      dmgeral.ibcampos.Open;
end;

procedure Tdmgeral.ibcamposAfterInsert(DataSet: TDataSet);
begin
   ibcamposID_CLASSE.Value:=ibclassesID_CLASSE.Value;

end;

procedure Tdmgeral.ibcamposAfterPost(DataSet: TDataSet);
begin
    dmgeral.ibcampos.Transaction.Commit;
    dmgeral.ibcampos.open;
end;

procedure Tdmgeral.ibcamposTIPOGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
  var i:integer;
begin


   { case sender.Value of
      : ;
      : ;
    else ;
    end;
    }
    for i:=0 to tipos.Count-1 do
    begin
        if tipos.Names[i]=sender.Value then
           text:=tipos.Values[tipos.Names[i]];
    end;

end;

procedure Tdmgeral.ibcamposTIPOSetText(Sender: TField; const Text: String);
var i:integer;
begin
    for i:=0 to tipos.Count-1  do
    begin
        if tipos.Values[tipos.Names[i]]=text then
           sender.Value:=tipos.Names[i];
    end;

end;

function explode2(names,values,separator:string):TstringList;
var pn,pv:integer;
begin
   result:=Tstringlist.create;
   pn:=pos(separator,names);
   pv:=pos(separator,values);

   if sizeof(names)<>sizeof(values) then
     raise Exception.create('tamanhos diferentes ');

   while (pn>0) do
   begin
     Result.add(Copy(names,1,pn-1)+'='+Copy(values,1,pv-1));
     Delete(names,1,pn+Length(separator)-1);
     Delete(values,1,pv+Length(separator)-1);
     pn:=pos(separator,names);
     pv:=pos(separator,values);

   end;

   if(names<>'')then
     Result.Add(names+'='+values);

end;

procedure Tdmgeral.DataModuleCreate(Sender: TObject);
begin

   con:='DT,HR,AN,ST,NO,EM,BL,CE,IM,FL,TX,HD,SL,RD,DC';
   tp:='Data,Hora,Ano,String,Numero,Email,Boolean,CEP,Imagem,File,Texto,Hidden,Select,Radio,Decimal';
   tipos:=explode2(con,tp,',');
end;

procedure Tdmgeral.dscodes1DataChange(Sender: TObject; Field: TField);
begin
  fgeracode.syncode.text:=ibcodesCODIGO.asstring;
  if uppercase(ibcodesLINGUA.asstring)='PHP' then
    fgeracode.syncode.Highlighter:=fgeracode.SynPHPSyn1
  else  if (uppercase(ibcodesLINGUA.asstring)='JAVASCRIPT') or (uppercase(ibcodesLINGUA.asstring)='JAVA SCRIPT') then
    fgeracode.syncode.Highlighter:=fgeracode.SynJScriptSyn1
  else  if uppercase(ibcodesLINGUA.asstring)='CSS' then
    fgeracode.syncode.Highlighter:=fgeracode.SynCssSyn1
  else  if uppercase(ibcodesLINGUA.asstring)='C#' then
    fgeracode.syncode.Highlighter:=fgeracode.SynCSSyn1
  else  if uppercase(ibcodesLINGUA.asstring)='COBOL' then
    fgeracode.syncode.Highlighter:=fgeracode.SynCobolSyn1
  else  if uppercase(ibcodesLINGUA.asstring)='JAVA' then
    fgeracode.syncode.Highlighter:=fgeracode.SynJavaSyn1
  else  if uppercase(ibcodesLINGUA.asstring)='HTML' then
    fgeracode.syncode.Highlighter:=fgeracode.SynHTMLSyn1
  else  if (uppercase(ibcodesLINGUA.asstring)='DELPHI') or (uppercase(ibcodesLINGUA.asstring)='PASCAL') then
    fgeracode.syncode.Highlighter:=fgeracode.SynPasSyn1
  else  if pos('SQL',uppercase(ibcodesLINGUA.asstring))>0 then
    fgeracode.syncode.Highlighter:=fgeracode.SynSQLSyn1
  else fgeracode.syncode.Highlighter:=fgeracode.SynMultiSyn1;

end;

procedure Tdmgeral.ibcodesAfterPost(DataSet: TDataSet);
begin
    dmgeral.ibcodes.Transaction.Commit;
    dmgeral.ibcodes.open;
end;

procedure Tdmgeral.ibcodesBeforePost(DataSet: TDataSet);
begin
  ibcodesCODIGO.asstring:=fgeracode.syncode.text;
end;

procedure Tdmgeral.dscodes1StateChange(Sender: TObject);
begin
if dmgeral.dscodes1.State in [dsinsert,dsedit] then
begin
  fgeracode.syncode.enabled:=true;

  end else fgeracode.syncode.enabled:=false;
end;

end.
