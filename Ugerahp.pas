unit Ugerahp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,db, dbtables,Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids,
  SynEdit, SynMemo, SynEditHighlighter, SynHighlighterPHP,
  SynHighlighterMulti, SynHighlighterJScript, Menus, Uframe,
  SynHighlighterSQL, SynHighlighterHtml, SynHighlighterPas,
  SynHighlighterCpp, SynHighlighterJava, SynHighlighterCobol,
  SynHighlighterCS, SynHighlighterCSS, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckListBox, cxDBCheckListBox, ShellCtrls,shellapi;

  type Tcampo = class
    campofb:string;
    campomy:string;
    lmin:integer;
    lmax:integer;
    tpsel:string;
  end;


type
  Tfgeracode = class(TForm)
    SynPHPSyn1: TSynPHPSyn;
    SynMultiSyn1: TSynMultiSyn;
    SynJScriptSyn1: TSynJScriptSyn;
    pgc1: TPageControl;
    TabSheet1: TTabSheet;
    ts9: TTabSheet;
    jsformulario: TPageControl;
    ts3: TTabSheet;
    mclasse: TSynMemo;
    ts4: TTabSheet;
    minsert: TSynMemo;
    ts5: TTabSheet;
    mupdate: TSynMemo;
    ts7: TTabSheet;
    ts2: TTabSheet;
    mbusca: TSynMemo;
    ts8: TTabSheet;
    mjsform: TSynMemo;
    ts1: TTabSheet;
    mform: TSynMemo;
    ts6: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    Label8: TLabel;
    edpdata: TEdit;
    edphora: TEdit;
    cbcharset: TComboBox;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    syncode: TSynEdit;
    mdetalhes: TSynMemo;
    ts10: TTabSheet;
    ckexcl: TCheckBox;
    ckincl: TCheckBox;
    ckaltl: TCheckBox;
    mlist: TSynMemo;
    btn2: TButton;
    dbcbb1: TDBComboBox;
    lbl4: TLabel;
    grp1: TGroupBox;
    cbb1: TComboBox;
    lbl5: TLabel;
    edpesq: TEdit;
    lbl6: TLabel;
    SynSQLSyn1: TSynSQLSyn;
    tsmysql: TTabSheet;
    syncreatemy: TSynMemo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Button1: TButton;
    Frametopo1: TFrametopo;
    Button2: TButton;
    grpcampos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    lbdecimal: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    edcampo: TDBEdit;
    edpadrao: TDBEdit;
    ckchave: TDBCheckBox;
    setipo: TDBComboBox;
    dbedtTAMANHO: TDBEdit;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    cklist: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit6: TDBEdit;
    dbdec: TDBEdit;
    SynPasSyn1: TSynPasSyn;
    SynHTMLSyn1: TSynHTMLSyn;
    SynCssSyn1: TSynCssSyn;
    SynCSSyn1: TSynCSSyn;
    SynCobolSyn1: TSynCobolSyn;
    SynJavaSyn1: TSynJavaSyn;
    SynCppSyn1: TSynCppSyn;
    pnl1: TPanel;
    lbl3: TLabel;
    Edit1: TEdit;
    fmail: TCheckBox;
    ckeditor: TCheckBox;
    finc: TCheckBox;
    fdet: TCheckBox;
    fexc: TCheckBox;
    falt: TCheckBox;
    pnl2: TPanel;
    ckdetl: TCheckBox;
    ckmoeda: TCheckBox;
    eddiretorio: TcxButtonEdit;
    Label12: TLabel;
    cxButton1: TcxButton;
    OpenDialog1: TOpenDialog;
    dbchk1: TDBCheckBox;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    cxButton2: TcxButton;
    listbox: TcxCheckListBox;
    ckjs: TCheckBox;
    chuser: TCheckBox;
    cxDBCheckListBox1: TcxDBCheckListBox;
    tsajax: TTabSheet;
    majax: TSynMemo;
    ckms: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure geraclasse;
    procedure geraupdate;
    procedure gerainsert;
    procedure geradelete;
    procedure geralistagem;
    procedure geraselecionar;
    procedure gerabusca;
    procedure geraajax;
    procedure geravalidar();
    procedure geraverifica;
    procedure geraformulario;
    procedure geradetalhes;
    procedure Button1Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure criacamps;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure geracreatemy();
    procedure cbb1Change(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fgeracode: Tfgeracode;
  listcfb:tlist;
  listcmy:tlist;
  campor:tcampo;

implementation

uses Udm, Usobre;

{$R *.dfm}

FUNCTION Capitalize (CONST s: STRING): STRING;
VAR
flag: BOOLEAN;
i : Byte;
t : STRING;
BEGIN
flag := TRUE;
t := '';
FOR i := 1 TO LENGTH(s) DO
BEGIN
IF flag
THEN AppendStr(t, UpCase(s[i]))
ELSE AppendStr(t, s[i]);
flag := (s[i] = ' ')
END;
RESULT := t
END {Capitalize};

{Função para converter numeros decimais em binarios. O retorno é uma string}
function Dectobin(valor: integer): string;
var
binario: string;
begin
  while valor >= 1  do
  begin
    binario:=inttostr(valor mod 2)+binario;
    valor:=(valor div 2);
  end;
  result:=binario;
end;

procedure Tfgeracode.FormShow(Sender: TObject);
var i:integer;
begin

   criacamps();
   dmgeral.ibclasses.Open;
   dmgeral.ibcampos.Open;
   dmgeral.ibcodes.open;
   self.Menu:=frametopo1.mm1;

   setipo.Items.Clear;

   dmgeral.iblingua.open;
   dmgeral.iblingua.last;
   dmgeral.iblingua.first;
    cbb1.Items.clear;
    cbb1.Items.clear;

   while not dmgeral.iblingua.eof do begin
       dbcbb1.Items.Add(dmgeral.iblingua.fieldbyname('lingua').asstring);
        cbb1.Items.Add(dmgeral.iblingua.fieldbyname('lingua').asstring);
       dmgeral.iblingua.next;
   end;


    for i:=0 to dmgeral.tipos.Count-1 do
    begin
      setipo.Items.Add(dmgeral.tipos.Values[dmgeral.tipos.Names[i]]);

    end;
end;

procedure Tfgeracode.gerabusca;
var cabeca, pe,nomeclasse,campo,campop:string;
i:integer;
tm:tsynmemo;
begin
  nomeclasse:=dmgeral.ibclassesNOME.AsString;
  mbusca.Lines.Clear;
   // tm:=mbusca;
    tm:=mclasse;

  dmgeral.ibcampos.last;

     dmgeral.ibcampos.First;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;

   dmgeral.ibcampos.Next;
  end;

  tm.Lines.Add('function busca() { ');
	tm.Lines.Add(' if(($this->'+lowercase(campop)+'==0) OR (empty($this->'+lowercase(campop)+'))) ');
	tm.Lines.Add('  	return false; ');
	tm.Lines.Add('   ');
 	tm.Lines.Add(' $sql = "SELECT * FROM '+nomeclasse+' WHERE "; ');
	tm.Lines.Add(' $sql.= "'+campop+'=" . $this->'+lowercase(campop)+'; ');
 	tm.Lines.Add('');
	tm.Lines.Add(' 	$qry = new consulta($this->bd); ');
	tm.Lines.Add(' 	$qry->executa($sql);  ');
 	tm.Lines.Add('');
	tm.Lines.Add(' if(!($qry->res) OR ($qry->nrw<0))');
	tm.Lines.Add(' 	return false; ');
 	tm.Lines.Add('  ');
  
   dmgeral.ibcampos.First;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     campo:=dmgeral.ibcamposCAMPO.AsString;

   if(campo<>campop)then
   begin
      if (dmgeral.ibcamposTIPO.AsString='NO') then
      begin
          if(dmgeral.ibcamposCDEC.asstring>='2')then
       	   tm.Lines.Add('    $this->'+lowercase(campo)+' = str_replace(''.'','','',$qry->data["'+campo+'"]); ')
           else tm.Lines.Add(' 	$this->'+lowercase(campo)+' = $qry->data["'+campo+'"]; ');
      end
      else
      if dmgeral.ibcamposTIPO.AsString='DT' then
       	   tm.Lines.Add('    $this->'+lowercase(campo)+' = date("d/m/Y",strtotime($qry->data["'+campo+'"])); ')
      else tm.Lines.Add(' 	$this->'+lowercase(campo)+' = $qry->data["'+campo+'"]; ');
   end;

      dmgeral.ibcampos.next;
  end;

  	tm.Lines.Add('	return true; ');
	tm.Lines.Add('	}  ');


end;

procedure Tfgeracode.geraclasse;
var cabeca, pe,nomeclasse,s:string;
i:integer;
tm:tsynmemo;
begin
  nomeclasse:=dmgeral.ibclassesNOME.AsString;
  mclasse.Lines.Clear;
    tm:=mclasse;
  tm.Lines.Add('<?php');
  tm.Lines.Add('class '+nomeclasse+'{');
  
  dmgeral.ibcampos.last;
  dmgeral.ibcampos.first;
   tm.Lines.Add('   var $bd;');
   tm.Lines.Add('   var $qry;');
   tm.Lines.Add('');
   
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    tm.Lines.Add('   var $'+lowercase(dmgeral.ibcamposCAMPO.AsString)+';');
      dmgeral.ibcampos.next;
  end;
  tm.Lines.Add('');
  tm.Lines.Add(' function '+nomeclasse+'($bd){');

  tm.Lines.Add('  $this->bd = $bd;');
	tm.Lines.Add('  $this->qry = new consulta($bd);');
 //	tm.Lines.Add('  $this->banco = new banco($bd);');

  dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    if dmgeral.ibcamposTIPO.AsString='NO' then
    begin
      if(dmgeral.ibcamposPADRAO.AsString<>'') then
      s:= dmgeral.ibcamposPADRAO.AsString
      else s:='0';

      tm.Lines.Add('   $this->'+lowercase(dmgeral.ibcamposCAMPO.AsString)+'='+s+';');
    end
    else if dmgeral.ibcamposTIPO.AsString='DT' then
      tm.Lines.Add('   $this->'+lowercase(dmgeral.ibcamposCAMPO.AsString)+'='+edpdata.Text+';')
     else if dmgeral.ibcamposTIPO.AsString='HR' then
      tm.Lines.Add('   $this->'+lowercase(dmgeral.ibcamposCAMPO.AsString)+'='+edphora.Text+';')
    else if dmgeral.ibcamposTIPO.AsString='ST' then
      tm.Lines.Add('   $this->'+lowercase(dmgeral.ibcamposCAMPO.AsString)+'="'+dmgeral.ibcamposPADRAO.AsString+'";');

   dmgeral.ibcampos.next;

  end;
  tm.Lines.Add(' }');

end;

procedure Tfgeracode.geradelete;
var c,sep, pe,nomeclasse,campop:string;
i:integer;
tm:tsynedit;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
   tm:=mclasse;
	 tm.Lines.Add('  function excluir() {');
   tm.Lines.Add('    $sql = "DELETE FROM '+nomeclasse+' WHERE ";');

   dmgeral.ibcampos.First;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;

   dmgeral.ibcampos.Next;
  end;

    if dmgeral.ibcamposTIPO.AsString<>'NO' then
	 tm.Lines.Add('    $sql.= "'+campop+' = ''" . $this->'+lowercase(campop)+'."''";')
   else
    tm.Lines.Add('    $sql.= "'+campop+' = " . $this->'+lowercase(campop)+'."";');
    
   tm.Lines.Add('  $this->qry->executa($sql); ');
   tm.Lines.Add('  return $this->qry->res; ');
	tm.Lines.Add('}');
end;

procedure Tfgeracode.gerainsert;
var c,sep, pe,nomeclasse,campo,virg:string;
i:integer;
tm:tsynmemo;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
  minsert.Lines.Clear;
  tm:=minsert;
   tm:=mclasse;
 tm.Lines.Add('  function incluir(){');
 tm.Lines.Add('    if($this->validar()) {  ');


tm.Lines.Add('     $sql = "INSERT INTO '+nomeclasse+'(";');
dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;

    if(i<(dmgeral.ibcampos.RecordCount-1)) then
      tm.Lines.Add('    $sql .= "'+campo+',";')
    else
      tm.Lines.Add('     $sql .= "'+campo+')values(";');
     dmgeral.ibcampos.Next;
  end;
     dmgeral.ibcampos.first;
     for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;

     if(cbcharset.Text='utf') then
      c:='utf8_decode($this->'+lowercase(campo)+')'
    else
      c:='$this->'+lowercase(campo)+' ';

    if(dmgeral.ibcamposTIPO.AsString<>'NO') then
      sep:=''''
    else
      sep:='';

    if(i<(dmgeral.ibcampos.RecordCount-1)) then
      virg:=','
      else virg:=')';

    if(dmgeral.ibcamposCDEC.asstring>='2')then
           tm.Lines.Add('    $sql.= "".'+ 'str_replace('','',''.'',$this->'+lowercase(campo)+')."'+virg+'";')
    else
      tm.Lines.Add('     $sql.= "'+sep+'" . '+c+'."'+sep+''+virg+'";') ;

   dmgeral.ibcampos.Next;
  end;

    tm.Lines.Add('');
    tm.Lines.Add('     //echo $sql;');
    tm.Lines.Add('');
    tm.Lines.Add('     $this->qry->executa($sql);');
    tm.Lines.Add('');
	  tm.Lines.Add('	return $this->qry->res;');

     tm.Lines.Add('    }');
     tm.Lines.Add('  return false;');
     tm.Lines.Add('}  ');
end;

procedure Tfgeracode.geralistagem;
var c,sep, pe,nomeclasse,campo,campop:string;
i:integer;
c1,c2:string;
tm:tsynmemo;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
  mlist.Lines.Clear;
  tm:=mlist;
  tm:=mclasse;
   //campo data descrescente
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;

    if(dmgeral.ibcamposTIPO.asstring='DT') then
      c1:=campo;
    if(dmgeral.ibcamposTIPO.asstring='HR') then
      c2:=campo;

     dmgeral.ibcampos.Next;
  end;


  if(c1<>'')then
    tm.Lines.Add('   function listar($pagina,$iduser=0,$data1='''', $data2='''') { ')
 else
    tm.Lines.Add('   function listar($pagina,$iduser=0) { ');

 tm.Lines.Add('      global $_SERVER;             ');
 tm.Lines.Add('      $sql = "SELECT * FROM '+nomeclasse+' where 1=1";  ');
		  tm.Lines.Add('      ');
 tm.Lines.Add('      if($iduser!=0)  ');
 tm.Lines.Add('      {    ');
 tm.Lines.Add('                     $sql .= " and id_user=".$iduser; ');

 tm.Lines.Add('      }  ');

   if(c1<>'')then
   begin
     tm.Lines.Add('	if($data1!=''''){    ');
     tm.Lines.Add('		$data1= date("Y-m-d",strtotime(str_replace(''/'', ''-'',$data1)));   ');
     tm.Lines.Add('		$sql .= " and '+c1+'>=''".$data1."''";    ');
     tm.Lines.Add('	}  ');
      tm.Lines.Add('	  ');
     tm.Lines.Add('	if($data2!=''''){   ');
     tm.Lines.Add('		$data2= date("Y-m-d",strtotime(str_replace(''/'', ''-'',$data2)));  ');
     tm.Lines.Add('		$sql .= " and '+c1+'<=''".$data2."''";  ');
     tm.Lines.Add('	}  ');
     tm.Lines.Add(' ');
   end;
    c1:='';
    c2:='';

         if(c1<>'')then
         begin
          if(c2<>'') then
            c1:=c1+','+c2;

         end else c1:=c2;

         if c1<>'' then
             tm.Lines.Add('		 $sql .= " order by '+c1+' ";');

 tm.Lines.Add('//echo $sql; ');

 tm.Lines.Add('   $qry = new consulta($this->bd);  ');
 tm.Lines.Add('   $qry->executa($sql);  ');
 tm.Lines.Add('');
 tm.Lines.Add('		if(!$qry->res OR $qry->nrw<=0) {   ');
 tm.Lines.Add('			echo "<p align=''center''><b>Nenhuma '+nomeclasse+' encontrada</b></p>"; ');
 if(ckincl.Checked)then
 tm.Lines.Add('			echo "<p align=''center'' class=''link2''><a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=I\">Incluir Novo '+capitalize(nomeclasse)+'</a></p>&nbsp;&nbsp;"; ');
 tm.Lines.Add('				return false; ');
 tm.Lines.Add('		}  ');
  tm.Lines.Add('   ');
  tm.Lines.Add('		 	$pagina = ($pagina==0) ? $pagina=1 : $pagina;  ');
   tm.Lines.Add('		  ');
  tm.Lines.Add('		$row = calcula_pos($qry->nrw,$pagina);   ');
  tm.Lines.Add('		  ');

tm.Lines.Add('		echo "<table border=0 cellpadding=0 cellspacing=3 width=''90%'' class=''txt2'' valign=''top''>\n"; ');
tm.Lines.Add('		echo "	<tr>\n";  ');

dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;
     if(dmgeral.ibcamposLISTAR.asstring='S') then
     begin
          tm.Lines.Add('   			echo "		<td><b>'+capitalize(campo)+' </b></td>\n";');
      end;
     dmgeral.ibcampos.Next;
  end;

tm.Lines.Add('		echo "		<td><b>Opcoes</b></td>\n";  ');
tm.Lines.Add('		echo "	</tr>\n";   ');
tm.Lines.Add('		  ');

tm.Lines.Add('		for($i=$row[0];$i<$row[1];$i++) {   ');
tm.Lines.Add('	  	$qry->navega($i);  ');
tm.Lines.Add('   ');
tm.Lines.Add('		$this->cod = $qry->data[0]; ');

			//	$this->busca();

tm.Lines.Add('			echo "	<tr>\n"; ');

 dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;
     if(dmgeral.ibcamposLISTAR.asstring='S') then
     begin
       if(dmgeral.ibcamposTIPO.AsString='DT') then
          tm.Lines.Add('	  echo "		<td nowrap>" .date("d/m/Y",strtotime($qry->data['''+campo+'''])) . "</td>\n";  ')
       else
          tm.Lines.Add('	  echo "    <td nowrap>" .$qry->data['''+campo+''']. "</td>\n"; ');
      end;
     dmgeral.ibcampos.Next;
  end;


          tm.Lines.Add('	  	echo "		<td class=''link2''>";	');
     if(ckaltl.Checked)then
        tm.Lines.Add('	 	  echo "    <a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=A&cod=" . $qry->data['''+campop+''']."\">Alterar</a>&nbsp;&nbsp;";  ');
     if(ckexcl.Checked)then
        tm.Lines.Add('	    echo "    <a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=E&cod=" .$qry->data["'+campop+'"]."\">Excluir</a>&nbsp;&nbsp;";   ');
     if(ckdetl.Checked)then
        tm.Lines.Add('	    echo "    <a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=DT&cod=" .$qry->data["'+campop+'"]."\">Detalhes</a>";  ');

 tm.Lines.Add('	  	echo "	</td></tr>\n"; ');
 tm.Lines.Add('	  	}   ');
 tm.Lines.Add('	  	   ');
 tm.Lines.Add('	  	echo "</table>";  ');
 tm.Lines.Add('	  	echo "<p align=''center'' class=''link2''>";  ');

  tm.Lines.Add('	  	 if(isset($row[2]))  ');
 tm.Lines.Add('	  	link_paginas($row[2],$pagina,""); ');
 tm.Lines.Add('	  	echo "</p>";  ');
 tm.Lines.Add('	  	   ');
 tm.Lines.Add('	  	echo "<p align=''center'' class=''link2''><a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=I\">Incluir '+capitalize(nomeclasse)+'</a></p>&nbsp;&nbsp;"; ');
 tm.Lines.Add('		}  ');

   if ckms.checked then
   begin
 		tm.Lines.Add(' function montaselect($cod=0) {    ');
		tm.Lines.Add('$sql = "SELECT * FROM '+nomeclasse+'   ');


		tm.Lines.Add('$this->qry->executa($sql);  ');
		tm.Lines.Add('$opcoes='';   ');
		tm.Lines.Add('if(!($this->qry->res) OR ($this->qry->nrw<=0))  ');
		tm.Lines.Add('	return "";  ');
		tm.Lines.Add('else {    ');
		tm.Lines.Add('	for($i=0;$i<$this->qry->nrw;$i++) {   ');
		tm.Lines.Add('		$opcoes.= "<option value=\"" . $this->qry->data[0]. "\" ";  ');
		tm.Lines.Add('		$opcoes.= ($cod==$this->qry->data[0]) ? "SELECTED>" : ">";  ');
		tm.Lines.Add('		$opcoes.= $this->qry->data[1]."</option>\n";  ');
		tm.Lines.Add('		$this->qry->proximo();   ');
		tm.Lines.Add('	}  ');
		tm.Lines.Add('}   ');
		tm.Lines.Add('  ');
		tm.Lines.Add('return $opcoes; ');
    	tm.Lines.Add('}  ');

   end;


end;


procedure Tfgeracode.geraselecionar;
var c,sep, pe,nomeclasse,campo,campop:string;
i:integer;
c1,c2:string;
tm:tsynmemo;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
 // mlist.Lines.Clear;
  tm:=mlist;
  tm:=mclasse;
   //campo data descrescente
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;

    if(dmgeral.ibcamposTIPO.asstring='DT') then
      c1:=campo;
    if(dmgeral.ibcamposTIPO.asstring='HR') then
      c2:=campo;

     dmgeral.ibcampos.Next;
  end;


  if(c1<>'')then
    tm.Lines.Add('   function selecionar($pagina=1,$iduser=0,$data1='''', $data2='''') { ')
 else
    tm.Lines.Add('   function selecionar($pagina=1,$iduser=0) { ');

 tm.Lines.Add('      global $_SERVER, $PHP_SELF;             ');
 tm.Lines.Add('      $sql = "SELECT * FROM '+nomeclasse+' where 1=1";  ');
		  tm.Lines.Add('      ');
 tm.Lines.Add('      if($iduser!=0)  ');
 tm.Lines.Add('      {    ');
 tm.Lines.Add('                     $sql .= " and id_user=".$iduser; ');

 tm.Lines.Add('      }  ');

   if(c1<>'')then
   begin
     tm.Lines.Add('	if($data1!=''''){    ');
     tm.Lines.Add('		$data1= date("Y-m-d",strtotime(str_replace(''/'', ''-'',$data1)));   ');
     tm.Lines.Add('		$sql .= " and '+c1+'>=''".$data1."''";    ');
     tm.Lines.Add('	}  ');

     tm.Lines.Add('	if($data2!=''''){   ');
     tm.Lines.Add('		$data2= date("Y-m-d",strtotime(str_replace(''/'', ''-'',$data2)));  ');
     tm.Lines.Add('		$sql .= " and '+c1+'<=''".$data2."''";  ');
     tm.Lines.Add('	}  ');
     tm.Lines.Add(' ');
   end;
    c1:='';
    c2:='';

         if(c1<>'')then
         begin
          if(c2<>'') then
            c1:=c1+','+c2;

         end else c1:=c2;

         if c1<>'' then
             tm.Lines.Add('		 $sql .= " order by '+c1+' ";');

 tm.Lines.Add('//echo $sql; ');

 tm.Lines.Add('   $qry = new consulta($this->bd);  ');
 tm.Lines.Add('   $qry->executa($sql);  ');
 tm.Lines.Add('');
 tm.Lines.Add('		if(!$qry->res OR ($qry->nrw<=0)) {   ');
 tm.Lines.Add('			echo "<p align=''center''><b>Nenhuma '+nomeclasse+' encontrada</b></p>"; ');
 if(ckincl.Checked)then
 tm.Lines.Add('			echo "<p align=''center'' class=''link2''><a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=I\">Incluir Novo '+capitalize(nomeclasse)+'</a></p>&nbsp;&nbsp;"; ');
 tm.Lines.Add('				return false; ');
 tm.Lines.Add('		}  ');
  tm.Lines.Add('   ');
  tm.Lines.Add('		 	$pagina = ($pagina==0) ? $pagina=1 : $pagina;  ');
   tm.Lines.Add('		  ');
  tm.Lines.Add('		$row = calcula_pos($qry->nrw,$pagina);   ');
  tm.Lines.Add('		  ');
  tm.Lines.Add('  	echo "<form name=''f'+nomeclasse+''' method=''post'' action=''".$_SERVER[''PHP_SELF'']."?opt=M''>\n";  ');
   tm.Lines.Add('		echo "<table border=0 cellpadding=0 cellspacing=3 width=''90%'' class=''txt2'' valign=''top''>\n"; ');
   tm.Lines.Add('		echo "	<tr>\n";  ');

   tm.Lines.Add('   			echo "		<td></td>\n";');

dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;
     if(dmgeral.ibcamposLISTAR.asstring='S') then
     begin
          tm.Lines.Add('   			echo "		<td><b>'+capitalize(campo)+' </b></td>\n";');
      end;
     dmgeral.ibcampos.Next;
  end;

tm.Lines.Add('		echo "		<td><b>Opcoes</b></td>\n";  ');
tm.Lines.Add('		echo "	</tr>\n";   ');
tm.Lines.Add('		  ');

tm.Lines.Add('		for($i=$row[0];$i<$row[1];$i++) {   ');
tm.Lines.Add('	  	$qry->navega($i);  ');
tm.Lines.Add('   ');
tm.Lines.Add('		$this->cod = $qry->data[0]; ');

			//	$this->busca();

tm.Lines.Add('			echo "	<tr>\n"; ');

tm.Lines.Add(' $id=$this->qry->data["'+campop+'"] ;  ');
tm.Lines.Add('		echo "		<td><input type=''checkbox'' name='''+nomeclasse+'[]'' value=''" . $id . "''></td>\n";  ');

 dmgeral.ibcampos.first;
   for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;
     if(dmgeral.ibcamposLISTAR.asstring='S') then
     begin
       if(dmgeral.ibcamposTIPO.AsString='DT') then
          tm.Lines.Add('	  echo "		<td nowrap>" .date("d/m/Y",strtotime($qry->data['''+campo+'''])) . "</td>\n";  ')
       else
          tm.Lines.Add('	  echo " <td nowrap>" .$qry->data['''+campo+''']. "</td>\n"; ');
      end;
     dmgeral.ibcampos.Next;
  end;


          tm.Lines.Add('	  	echo "		<td class=''link2''>";	');
   {  if(ckaltl.Checked)then
        tm.Lines.Add('	 	  echo "<a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=A&cod=" . $qry->data['''+campop+'''] . "\">Alterar</a>&nbsp;&nbsp;";  ');
     if(ckexcl.Checked)then
        tm.Lines.Add('	    echo "<a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=E&cod=" .	 $qry->data["'+campop+'"] . "\">Excluir</a>&nbsp;&nbsp;";   ');
     }
     if(ckdetl.Checked)then
        tm.Lines.Add('	    echo "<a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=DT&cod=" .	 $qry->data["'+campop+'"] . "\">Detalhes</a>";  ');

 tm.Lines.Add('	  	echo "	</td></tr>\n"; ');
 tm.Lines.Add('	  	}   ');

 tm.Lines.Add('	  	echo "</table></form>\n";  ');
 tm.Lines.Add('	  	echo "<p align=''center'' class=''link2''>";  ');

 tm.Lines.Add('	  	 if(isset($row[2]))  ');
 tm.Lines.Add('	  	link_paginas($row[2],$pagina,""); ');
 tm.Lines.Add('	  	echo "</p>";  ');

 tm.Lines.Add('	  	echo "<p align=''center'' class=''link2''><a class=''link2'' href=\"".$_SERVER["PHP_SELF"]."?opt=I\">Incluir '+capitalize(nomeclasse)+'</a></p>&nbsp;&nbsp;"; ');
 tm.Lines.Add('		}  ');

   if ckms.checked then
   begin
 		tm.Lines.Add(' function montaselect($cod=0) {    ');
		tm.Lines.Add('$sql = "SELECT * FROM '+nomeclasse+'   ');


		tm.Lines.Add('$this->qry->executa($sql);  ');
		tm.Lines.Add('$opcoes='';   ');
		tm.Lines.Add('if(!($this->qry->res) OR ($this->qry->nrw<=0))  ');
		tm.Lines.Add('	return "";  ');
		tm.Lines.Add('else {    ');
		tm.Lines.Add('	for($i=0;$i<$this->qry->nrw;$i++) {   ');
		tm.Lines.Add('		$opcoes.= "<option value=\"" . $this->qry->data[0]. "\" ";  ');
		tm.Lines.Add('		$opcoes.= ($cod==$this->qry->data[0]) ? "SELECTED>" : ">";  ');
		tm.Lines.Add('		$opcoes.= $this->qry->data[1]."</option>\n";  ');
		tm.Lines.Add('		$this->qry->proximo();   ');
		tm.Lines.Add('	}  ');
		tm.Lines.Add('}   ');
		tm.Lines.Add('  ');
		tm.Lines.Add('return $opcoes; ');
    	tm.Lines.Add('}  ');
    	tm.Lines.Add('  ');
   end;


end;

procedure Tfgeracode.geraupdate;
var c,sep, pe,nomeclasse,campo,campop,virg:string;
i:integer;
tm:tsynedit;
begin
    nomeclasse:=dmgeral.ibclassesNOME.AsString;

   tm:=  mupdate;
   tm:=mclasse;
   tm.Lines.Add('  function alterar(){');
   tm.Lines.Add('    if($this->validar()) {  ');


    tm.Lines.Add('      $sql = "UPDATE '+nomeclasse+' SET ";');
    dmgeral.ibcampos.first;

     for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    campo:=dmgeral.ibcamposCAMPO.AsString;

     if(cbcharset.Text='utf') then
      c:='utf8_decode($this->'+lowercase(campo)+')'
    else
      c:='$this->'+lowercase(campo)+' ';

    if(dmgeral.ibcamposTIPO.AsString<>'NO') then
      sep:=''''
    else
      sep:='';

    if(i<(dmgeral.ibcampos.RecordCount-1)) then
       virg:=','
    else
       virg:='';

    if(dmgeral.ibcamposCDEC.asstring>='2')then
           tm.Lines.Add('    $sql.= "".'+ 'str_replace('','',''.'',$this->'+lowercase(campo)+')."'+virg+'";')
    else
      tm.Lines.Add('      $sql.= "'+campo+' ='+sep+'" . '+c+'. "'+sep+''+virg+'";');


    if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;

   dmgeral.ibcampos.Next;
  end;
    tm.Lines.Add('');
    tm.Lines.Add('       $sql.= " WHERE '+campop+' = " . $this->'+lowercase(campop)+'."";');
    tm.Lines.Add('');
    tm.Lines.Add('     //echo $sql;');
    tm.Lines.Add('');
    tm.Lines.Add('     $this->qry->executa($sql);');
    tm.Lines.Add('');
	  tm.Lines.Add('	return $this->qry->res;');

     tm.Lines.Add('    }');
     tm.Lines.Add('  return false;');
    tm.Lines.Add('  }');
end;

procedure Tfgeracode.Button1Click(Sender: TObject);
begin
  mclasse.Lines.Clear;
    geraclasse;
    geravalidar;
    geraupdate;
    gerainsert;
    geradelete;
    gerabusca;
    geralistagem;
    geraselecionar;

    geraformulario ;
    geraajax;
   // geraverifica;
    geradetalhes;
     mclasse.Lines.Add('}');
end;

procedure Tfgeracode.geravalidar;
var c,sep, pe,nomeclasse,campo,campop,spaco:string;
i:integer;
tm:tsynmemo;
min:string;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
    mupdate.Lines.Clear;
    tm:=  mupdate;
    tm:=mclasse;
   tm.Lines.Add('    function validar() {');
            spaco:='        ';

   dmgeral.ibcampos.first;
  //se vazio
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     campo:=dmgeral.ibcamposCAMPO.AsString;
     tm.Lines.Add(spaco+ 'if (empty($this->'+lowercase(campo)+'))');
     tm.Lines.Add(spaco+ '{');

    if dmgeral.ibcamposOBRIGATORIO.AsString='S' then
    begin
     tm.Lines.Add(spaco+ 'echo ''<center>'+capitalize(campo)+' Invalido!</center>'';');
     tm.Lines.Add(spaco+ 'return false;');

    end;
      tm.Lines.Add(spaco+ '}');
      tm.Lines.Add(spaco+ 'else{');
      //se tamanho menor
      if dmgeral.ibcamposTIPO.AsString='ST' then
      begin
        min:=dmgeral.ibcamposMINIMO.AsString;
        if min='' then
        min:='3';

      tm.Lines.Add(spaco+ '  if(strlen($this->'+lowercase(campo)+')<'+min+')');
      tm.Lines.Add(spaco+ '  {  ');
      tm.Lines.Add(spaco+ 'echo ''<center>'+capitalize(campo)+' curto!</center>'';');
      tm.Lines.Add(spaco+ '   return false;}');
      end;
      tm.Lines.Add(spaco+ '}');

      dmgeral.ibcampos.Next;
  end;
    tm.Lines.Add(spaco+ '  return true;');
    tm.Lines.Add(spaco+ '}');

		(*
				$sql = "SELECT * FROM menuseo where link='".$this->link1."' and tipo='".$this->tipo."'";
				//nao permite 2 links do mesmo tipo

			$this->qry->executa($sql);

			if(!$this->qry->res OR $this->qry->nrw<=0)
			return true;
			else
			{
			  echo 'LINK JA EXISTE';
			  return false;
			}
		}
    *)
end;

procedure Tfgeracode.geraformulario;
var c,sep, pe,nomeclasse,campo,campop,spaco,size:string;
i:integer;
tm:tsynmemo;
temf:boolean;
comp,tipo:string;
s:string;
begin
nomeclasse:=dmgeral.ibclassesNOME.AsString;
    mform.Lines.Clear;
    tm:=  mform;
    spaco:='   ';

       tm.Lines.Add('     <?php   ');
       tm.Lines.Add('    $area = 1; // 0 - NL, 1 - ADM, 2 - CLIENTE   ');
       tm.Lines.Add('   ');
       tm.Lines.Add('    require("../header.php");  ');
       tm.Lines.Add('    require("../classes/class'+nomeclasse+'.php");   ');

       tm.Lines.Add('  //require("topo.php");   ');
       tm.Lines.Add('  ');
       tm.Lines.Add('  //EXTRAIR DADOS EXPLODE   ');
       tm.Lines.Add('  extract($_REQUEST);   ');
       tm.Lines.Add('   ');

       tm.Lines.Add(' if(isset($_REQUEST["opt"]))    ');
       tm.Lines.Add('    $opt=$_REQUEST["opt"];    ');
       tm.Lines.Add('  else $opt='''';  ');
       tm.Lines.Add('       ');
       tm.Lines.Add(' 	if(isset($_REQUEST["pagina"]))  ');
       tm.Lines.Add(' 	  $pagina=$_REQUEST["pagina"];  ');
       tm.Lines.Add(' 	else         ');
       tm.Lines.Add(' 	  $pagina=1;  ');
       tm.Lines.Add('   ?> ');

    if ckmoeda.Checked then
    begin

       tm.Lines.Add('    <script type="text/javascript" >   ');
       tm.Lines.Add(' //-----------------------------------------------------  ');
       tm.Lines.Add(' //Funcao: MascaraMoeda                                   ');
       tm.Lines.Add(' //Sinopse: Mascara de preenchimento de moeda             ');
       tm.Lines.Add(' //Parametro:                                             ');
       tm.Lines.Add(' //   objTextBox : Objeto (TextBox)                       ');
       tm.Lines.Add(' //   SeparadorMilesimo : Caracter separador de milésimos ');
       tm.Lines.Add(' //   SeparadorDecimal : Caracter separador de decimais   ');
       tm.Lines.Add(' //   e : Evento                                          ');
       tm.Lines.Add(' //Retorno: Booleano                                      ');
       tm.Lines.Add(' //Autor: Gabriel Fróes                                   ');
       tm.Lines.Add(' //-----------------------------------------------------  ');
       tm.Lines.Add(' function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e)  ');
       tm.Lines.Add(' {       ');
       tm.Lines.Add('     var sep = 0;   ');
       tm.Lines.Add('     var key = '''';  ');
       tm.Lines.Add('     var i = j = 0;  ');
       tm.Lines.Add('     var len = len2 = 0;  ');
       tm.Lines.Add('     var strCheck = ''0123456789'';  ');
       tm.Lines.Add('     var aux = aux2 = '''';  ');
       tm.Lines.Add('     var whichCode = (window.Event) ? e.which : e.keyCode;   ');
       tm.Lines.Add('     if (whichCode == 13) return true;   ');
       tm.Lines.Add('     key = String.fromCharCode(whichCode); // Valor para o código da Chave    ');
       tm.Lines.Add('     if (strCheck.indexOf(key) == -1) return false; // Chave inválida   ');
       tm.Lines.Add('     len = objTextBox.value.length;    ');
       tm.Lines.Add('     for(i = 0; i < len; i++)  ');
       tm.Lines.Add('         if ((objTextBox.value.charAt(i) != ''0'') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break; ');
       tm.Lines.Add('     aux = '''';      ');
       tm.Lines.Add('     for(; i < len; i++)    ');
       tm.Lines.Add('         if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);');
       tm.Lines.Add('     aux += key;   ');
       tm.Lines.Add('     len = aux.length;    ');
       tm.Lines.Add('     if (len == 0) objTextBox.value = '''';     ');
       tm.Lines.Add('     if (len == 1) objTextBox.value = ''0''+ SeparadorDecimal + ''0'' + aux;  ');
       tm.Lines.Add('     if (len == 2) objTextBox.value = ''0''+ SeparadorDecimal + aux; ');
       tm.Lines.Add('     if (len > 2) {      ');
       tm.Lines.Add('         aux2 = '''';        ');
       tm.Lines.Add('         for (j = 0, i = len - 3; i >= 0; i--) {  ');
       tm.Lines.Add('             if (j == 3) {             ');
       tm.Lines.Add('                 aux2 += SeparadorMilesimo;  ');
       tm.Lines.Add('                 j = 0;   ');
       tm.Lines.Add('             }            ');
       tm.Lines.Add('             aux2 += aux.charAt(i);   ');
       tm.Lines.Add('             j++;     ');
       tm.Lines.Add('         }                ');
       tm.Lines.Add('         objTextBox.value = '''';  ');
       tm.Lines.Add('         len2 = aux2.length;    ');
       tm.Lines.Add('         for (i = len2 - 1; i >= 0; i--)  ');
       tm.Lines.Add('         objTextBox.value += aux2.charAt(i);  ');
       tm.Lines.Add('         objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);  ');
       tm.Lines.Add('     }     ');
       tm.Lines.Add('     return false;  ');
       tm.Lines.Add(' }      ');
       tm.Lines.Add(' /*$(function() {   ');
       tm.Lines.Add(' $(''input:text'').setMask(); ');
       tm.Lines.Add('    ');
       tm.Lines.Add('  });  ');


       tm.Lines.Add(' */     ');
       tm.Lines.Add(' </script>   ');
    end;

    if ckjs.Checked then
    begin
       geraverifica;
    end;

   dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;
      dmgeral.ibcampos.next;
  //se tiver arquivo
       if dmgeral.ibcamposTIPO.AsString='FL' then
         temf:=true;

       dmgeral.ibcampos.next;
  	 end;

 tm.Lines.Add('   <?php ');
  tm.Lines.Add('    $erro='''';');
  //tm.Lines.Add('    extract($_REQUEST);');

  tm.Lines.Add('  $'+nomeclasse+' = new '+nomeclasse+'($con);');
   tm.Lines.Add('');

  if chuser.Checked then
    begin

      tm.Lines.Add('          	$usr = new usuarios($con);   ');

      tm.Lines.Add('    			$usr->senha->login = $_SESSION["usr_login"];  //senha->  //$HTTP_SESSION_VARS    ');
      tm.Lines.Add('    	  	$usr->user_id = $_SESSION["usr_id"];//$HTTP_SESSION_VARS   ');
      tm.Lines.Add('    	  	$usr->busca();    ');
    	//	$usr->login($_SESSION["usr_login"],$_SESSION["usr_senha"]);

       tm.Lines.Add('    		$'+nomeclasse+'->user_id=$usr->user_id;  ');
    end;


  tm.Lines.Add('  	switch($opt) {   ');

  if falt.Checked then
  begin
	 tm.Lines.Add('  	case ''AG'': ');
	tm.Lines.Add(spaco+'$'+lowercase(nomeclasse)+'->'+lowercase(campop)+' = $'+lowercase(campop)+';');
  tm.Lines.Add(spaco+'$'+lowercase(nomeclasse)+'->busca();');
   tm.Lines.Add('');
   end;

   if finc.Checked then
  begin
    	tm.Lines.Add('  	case ''IG'':');
      tm.Lines.Add('');

      dmgeral.ibcampos.first;
    for i:=0 to dmgeral.ibcampos.RecordCount-1 do
    begin
      campo:=dmgeral.ibcamposCAMPO.AsString;
      tm.Lines.Add('    if(isset($_REQUEST['''+lowercase(campo)+''']))');
      if(dmgeral.ibcamposCDEC.asstring='2')then
           tm.Lines.Add('      $'+lowercase(nomeclasse)+'->'+lowercase(campo)+' = str_replace('','',''.'',$'+lowercase(campo)+'); ')
      else
      tm.Lines.Add('      $'+lowercase(nomeclasse)+'->'+lowercase(campo)+' = $'+lowercase(campo)+'; ');
      dmgeral.ibcampos.Next;
    end;
    end;
  temf:=false;
        dmgeral.ibcampos.first;
    for i:=0 to dmgeral.ibcampos.RecordCount-1 do
    begin
        if dmgeral.ibcamposTIPO.AsString='FL' then
         temf:=true;

         if(temf) then
        begin
          tm.Lines.Add('      //----------------------CAMPO ARQUIVO '+lowercase(campo)+'--------------------------------- ');
          tm.Lines.Add('  		if(isset($_REQUEST[''apaga'+lowercase(campo)+'''])) ');
          tm.Lines.Add('  	$apaga'+lowercase(campo)+'=$_REQUEST[''apaga'+lowercase(campo)+''']; ');
          tm.Lines.Add('  	else $apaga'+lowercase(campo)+'='';  ');
          tm.Lines.Add('           ');
          tm.Lines.Add('  	$'+lowercase(campo)+'="";   ');

          tm.Lines.Add('  	if(isset($_FILES['''+lowercase(campo)+'''][''name''])&&($_FILES['''+lowercase(campo)+'''][''name'']!='')&&($_FILES['''+lowercase(campo)+'''][''name'']!=''none''))');
          tm.Lines.Add('  	$'+lowercase(campo)+'=''.$_FILES['''+lowercase(campo)+'''][''name''];  ');

          tm.Lines.Add('  	/*    ');
          tm.Lines.Add('  	   ''type''     => $file[''type''][$key],    ');
          tm.Lines.Add('                      ''tmp_name'' => $file[''tmp_name''][$key],  ');
          tm.Lines.Add('                      ''error''    => $file[''error''][$key],  ');
          tm.Lines.Add('                      ''size''     => $file[''size''][$key],*/ ');
          tm.Lines.Add('                               ');
          tm.Lines.Add('  			if($apaga'+lowercase(campo)+'==''1'') ');
          tm.Lines.Add('  			     $'+lowercase(nomeclasse)+'->'+lowercase(campo)+' = "";  ');
          tm.Lines.Add('  				else        ');
          tm.Lines.Add('  			if((!empty($'+lowercase(campo)+')) &&($'+lowercase(campo)+'!="none")&& (trim($'+lowercase(campo)+')!=""))');
          tm.Lines.Add('  				$'+lowercase(nomeclasse)+'->'+lowercase(campo)+' = $'+lowercase(campo)+';  ');
          tm.Lines.Add('      //-------------------------------------------------------   ');
            temf:=false;
      end;
        dmgeral.ibcampos.Next;
    end;
    tm.Lines.Add('    if($opt=="IG") { ');
    if finc.Checked then
    begin
		tm.Lines.Add('  		if($'+lowercase(nomeclasse)+'->incluir($erro)) {');
 temf:=false;
        dmgeral.ibcampos.first;
    for i:=0 to dmgeral.ibcampos.RecordCount-1 do
    begin
        if dmgeral.ibcamposTIPO.AsString='FL' then
         temf:=true;

         if(temf) then
        begin
        tm.Lines.Add('  		//--------------ARQUIVO '+lowercase(campo)+'--------------      ');
        tm.Lines.Add('  	$upload_path=$_SERVER[''DOCUMENT_ROOT''].$caminho.imagemtopo;//$caminho.  ');
        tm.Lines.Add('  	// In PHP earlier then 4.1.0, $HTTP_POST_FILES  should be used instead of $_FILES. ');

        tm.Lines.Add('           ');
        tm.Lines.Add('  	$realname =''.$_FILES['''+lowercase(campo)+'''][''name''];   ');

        tm.Lines.Add('  	// In PHP earlier then 4.1.0, $HTTP_POST_FILES  should be used instead of $_FILES.  ');
        tm.Lines.Add('  	if (is_uploaded_file($_FILES['''+lowercase(campo)+'''][''tmp_name''])) {      ');
        tm.Lines.Add('  	   copy($_FILES['''+lowercase(campo)+'''][''tmp_name''], "$upload_path".$realname);   ');
        tm.Lines.Add('  	} else {          ');
        tm.Lines.Add('  	   echo "Nao foi possivel salvar o arquivo: " . $_FILES['''+lowercase(campo)+'''][''name''];  ');
        tm.Lines.Add('  	}     ');
        tm.Lines.Add('  	//---------------------------------------------------------    ');
        temf:=false;
      end;
        dmgeral.ibcampos.Next;
    end;
		tm.Lines.Add('      	echo "<script>alert(''Incluido com Sucesso!!!'');</script>";');
		tm.Lines.Add('  }else {   ');
	 //	tm.Lines.Add('  	$msg_erro = ($erro==1) ? "\\n- O login escolhido já existe, escolha outro" : "\\n - Erro de validação";
		tm.Lines.Add('  	echo "<script>alert(''Ocorreu um erro na Inclusao!!\\n" . $msg_erro . "'');</script>"; ');
		tm.Lines.Add('  		$opt="I"; ');
		tm.Lines.Add('  		break;   ');
		tm.Lines.Add('  	  }  ');
    end;

		tm.Lines.Add('  	}  ');
		tm.Lines.Add('  	else { ');

    if falt.Checked then
    begin
		tm.Lines.Add(' 	if($'+lowercase(nomeclasse)+'->alterar()) {');
        temf:=false;
        dmgeral.ibcampos.first;
    for i:=0 to dmgeral.ibcampos.RecordCount-1 do
    begin
        if dmgeral.ibcamposTIPO.AsString='FL' then
         temf:=true;

         if(temf) then
        begin
        tm.Lines.Add('  		//--------------ARQUIVO '+lowercase(campo)+'--------------      ');
        tm.Lines.Add('  	$upload_path=$_SERVER[''DOCUMENT_ROOT''].$caminho.imagemtopo;//$caminho.  ');
        tm.Lines.Add('  	// In PHP earlier then 4.1.0, $HTTP_POST_FILES  should be used instead of $_FILES. ');

        tm.Lines.Add('           ');
        tm.Lines.Add('  	$realname =''.$_FILES['''+lowercase(campo)+'''][''name''];   ');

        tm.Lines.Add('  	// In PHP earlier then 4.1.0, $HTTP_POST_FILES  should be used instead of $_FILES.  ');
        tm.Lines.Add('  	if (is_uploaded_file($_FILES['''+lowercase(campo)+'''][''tmp_name''])) {      ');
        tm.Lines.Add('  	   copy($_FILES['''+lowercase(campo)+'''][''tmp_name''], "$upload_path".$realname);   ');
        tm.Lines.Add('  	} else {          ');
        tm.Lines.Add('  	   echo "Nao foi possivel salvar o arquivo: " . $_FILES['''+lowercase(campo)+'''][''name''];  ');
        tm.Lines.Add('  	}     ');
        tm.Lines.Add('  	//---------------------------------------------------------    ');
        temf:=false;
      end;
        dmgeral.ibcampos.Next;
    end;
	//	tm.Lines.Add(' 		if($usr->senha->alterar($senha_atual,$senha))
		tm.Lines.Add(' 				echo "<script>alert(''Dados do '+lowercase(nomeclasse)+' alterados com Sucesso!!!'');</script>"; ');
	 //	tm.Lines.Add(' 			else
	//	tm.Lines.Add(' 				echo "<script>alert(''Ocorreu um erro na alteração da senha!!!'');</script>";  ');
		tm.Lines.Add(' }		else  ');
		tm.Lines.Add(' 			echo "<script>alert(''Não foi possivel alterar os Dados do '+lowercase(nomeclasse)+'!!!'');</script>";  ');
   end;

		tm.Lines.Add(' 	}  ');
		tm.Lines.Add(' 	$opt="";   ');
		tm.Lines.Add(' 	break;  ');
     if fmail.Checked then
    begin
		tm.Lines.Add(' case ''MG'':  ');
		tm.Lines.Add('	$sql = "SELECT email FROM '+lowercase(nomeclasse)+' WHERE '+lowercase(campop)+' IN ($dest)"; ');
		tm.Lines.Add('	$qry = new consulta($con); ');
		tm.Lines.Add('	$qry->executa($sql);  ');
		tm.Lines.Add('	$count_email = 0;  ');
		tm.Lines.Add('	if($qry->nrw>0) {  ');
		tm.Lines.Add('		for($i=0;$i<$qry->nrw;$i++) {  ');
		tm.Lines.Add('			'+lowercase(nomeclasse)+'->email = $qry->data[0];  ');
		tm.Lines.Add('			if('+lowercase(nomeclasse)+'->e_mail($assunto,$mensagem))  ');
		tm.Lines.Add('				$count_email++;   ');
		tm.Lines.Add('			$qry->proximo;  ');
		 tm.Lines.Add('		}    ');
		tm.Lines.Add('		echo "<script>alert(''" . (($count_email==1) ? "Foi enviado " : "Foram enviados ") . $count_email .   ');
	  tm.Lines.Add('			 " de um total de $qry->nrw " . (($qry->nrw==1) ? "email" : "emails") . "'');</script>";   ');
		tm.Lines.Add('	}    ');
		tm.Lines.Add('	else   ');
		tm.Lines.Add('		echo "<script>alert(''Nao foi possivel enviar os emails, a lista esta vazia!'');</script>";  ');
		tm.Lines.Add('	$opt = ""; ');
    end;
   	tm.Lines.Add('}  ');
	  tm.Lines.Add('');
   	tm.Lines.Add('switch($opt) {  ');
	  tm.Lines.Add('	case ''A'':		// Alterar dados   ');
		tm.Lines.Add('	$'+lowercase(nomeclasse)+'->'+lowercase(campop)+' = $'+lowercase(campop)+'; ');
		 tm.Lines.Add('	if(!$'+lowercase(nomeclasse)+'->busca()) {   ');
		 tm.Lines.Add('		echo "<p class=''txt1''>Erro no cadastro do '+lowercase(nomeclasse)+'!!!</p>"; ');
     tm.Lines.Add('			break;');
		 tm.Lines.Add('		} ');
   (*tm.Lines.Add('		$usr->senha->user_id = $usr->user_id;');  ');
		  tm.Lines.Add('		if(!$usr->senha->busca("u")) {    ');
		  tm.Lines.Add('		echo "<p class='txt1'>Erro no cadastro de senhas do usuário!!!</p>"; ');
		  tm.Lines.Add('		break;  ');
		  tm.Lines.Add('	} ');
		tm.Lines.Add('if($usr->senha->tipo==3 AND $usr_h->user_id!=$usr->user_id) { ');
		 tm.Lines.Add('		$opt="";  ');
		tm.Lines.Add('		break; ');
		 tm.Lines.Add('	}  ');    *)
     tm.Lines.Add('');
	 tm.Lines.Add('	case ''I'':		// Incluir novo '+lowercase(nomeclasse)+' ');
   tm.Lines.Add('?>  ');
	 (*	<script>
			var campos = new Array(<?php echo ($opt=="I") ?  "0,1,2,3,4,7,8,11,12,16" : "1,2,3,4,5,8,9,12,13,17,19"?>);
			var nomes = new Array("Nome","Endereço",
						"Bairro","CEP","Cidade",
						"Telefone","Email","Identidade",
						"CPF",<?php echo ($opt=="I") ? "\"Login\"" : "\"Senha\",\"Confirmação de Senha\""?>);
			var tipos = new Array(8,8,8,7,8,8,4,1,5,9,10);
			var status = new Array(1,1,1,1,1,1,1,1,1,1,1);
		</script>  *)

    temf:=false;
    comp:='';


     if temf then
       comp:=' enctype="multipart/form-data" ';
    
		 tm.Lines.Add('<form name="f'+lowercase(nomeclasse)+'" method="post"'+comp+' action="<?php echo $_SERVER[''PHP_SELF'']."?opt=$opt" . "G"?>" onSubmit="return valida_form(0,campos,nomes,tipos,status);">  ');
		 tm.Lines.Add('  <table border="0" cellpadding="0" cellspacing="0" width="500" height="100%" align="center"> ');
		 tm.Lines.Add('  <tr><td colspan="2" align="center">* Todos os campos s&atilde;o obrigat&oacute;rios<br /></td></tr>  ');

     dmgeral.ibcampos.first;
    for i:=0 to dmgeral.ibcampos.RecordCount-1 do
    begin
      campo:=dmgeral.ibcamposCAMPO.AsString;
      size:=dmgeral.ibcamposTAMANHO.AsString;
      tipo:=dmgeral.ibcamposTIPO.asstring;


		 tm.Lines.Add('	<tr>');
		  tm.Lines.Add('   	<td width="50%" height="30">'+Capitalize(' '+campo)+':</td> ');
      tm.Lines.Add('			<td width="50%" height="30">');
      if campo=campop then
      begin
			 tm.Lines.Add('		<b><?php echo ($'+lowercase(nomeclasse)+'->'+lowercase(campop)+'!=0) ? $'+lowercase(nomeclasse)+'->'+lowercase(campop)+' : ""?></b> ');
			 tm.Lines.Add('		<?php echo ($opt=="A") ? "<input type=''hidden'' name='''+lowercase(campop)+''' value=''$'+lowercase(nomeclasse)+'->'+lowercase(campop)+'''>" : "" ?>');
      end
      else
      begin


          if(tipo='TX')then
        begin
          if ckeditor.Checked then
          begin
           tm.Lines.Add('<?php       ');
           tm.Lines.Add('  // Include CKEditor class. ');
           tm.Lines.Add('  include_once "editor/ckeditor/ckeditor.php"; ');
           tm.Lines.Add('  include_once "editor/ckfinder/ckfinder.php"; ');

           tm.Lines.Add('  $ckeditor = new CKEditor();   ');
           tm.Lines.Add('  $ckeditor->basePath = "editor/ckeditor/"; ');
           tm.Lines.Add('  $ckfinder = new CKFinder(); ');
           tm.Lines.Add('  $ckfinder->BasePath = "editor/ckfinder/"; // Note: BasePath property in CKFinder class starts with capital letter');
           tm.Lines.Add('  $ckfinder->SetupCKEditorObject($ckeditor);  ');
           tm.Lines.Add('  $'+lowercase(campo)+' = $ckeditor->editor('''+lowercase(campo)+''', $'+lowercase(nomeclasse)+'->'+lowercase(campo)+');');

           tm.Lines.Add('?>   ');
           tm.Lines.Add('<script> ');
           tm.Lines.Add('function limitText(limitField, limitNum) {   ');
           tm.Lines.Add('    if (limitField.value.length > limitNum) {  ');
            tm.Lines.Add('       limitField.value = limitField.value.substring(0, limitNum); ');
           tm.Lines.Add('    }  ');
           tm.Lines.Add('}  ');
           tm.Lines.Add('</script> ');
          end
          else
           tm.Lines.Add('          <textarea cols=40 rows=10 name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+'''></textarea>');
        end else
        if(tipo='FL')then
        begin
           tm.Lines.Add('apagar '+lowercase(campo)+'<input type="checkbox" name="apaga'+lowercase(campo)+'" value="1" /> ');
           tm.Lines.Add('				<?php echo $'+lowercase(nomeclasse)+'->'+lowercase(campo)+'; ?><br />  ');
           tm.Lines.Add('				<input type="file" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' size="'+size+'" value="<?php echo $'+lowercase(nomeclasse)+'->'+lowercase(campo)+'; ?>">');

        end else if(tipo='HD')then
        begin
           tm.Lines.Add('				<input type="hidden" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' value="<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>"> ');
        end else if(tipo='BL')then
        begin
           tm.Lines.Add('				<input type="checkbox" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' value="1" <?php echo (troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')==1?'' checked="CHECKED"'':'''')?>> ');
        end
        else if(tipo='RD')then
        begin
           tm.Lines.Add('				<input type="radio" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' value="<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>"> ');
        end else if(tipo='SL')then
        begin
           tm.Lines.Add('				<select name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' value="<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>">');
           tm.Lines.Add('								<option value=""></option>  ');
           tm.Lines.Add('								<option value=""></option>  ');
           tm.Lines.Add('				</select>');
         end else if(tipo='IM')then
        begin
           tm.Lines.Add('				<input type="image" border="0" src="../images/<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' value="<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>"> ');
        end
        else
        begin
          s:='';
           if ckmoeda.Checked then
             if dmgeral.ibcamposCDEC.AsString='2' then
                s:='onKeyPress="return(MascaraMoeda(this,''.'','','',event))" onMouseDown="this.value=''''" ';
        tm.Lines.Add('				<input type="text" name="'+lowercase(campo)+'" id=''id'+lowercase(campo)+''' '+s+' size="'+size+'" value="<?php echo troca_car($'+lowercase(nomeclasse)+'->'+lowercase(campo)+')?>"> ');
        end;
      end;

			 tm.Lines.Add('	</td>  ');
  		 tm.Lines.Add('	</tr>  ');
       dmgeral.ibcampos.next;
  	 end;

  	 (*		<tr>
    			<td width="50%" height="30">Estado:</td>
    			<td width="50%" height="30">
				<select name="estado" size="1">
				<?php echo estados($usr->estado)?>
    			</select></td>
  			</tr>
       

			<?php
				if($opt=="A")
				{
			?>
  			<tr>
    			<td width="50%" height="30">Senha:</td>
    			<td width="50%" height="30">
					<input type="password" name="senha" size="10" value="<?php echo $usr->senha->senha?>" >
					<input type="hidden" name="senha_atual" value="<?php echo $usr->senha->senha?>">
				</td>
  			</tr>
  			<tr>
    			<td width="50%" height="30">Confirmação de Senha:</td>
    			<td width="50%" height="30"><input type="password" name="senha2" size="10" value="<?php echo $usr->senha->senha?>" ></td>
  			</tr>
			<?php
				}    


       <?php
				if($opt=="I") {
			?>
  			<tr height="30" valign="bottom">
    			<td width="50%" height="30">Tipo:</td>
    			<td width="50%" height="30">
				<input type="radio" value="1" name="tipo"> Administrador
				<input type="radio" value="2" name="tipo" CHECKED> Cliente
				<input type="radio" value="3" name="tipo" CHECKED> Agente
				<!--input type="radio" value="3" name="tipo"--><!-- Financeiro-->
				</td>
  			</tr>
			<?php
				}
			?>    *)

  		  tm.Lines.Add('	<tr height="60" valign="bottom">  ');
    		 tm.Lines.Add(' 	<td width="50%" ></td>    ');
    		 tm.Lines.Add(' 	<td width="50%" height="60" valign="bottom"><input type="submit" value="Salvar"></td>  ');
  			 tm.Lines.Add(' </tr>  ');
		   tm.Lines.Add(' </table>  ');
		 tm.Lines.Add('</form>  ');


     (*
<?php
			break;
	
		case 'L':		// Listar cadastro
		$dest='';
		if(isset($_REQUEST['email']))
		{
				    $email=$_REQUEST['email'];
			if(empty($email)) {
			//	echo "<p algin=\"center\" class=\"st1\">Selecione pelo menos um destinatário do email</p>";
			//	exit;
			}
			$dest = implode(",",$email);
			
			}
			$usr->listar($pagina,$dest);
			break;
		case 'M': 		// Enviar E-mail
		    $email=$_REQUEST['email'];
			if(empty($email)) {
				echo "<p algin=\"center\" class=\"st1\">Selecione pelo menos um destinatário do email</p>";
				exit;
			}
			$dest = implode(",",$email);
			$sql = "SELECT nome FROM usuarios WHERE user_id IN ($dest)";
			$qry = new consulta($con);
			$qry->executa($sql);
			if($qry->nrw<=0) {
				echo "<p class='txt1'>Ocorreu um erro na relação de usuários para E-mail!!</p>";
				echo "<p align='center'><a href='javascript:history.go(-1);'>Voltar</a></p>";
			} 
			else {
				$dest_nme = "";
				for($i=0;$i<$qry->nrw;$i++) {
					$dest_nme.= $qry->data[0] . (($i<$qry->nrw-1) ? ", " : "" );
					$qry->proximo();
				}
?>
		<form name="email" method="post" action="<?php echo $_SERVER['PHP_SELF']."?opt=$opt" . "G"?>" onSubmit="return checkemail();">
		  <table border="0" cellpadding="0" cellspacing="0" width="550"  height="100%" align="center">
			<tr>
		    	<td width="50%" height="30" nowrap valign="top">Destinatário(s):</td>
    			<td width="50%" height="30" valign="top">
					<b><?php echo $dest_nme?></b>
					<input type="hidden" name="dest" value="<?php echo $dest?>">
				</td>
  			</tr>
  			<tr>
				<td width="50%" height="30" valign="top">Assunto:</td>
    			<td width="50%" height="30"><input name="assunto" type="text" size="30"></td>
  			</tr>
  			<tr>	
				<td width="50%" height="30" valign="top">Mensagem:</td>
    			<td width="50%" height="30"><textarea name="mensagem" cols="40" rows="7"></textarea></td>
  			</tr>
  			<tr height="60" valign="bottom">
    			<td width="50%" height="30"></td>
    			<td width="50%" height="60" valign="bottom"><input type="submit" value="Salvar" src="imagens/bot_ok_am_gr.gif" border="0"></td>
  			</tr>
		  </table>
		</form>   *)
   tm.Lines.Add('<?php   ');
	// tm.Lines.Add('		}   ');
   tm.Lines.Add('  break;  ');
   if (fdet.checked)then
   begin
    tm.Lines.Add('   case ''DT'':		// Incluir novo espaco   ');
    tm.Lines.Add('	   $'+lowercase(nomeclasse)+'->'+lowercase(campop)+' = $'+lowercase(campop)+';   ');
    tm.Lines.Add('     $'+lowercase(nomeclasse)+'->busca(); ');
   tm.Lines.Add('?>  ');

   (*
   	$msg='';
				if(isset($_REQUEST["idemp"]))
				{
				$emp->id=$_REQUEST["idemp"];
				$emp->busca();
				  if($emp->user_id!=$usr->user_id ){
				     $msg='Empresa com acesso n&atilde;o permitido';
				  }
				}
     *)

     //<?php if($msg=='') { ?>
   tm.Lines.Add('       <div id="detalhes">');
    tm.Lines.Add('  <?php  echo $'+lowercase(nomeclasse)+'->detalhes();   ?>');
    tm.Lines.Add('       </div>');
   tm.Lines.Add('<?php  break;  ');
   end;
   if(fexc.Checked)then
   begin
   tm.Lines.Add('	case ''E'':		// Excluir '+lowercase(nomeclasse)+'');
   tm.Lines.Add('		$'+lowercase(nomeclasse)+'->'+lowercase(campop)+' = $'+lowercase(campop)+';  ');

   //se tem autorização
     if chuser.checked then
     begin
      tm.Lines.Add('	   /*  $usr->user_id = $user_id;    ');
      tm.Lines.Add('				$usr->senha->user_id = $usr->user_id;     ');
      tm.Lines.Add('				$usr->senha->busca("u");    ');
      tm.Lines.Add('				if($usr->senha->tipo==3 AND $usr_h->user_id!=$usr->user_id) {     ');
      tm.Lines.Add('				  	$opt="";    ');
      tm.Lines.Add('			echo "<p class=''text1''>Sem autorização para excluir  '+capitalize(nomeclasse)+'</p>"; ');

      tm.Lines.Add('					  break;    ');
      tm.Lines.Add('				} */     ');
      end;

     tm.Lines.Add('		if($'+lowercase(nomeclasse)+'->excluir())   ');
     tm.Lines.Add('			echo "<p class=''text1''>'+capitalize(nomeclasse)+' excluido(a) com sucesso!</p>";  ');
     tm.Lines.Add('		else   ');
     tm.Lines.Add('			echo "<p class=''text1''>N&atilde;o foi possivel excluir  '+capitalize(nomeclasse)+'</p>"; ');
     tm.Lines.Add('		break;  ');
   end;

   if fmail.checked then
   begin
  	 tm.Lines.Add('		     	case ''M'': 		// Enviar E-mail         ');
     tm.Lines.Add('				    $'+lowercase(nomeclasse)+'=$_REQUEST['''+lowercase(nomeclasse)+'''];      ');
     tm.Lines.Add('					if(empty($'+lowercase(nomeclasse)+')) {        ');
     tm.Lines.Add('						echo "<p algin=\"center\" class=\"st1\">Selecione pelo menos uma '+lowercase(nomeclasse)+' do email</p>";      ');
     tm.Lines.Add('						exit;   ');
     tm.Lines.Add('					}    ');
     tm.Lines.Add('					$dest = implode(",",$email);    ');
     tm.Lines.Add('					$sql = "SELECT nome FROM '+lowercase(nomeclasse)+' WHERE id IN ($dest)";    ');
     tm.Lines.Add('					$qry = new consulta($con);     ');
     tm.Lines.Add('					$qry->executa($sql);     ');
     tm.Lines.Add('					if($qry->nrw<=0) {     ');
     tm.Lines.Add('						echo "<p class=''txt1''>Ocorreu um erro na relação de '+lowercase(nomeclasse)+'s para E-mail!!</p>";    ');
     tm.Lines.Add('						echo "<p align=''center''><a href=''javascript:history.go(-1);''>Voltar</a></p>";    ');
     tm.Lines.Add('					}      ');
     tm.Lines.Add('					else {      ');
     tm.Lines.Add('						$dest_nme = "";     ');
     tm.Lines.Add('					for($i=0;$i<$qry->nrw;$i++) {      ');
     tm.Lines.Add('							$dest_nme.= $qry->data[0] . (($i<$qry->nrw-1) ? ", " : "" );    ');
     tm.Lines.Add('							$qry->proximo();   ');
     tm.Lines.Add('						}      ');
     tm.Lines.Add('		?>       ');
     tm.Lines.Add('				<form name="email" method="post" action="<?php echo $_SERVER[''PHP_SELF'']."?opt=$opt" . "G"?>" onSubmit="return checkemail();">   ');
     tm.Lines.Add('				  <table border="0" cellpadding="0" cellspacing="0" width="550"  height="100%" align="center">   ');
     tm.Lines.Add('					<tr>     ');
     tm.Lines.Add('				    	<td width="50%" height="30" nowrap valign="top">Destinatário(s):</td>   ');
     tm.Lines.Add('		    			<td width="50%" height="30" valign="top">    ');
     tm.Lines.Add('							<b><?php echo $dest_nme?></b>   ');
     tm.Lines.Add('							<input type="hidden" name="dest" value="<?php echo $dest?>">   ');
     tm.Lines.Add('						</td>    ');
     tm.Lines.Add('		  			</tr>     ');
     tm.Lines.Add('		  			<tr>     ');
     tm.Lines.Add('						<td width="50%" height="30" valign="top">Assunto:</td>   ');
     tm.Lines.Add('		   			<td width="50%" height="30"><input name="assunto" type="text" size="30"></td>   ');
     tm.Lines.Add('		  			</tr>    ');
     tm.Lines.Add('		  			<tr>     ');
     tm.Lines.Add('						<td width="50%" height="30" valign="top">Mensagem:</td>  ');
     tm.Lines.Add('		    			<td width="50%" height="30"><textarea name="mensagem" cols="40" rows="7"></textarea></td>    ');
     tm.Lines.Add('		  			</tr>    ');
     tm.Lines.Add('		  			<tr height="60" valign="bottom">    ');
     tm.Lines.Add('		    			<td width="50%" height="30"></td>    ');
     tm.Lines.Add('		    			<td width="50%" height="60" valign="bottom"><input type="submit" value="Salvar" src="imagens/bot_ok_am_gr.gif" border="0"></td>    ');
     tm.Lines.Add('		  			</tr>     ');
     tm.Lines.Add('				  </table>   ');
     tm.Lines.Add('				</form>   ');
     tm.Lines.Add('		<?php    ');
     tm.Lines.Add('					}    ');
     tm.Lines.Add('					break;    ');
   end;

	 tm.Lines.Add('	default:		// Selecionar   ');
	 tm.Lines.Add('		$'+lowercase(nomeclasse)+'->selecionar($pagina);  ');
	 tm.Lines.Add('}  ');

 	 tm.Lines.Add('		 ?>       ');
	 tm.Lines.Add('		<!--/div>     ');
	 tm.Lines.Add('		</td></tr></table>     ');
	 tm.Lines.Add('		</td></tr-->      ');
	 tm.Lines.Add('		      ');
	 tm.Lines.Add('		<?php     ');
	 tm.Lines.Add('		//	require("footer.php");     ');
	 tm.Lines.Add('		?>     ');

	 tm.Lines.Add('</body>     ');
	 tm.Lines.Add('</html>     ');



	(*
	//echo ($opt!="") ? "<p align='center'><a href='adm_man_usuarios.php'>Voltar Usuarios</a></p>" : "";
	echo "<br><br><p align='center'><a href='javascript:history.go(-1);'>Voltar</a></p>";
	//echo "<p align='center'><a href='adm_man_usuarios.php'>Voltar Usuarios</a></p>";
	//require("footer.shtml");
?>   *)
end;

procedure Tfgeracode.geradetalhes;
var c,sep, pe,nomeclasse,campo,campop,spaco,size:string;
i,cor:integer;
tm:tsynmemo;
begin
     nomeclasse:=dmgeral.ibclassesNOME.AsString;
     mdetalhes.Lines.Clear;
    tm:=  mdetalhes;
    tm:=mclasse;
    spaco:='        ';
    cor:=0;

   dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;
      dmgeral.ibcampos.next;
  end;
    tm.Lines.Add('function detalhes(){');
    tm.Lines.Add(' ?>');
   tm.Lines.Add('<div id="detalhes"> ');
      tm.Lines.Add('<h2>Detalhes</h2></hr> ');
   tm.Lines.Add('<table border="0" width="100%">  ');

   dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
      campo:=dmgeral.ibcamposCAMPO.AsString;
    if(cor=0)then
      cor:=1
    else cor:=0;

    if(cor=1)then
        tm.Lines.Add('<tr bgcolor="#ecf0e8">  ')
    else
        tm.Lines.Add('<tr>  ');
    tm.Lines.Add('   <td class="black-txt02"><strong>'+Capitalize(campo)+':</strong></td>');
    tm.Lines.Add('   <td class="data"><?php echo $'+'this'+'->'+lowercase(campo)+'; ?></td> ');  //lowercase(nomeclasse)
    tm.Lines.Add('</tr>  ');
     dmgeral.ibcampos.Next;
    end;

    tm.Lines.Add('</table> ');
    tm.Lines.Add('</div>  ');
     tm.Lines.Add(' <?   }  ');
end;

procedure Tfgeracode.geraverifica;
var c,sep, pe,nomeclasse,campo,campop,spaco,size:string;
i,cor:integer;
tm:tsynmemo;
begin
     nomeclasse:=dmgeral.ibclassesNOME.AsString;
     mjsform.Lines.Clear;
   // tm:=  mjsform;
   tm:=  mform;

    spaco:='    ';
    cor:=0;

   dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     if dmgeral.ibcamposCHAVE.AsString='S' then
      campop:=dmgeral.ibcamposCAMPO.AsString;
      dmgeral.ibcampos.next;
  end;

     tm.Lines.Add('<script language="javascript"  type="text/javascript"> ');
tm.Lines.Add('  function validacad() {    ');


        dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
      campo:=dmgeral.ibcamposCAMPO.AsString;
      if(campo <>campop)then
      tm.Lines.Add(spaco+'document.getElementById(''id'+lowercase(campo)+''').style.backgroundColor="#FFFFFF";');

     dmgeral.ibcampos.Next;
  end;

   dmgeral.ibcampos.first;
     for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
      campo:=dmgeral.ibcamposCAMPO.AsString;

     //  if(campo=campop)then continue;

      //if dmgeral.ibcamposTIPO.AsString='EM'then
       //validaemail
      if(campo <>campop)then
      begin
      tm.Lines.Add(spaco+' // '+lowercase(campo)+'');
     tm.Lines.Add(spaco+' if((document.getElementById(''id'+lowercase(campo)+''').value!='''')&&(document.getElementById(''id'+lowercase(campo)+''').value!=null))');
     tm.Lines.Add(spaco+' { ');

     if( dmgeral.ibcamposMINIMO.AsString<>'')then
     begin
      tm.Lines.Add(spaco+'  if(document.getElementById(''id'+lowercase(campo)+''').value.length<'+dmgeral.ibcamposMINIMO.AsString+'){');
      tm.Lines.Add(spaco+'alert('' '+lowercase(campo)+' invalido.'');');
      tm.Lines.Add(spaco+'document.getElementById(''id'+lowercase(campo)+''').style.backgroundColor="#DDDDFF";  ');
      tm.Lines.Add(spaco+'}');
     end;
     tm.Lines.Add(spaco+' } ');
      tm.Lines.Add(spaco+' else{ ');

      tm.Lines.Add(spaco+'alert(''Verifique se o '+lowercase(campo)+' foi digitado corretamente.'');');
      tm.Lines.Add(spaco+'document.getElementById(''id'+lowercase(campo)+''').style.backgroundColor="#DDDDFF";  ');
      tm.Lines.Add(spaco+'');
      tm.Lines.Add(spaco+'return false; ');

       tm.Lines.Add(spaco+' } ');
       end;
       dmgeral.ibcampos.next;
   end;
   (*
 {
    if(document.getElementById('EmailConfirm').value!=document.getElementById('email').value)
	{
	   alert('Email n&atilde;o foi confirmado.\n Verifique se o email foi digitado corretamente.');
	   document.getElementById('EmailConfirm').style.backgroundColor="#DDDDFF";

	   return false;
	}
 }else
     *)
          tm.Lines.Add(spaco+' return true; ');
          tm.Lines.Add(spaco+' }');
          tm.Lines.Add(spaco+'</script>');


end;

procedure Tfgeracode.Sobre2Click(Sender: TObject);
begin
    AboutBox.Show;
end;

procedure Tfgeracode.criacamps;
begin
     listcfb:=tlist.create;
     listcmy:=tlist.create;

  //campos bf
  campor:=tcampo.create;
  campor.tpsel:= '';
  campor.lmin:=0;
  campor.lmax:=3;
  campor.campofb:='';

    //campos my
  campor:=tcampo.create;
  campor.tpsel:= 'NO';
  campor.lmin:=1;
  campor.lmax:=2;
  campor.campomy:= 'TINYINT';
  listcmy.Add(campor);

    campor:=tcampo.create;
  campor.tpsel:= 'NO';
  campor.lmin:=3;
  campor.lmax:=4;
  campor.campomy:= 'SMALLINT';
  listcmy.Add(campor);

  campor:=tcampo.create;
  campor.tpsel:= 'NO';
  campor.lmin:=5;
  campor.lmax:=6;
  campor.campomy:= 'MEDIUMINT';
  listcmy.Add(campor);

    campor:=tcampo.create;
  campor.tpsel:= 'NO';
  campor.lmin:=7;
  campor.lmax:=9;
  campor.campomy:= 'INTEGER';
  listcmy.Add(campor);

  campor:=tcampo.create;
  campor.tpsel:= 'NO';
  campor.lmin:=10;
  campor.lmax:=18;
  campor.campomy:= 'BIGINT';
  listcmy.Add(campor);

  //floats
    campor:=tcampo.create;
  campor.tpsel:= 'DC';
  campor.lmin:=1;
  campor.lmax:=9;
  campor.campomy:= 'DECIMAL';
  listcmy.Add(campor);

    campor:=tcampo.create;
  campor.tpsel:= 'DC';
  campor.lmin:=10;
  campor.lmax:=18;
  campor.campomy:= 'DOUBLE';
  listcmy.Add(campor);
end;

function Getchars(): string;
var
  I: Char;
begin
  I := High(I);
  for I := #1 to I do
  //  if I in Grupo then
    begin
      if Result <> '' then
        Result := Result + ',';

      Result := Result + I;
    end;
     showmessage(result);
 // if Brackets then
    Result := '[' + Result + ']';

end;

procedure Tfgeracode.btn1Click(Sender: TObject);
begin
Getchars();
end;

procedure Tfgeracode.btn2Click(Sender: TObject);
begin
if dmgeral.dscodes1.State in [dsinsert,dsedit] then
begin
  dmgeral.ibcodesCODIGO.AsString:=syncode.Text;
  dmgeral.ibcodes.post;
  dmgeral.ibcampos.open;
  end;
end;



procedure Tfgeracode.Button2Click(Sender: TObject);
begin
  geracreatemy();
end;

    function gettipo(str:string):string;
  var i:integer;
  begin
    for i:=0 to sizeof(con) do
    begin
        if dmgeral.tipos.Names[i]=str then
           result:=dmgeral.tipos.Values[dmgeral.tipos.Names[i]];
    end;
  end;

procedure Tfgeracode.geracreatemy;
var nomeclasse,campop,campo,obrig,tam,s,l,u,d,t,default,tipo,dc:string;
i,j:integer;
v:string;

       function setl(st:string):string;
    begin
       l:= st;
       result:='';
    end;
    function iif(condicao:boolean;rest,resf:variant):variant;
  begin
    if condicao then
      result:=(rest);

    result:=resf;
  end;

begin
    nomeclasse:=dmgeral.ibclassesNOME.AsString;
   syncreatemy.Lines.Clear;

   syncreatemy.Lines.Add('');



   syncreatemy.Lines.Add('-- --------------------------------------------------------');

   syncreatemy.Lines.Add('-- ');
   syncreatemy.Lines.Add('-- Estrutura da tabela `'+nomeclasse+'`');
   syncreatemy.Lines.Add('--  ');

   syncreatemy.Lines.Add('CREATE TABLE IF NOT EXISTS `'+nomeclasse+'` (  ');

     dmgeral.ibcampos.first;

     //chave primaria
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin

     obrig:= dmgeral.ibcamposOBRIGATORIO.AsString;
     tam:= dmgeral.ibcamposTAMANHO.AsString;

     if uppercase(dmgeral.ibcamposCHAVE.AsString)='S' then
     begin
      campop:=dmgeral.ibcamposCAMPO.AsString;
      obrig:='S';
      s:=iif((obrig='S'),'NOT NULL','');
      l:='';
        if(dmgeral.ibcamposTIPO.Value=('NO')) then
           setl('  `'+campop+'` int(11) '+s+' AUTO_INCREMENT ,');

        if(dmgeral.ibcamposTIPO.Value=('ST'))then
           setl('  `'+campop+'` varchar('+tam+') '+s+', ');

       syncreatemy.Lines.Add(''+l+' ');//`'+lowercase(campop)+'` ,
     end;

      dmgeral.ibcampos.next;
  end;

  //campos
  dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
    l:='';

      campo:=dmgeral.ibcamposCAMPO.AsString;

      obrig:= dmgeral.ibcamposOBRIGATORIO.AsString;
      default:= dmgeral.ibcamposPADRAO.asstring;
      tipo:=dmgeral.ibcamposTIPO.asstring;
      tam:= dmgeral.ibcamposTAMANHO.AsString;
      dc:= dmgeral.ibcamposCDEC.asstring;
      u:=dmgeral.ibcamposUNICO.AsString;
       if (obrig='S') then
      s:='NOT NULL';
      d:='';
      t:='';

      if(tam<>'')then
       if(strtoint(tam)>0)then
         t:='('+tam+')';

      if(obrig='S') then
      begin
        if (tipo=('ST'))then
        d:=iif((default<>''),' DEFAULT `'+default+'` ','  ');
        if (tipo=('NO'))then
        d:=iif((default<>''),' DEFAULT '+default+' ','  ');
        if (tipo=('DT'))then
        d:=iif((default<>''),' DEFAULT '+default+' ',' ');
      end;

      if(u='S') then
      begin
        d:=iif((default=''),' DEFAULT NULL ','');
      end;

      //  variant aceita funcao
      if(tipo=('ST'))then
         setl('  varchar('+tam+') '+s+' '+d);
      if(tipo=('TX'))then
         setl('  text '+s+' '+d);
      if(tipo=('DT'))then
         setl('  date '+s+' '+d);
      if(tipo=('HR'))then
         setl('  time '+s+' '+d);
      if(tipo=('IM'))then
         setl('  varchar'+t+' '+s+' '+d);
      if(tipo=('FL'))then
         setl('  varchar'+t+' '+s+' '+d);
      if(tipo=('HD'))then
        setl('  varchar'+t+' '+s+' '+d);
      if(tipo=('AN'))then
         setl('  year '+s+' '+d+', ');
      //pegar pelo tamanho (mysql)
      if(tipo=('NO'))then
          if(dmgeral.ibcamposCDEC.asstring>='2')then
            setl('  float('+tam+','+dmgeral.ibcamposCDEC.asstring+') '+s+' '+d)
          else
            setl('  int'+t+' '+s+' '+d);
      if(tipo=('EM'))then
         setl('  varchar(100) '+s+' '+d);


    for j:=0 to listcmy.Count-1 do
    begin
      if(tam<>'')then
      try
      if(strtoint(tam)>0)then

        if (Tcampo(listcmy.Items[j]).tpsel=tipo) then
           if (strtoint(tam)>=Tcampo(listcmy.Items[j]).lmin)and(strtoint(tam)<=Tcampo(listcmy.Items[j]).lmax)then
             if(Tcampo(listcmy.Items[j]).campomy='DECIMAL') or (Tcampo(listcmy.Items[j]).campomy='DOUBLE')then
               setl('  '+Tcampo(listcmy.Items[j]).campomy+'('+tam+','+dc+') '+s+' '+d);
      except;
      end;         
    end;

      if(tipo=('DC'))then
      begin
        if(dc='')then
           setl('  FLOAT'+t+' '+s+' '+d);
      end;

      if(tipo=('BL'))then
         setl('  bool '+s+' '+d);

        if i= dmgeral.ibcampos.RecordCount-1 then
        v:=''
        else v:=',';

      if(campo <>campop)then
         syncreatemy.Lines.Add('  `'+lowercase(campo)+'` '+l+v+' ');

       dmgeral.ibcampos.Next;
  end;

    {
   syncreatemy.Lines.Add('  `idbanda` int(11) DEFAULT NULL,
    syncreatemy.Lines.Add(' `local` int(11) DEFAULT NULL,
    syncreatemy.Lines.Add(' `cidade` varchar(30) DEFAULT NULL,
    syncreatemy.Lines.Add(' `uf` varchar(2) DEFAULT NULL,
    syncreatemy.Lines.Add(' `data` date DEFAULT NULL,
    syncreatemy.Lines.Add(' `hora` time DEFAULT NULL,
   syncreatemy.Lines.Add('  `user_id` int(11) DEFAULT NULL,
   syncreatemy.Lines.Add('  `ativo` int(11) DEFAULT NULL,
   syncreatemy.Lines.Add('  `obs` text,
         }


    //unicos
    dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
      campo:=dmgeral.ibcamposCAMPO.AsString;
      obrig:= dmgeral.ibcamposOBRIGATORIO.AsString;
      u:=dmgeral.ibcamposUNICO.AsString;

     if u='S' then
     begin
        syncreatemy.Lines.Add('   UNIQUE KEY `'+campo+'` (`u_'+campo+'`),');
     end;
     dmgeral.ibcampos.next;
   end;


   if(campop<>'')then
   syncreatemy.Lines.Add('   PRIMARY KEY (`'+campop+'`)');
   syncreatemy.Lines.Add(') ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;');
end;

{O Delphi possui uma função chamada ExtractStrings na unit Classes com a mesma funcionalidade do Explode do PHP.

Declaração
function ExtractStrings(Separators, WhiteSpace: TSysCharSet; Content: PChar; Strings: TStrings): Integer;

Exemplo de uso:
ExtractStrings([';'], [' '],'valor1;valor2;valor3', Memo1.Lines);}
procedure Tfgeracode.cbb1Change(Sender: TObject);
var s:string;
begin
     if edpesq.text<>''then
     s:=' and descricao like ''%'+edpesq.Text+'%''';
    dmgeral.ibcodes.close;
    dmgeral.ibcodes.sql.Text:='select *  from CODIGOS where lingua='''+cbb1.text+''' '+s;
    dmgeral.ibcodes.Prepare;
    dmgeral.ibcodes.open;
    dbgrid3.Refresh;
end;

procedure Tfgeracode.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
    eddiretorio.Text:=extractfilepath(opendialog1.Files[0]);
end;

function CopiaDirs(DirFonte,DirDest : String) : Boolean;
var
  ShFileOpStruct : TShFileOpStruct;
begin
  Result := False;
  if DirFonte = '' then
    raise Exception.Create(
      'Diretório fonte não pode ficar em branco');
  if DirDest = '' then
    raise Exception.Create(
      'Diretório destino não pode ficar em branco');
  if not DirectoryExists(DirFonte) then
    raise Exception.Create('Diretório fonte inexistente');

    if DirectoryExists(DirDest) then
  ShowMessage('O diretório já existe');


  DirFonte := DirFonte+#0;
  DirDest := DirDest+#0;
  FillChar(ShFileOpStruct,Sizeof(TShFileOpStruct),0);
  with ShFileOpStruct do begin
    Wnd := Application.Handle;
    wFunc := FO_COPY;
    pFrom := PChar(DirFonte);
    pTo := PChar(DirDest);
    fFlags := FOF_ALLOWUNDO or FOF_SIMPLEPROGRESS or
       FOF_NOCONFIRMATION;
  end;
  ShFileOperation(ShFileOpStruct);
end;

procedure Tfgeracode.cxButton2Click(Sender: TObject);
var
SR: TSearchRec;
I: integer;
Origem, Destino: string;
tc:tcxchecklistboxitem;
begin
  //esse botao prepara os itens que serão gravados na pasta destino
  //1-pastas do diretorio Gravar


  Origem := extractfilepath(application.ExeName)+'\gravar\*.*';
  listbox.Items.Clear;

  I := FindFirst(Origem, faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) = faDirectory then
    begin
      //para cada diretorio
      //poe na lista
      if SR.Name<>'.' then
      if SR.Name<>'..' then
      begin


        tc:=listbox.Items.add;

        //tcxchecklistboxitem.Create(tcollection(listbox));
        tc.Text:= '\'+SR.Name;
        tc.Checked:=true;
      end;

    end;

   { if (SR.Attr and faDirectory) <> faDirectory then
    begin
      Origem := ''c:origem'' + SR.Name;
      Destino := ''c:Destino'' + SR.Name;
      if not CopyFile(PChar(Origem), PChar(Destino), true) then
      ShowMessage(''Erro ao copiar '' + Origem + '' para '' + Destino);
    end;
    }
    I := FindNext(SR);
  end;
    //2-todas as classes que para ticar
    dmgeral.ibclasses.open;
    dmgeral.ibclasses.last;
    dmgeral.ibclasses.first;
    while not dmgeral.ibclasses.eof do
    begin
      //coloca classe na lista
      tc:=listbox.Items.add;

      tc.Text:= dmgeral.ibclasses.fieldbyname('nome').AsString;

      tc.Checked:=false;


      dmgeral.ibclasses.next;
    end;

 {//Não se esqueça de declarar "ShellAPI" na uses do seu programa!
02
03	procedure TForm1.Copia(Origem, Destino: String);
04	var
05	   Parametros: Pchar;
06	begin
07	   Parametros := Pchar('"' + Origem + '" "' + Destino + '" /S /Y');
08	   ShellExecute(handle, '', 'xCopy', Parametros, '', SW_SHOW);
09	end;
10	//Onde: /S elimina as pastas vazias para copiar
11	//   e  /Y omite o chamado "Sim/Nao" para substituir arquivos existentes na Pasta
12	 
13	//Para Chamar o Procedimento use:
14	 
15	Copia('C:\Minha pasta','D:\MeuDestino')
}

{ Copiando uma pasta com subdiretórios no Delphi

Um leitor do blog perguntou como copiar uma pasta com subdiretórios no Delphi. Temos diversas maneiras de fazer isso:


    Usando a Api do Windows

    Usando funções do Delphi


Nesta postagem, iremos ver a maneira fácil de fazer isso: com a Api do Windows. A outra maneira fica para uma outra postagem.
Para copiar um diretório e suas subpastas usando a Api do Windows, usamos a função ShFileOperation, definida em ShellApi.pas. Ela recebe apenas um parâmetro, do tipo TShFileOpStruct, uma estrutura contendo as informações de cópia (na realidade, esta função permite também outras operações de arquivos, como exclusão ou movimentação). Basta preencher a estrutura e chamar a função. Assim, poderíamos criar uma função CopiaDirs assim:




}
end;

procedure Tfgeracode.cxButton1Click(Sender: TObject);
var
SR: TSearchRec;
I,j: integer;
Origem, Destino: string;
tc:tcxchecklistboxitem;
begin
   //esse botao copia os arquivos obrigatorios para a pasta output
   //e cria arquivos novos de acordo com as classes

     Origem := extractfilepath(application.ExeName)+'\gravar\*.*';


  I := FindFirst(Origem, faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) = faDirectory then
    begin
      //para cada diretorio
      //poe na lista
      if SR.Name<>'.' then
      if SR.Name<>'..' then
      begin
        //se o diretorio tiver checado alista entao copia!!!!
        for j:=0 to listbox.Count-1 do
        begin

          //showmessage(listbox.Items.Items[j].Text);
        if (listbox.Items.Items[j].Text<>'') and
           listbox.Items.Items[j].Checked and
           (listbox.Items.Items[j].Text = '\'+SR.Name) then
         begin
           //copia tudo
            Origem := extractfilepath(application.ExeName)+'\gravar'+listbox.Items.Items[j].Text;
            Destino := eddiretorio.Text+listbox.Items.Items[j].Text;
            if not fileexists(Destino) then
           CopiaDirs(Origem,Destino);

         end;
       end;
      end;

    end;

   { if (SR.Attr and faDirectory) <> faDirectory then
    begin
      Origem := ''c:origem'' + SR.Name;
      Destino := ''c:Destino'' + SR.Name;
      if not CopyFile(PChar(Origem), PChar(Destino), true) then
      ShowMessage(''Erro ao copiar '' + Origem + '' para '' + Destino);
    end;
    }
    I := FindNext(SR);
  end;

  //agora copia as classes criando arquivos
   //para cada texto da lista procura a classe correspondente
    for j:=0 to listbox.Count-1 do
    begin

      showmessage(inttostr(pos('\',listbox.Items.Items[j].Text)));
    if (listbox.Items.Items[j].Text<>'') and
       listbox.Items.Items[j].Checked and
       (pos('\',listbox.Items.Items[j].Text)=0)
       then
     begin
       //localiza classe e cria arquivos

        dmgeral.ibclasses.close;
       dmgeral.ibclasses.SQL.Text:='select * from classes where nome='''+listbox.Items.Items[j].Text+'''';
       dmgeral.ibclasses.open;
       dmgeral.ibclasses.first;
       if dmgeral.ibclasses.RecordCount>0 then
       begin
         //achou a classe
         //cria arquivos a partor do geraphp

         Button1.Click;
         Button2.Click;

         Destino := eddiretorio.Text+'\sql\'+listbox.Items.Items[j].Text;
         //salva
         syncreatemy.Lines.SaveToFile(destino+'.sql');

         Destino := eddiretorio.Text+'\classes\'+'class_'+listbox.Items.Items[j].Text;
         mclasse.Lines.SaveToFile(destino+'.php');
       end;

     end;
     end;
     dmgeral.ibclasses.close;
     dmgeral.ibclasses.SQL.Text:='select * from classes';
     dmgeral.ibclasses.open;

       listbox.Items.Clear;

  {
   if DirectoryExists('C:\MEUSDOCS') then
  ShowMessage('O diretório existe')
else
  ShowMessage('O diretório não existe');


//Inclua na seção uses: SysUtils, Dialogs

if FileExists('c:\carta.doc') then
  ShowMessage('O arquivo existe')
else
  ShowMessage('O arquivo não existe');  }

end;

procedure Tfgeracode.geraajax;
var nomeclasse,campop,campo,obrig,tam,s,l,u,d,t,default,tipo,dc:string;
i,j:integer;
v:string;
begin
         nomeclasse:=dmgeral.ibclassesNOME.AsString;
   majax.Lines.Clear;

   majax.Lines.Add('');


    majax.Lines.Add('function insere'+nomeclasse+'() ');
   majax.Lines.Add('{');


   //	var user = document.getElementById("user").value; // $("#user").value;

     dmgeral.ibcampos.first;
  for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     campop:='';

     if dmgeral.ibcamposCHAVE.AsString<>'S' then
     begin
      campop:=dmgeral.ibcamposCAMPO.AsString;

      majax.Lines.Add('	  var v'+campop+' = document.getElementById("id' +campop +'").value;');
      end;
      dmgeral.ibcampos.next;
   end;


 //	if(document.getElementById("lembrar").checked)
 //	{len=1;	}else {len=0;}
	 //$("#lembrar").value;

    majax.Lines.Add('');
    majax.Lines.Add('	var request = $.ajax({     ');
    majax.Lines.Add('	  url: "'+nomeclasse+'.php",   ');
	   majax.Lines.Add('  type: "POST",       ');
    majax.Lines.Add('	  data: {');

       dmgeral.ibcampos.first;
      for i:=0 to dmgeral.ibcampos.RecordCount-1 do
  begin
     campop:='';

     if dmgeral.ibcamposCHAVE.AsString<>'S' then
     begin
      campop:=dmgeral.ibcamposCAMPO.AsString;

      majax.Lines.Add('    '+campop+':'+'v'+campop+',' );
      end;
    dmgeral.ibcampos.next;
   end;
  //  usuario : user, senha: sen, lembrar:len},

     majax.Lines.Add('	}, ');
	   majax.Lines.Add('  dataType: "html" ');
    majax.Lines.Add('	}); ');
    majax.Lines.Add('');
    majax.Lines.Add('	request.done(function(msg) {  ');
    majax.Lines.Add('	  $("#tip").html( msg );  ');
    majax.Lines.Add('	});  ');
    majax.Lines.Add('');
    majax.Lines.Add('	request.fail(function(jqXHR, textStatus) { ');
    majax.Lines.Add('	  alert( "Request failed: " + textStatus );  ');
    majax.Lines.Add('	}); ');
	  majax.Lines.Add('');
    majax.Lines.Add('}');




end;

end.
