<?php

	//require_once("header.php");
/*	
$ip = $_SERVER['REMOTE_ADDR'];
$sessao = session_id();
$hora = date("H:i:s");
$data = date("d/m/Y");


if($fn_logado == true){	
$usuario = $fn_id_user;
}else{
$usuario = "visitante";	
}*/


class visitas{
		var $bd;
		
		var $ip;
		var $hora;
		var $data;
		var $sessao;
		
		function visitas($bd) {
			global $usr_login;
			$this->bd = $bd;
			
			$this->ip = $_SERVER['REMOTE_ADDR'];
			$this->sessao = session_id();
			$this->hora = date("H:i:s");
			$this->data = date("d/m/Y");
			if(isset($usr_login))
			$this->usuario=$usr_login;
			else $this->usuario="visitante";
		}
		
	function inc_visita()
		{	global $usr_id;
		
			$sql = "SELECT * FROM fn_visitas WHERE sessao = \"".$this->sessao."\"";
		

			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			//if(!$qry->res OR $qry->nrw<=0)
				    // return false;
					
			$conta_online = $qry->nrw;
			$this->cod_categoria=$qry->data["cod_categoria"];

			if($conta_online<=0){
			
			if(isset($usr_id))
			   $geraId =$usr_id;
			else $geraId =0;  //$geraId = md5(rand()); //.rand()
			$sql = "INSERT INTO fn_visitas VALUES(\"$geraId\", \"".$this->usuario."\", '', '', '', \"".$this->ip."\", \"".$this->sessao."\", \"".$this->hora."\", \"".$this->data."\")";	
			
			$qry->executa($sql);
			}
		}
		
//$busca_online = mysql_query("SELECT * FROM fn_visitas WHERE sessao = \"$sessao\"");
//$conta_online = mysql_num_rows($busca_online);
/*
if(!$conta_online){
	//$geraId = md5(rand()); //.rand()
	$geraId =$usr_id;
	mysql_query("INSERT INTO fn_visitas VALUES(\"$geraId\", \"$usuario\", '', '', '', \"$ip\", \"$sessao\", \"$hora\", \"$data\")");	
}
$resolucao = $_GET["resolucao"];
$operacional = $_GET["operacional"];
if(isset($operacional))
mysql_query("UPDATE fn_visitas SET sistema = \"$operacional\" WHERE sessao = \"$sessao\"");
*/

function buscaMYSQLNUM($tabela, $coluna, $where){
	//$busc = mysql_query("SELECT $coluna FROM $tabela $where");
		$sql = "SELECT $coluna FROM $tabela $where";
		

			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
	$num = $qry->nrw; //mysql_num_rows($busc);
	if($num < 10) $num = "00".$num;
	elseif($num < 100) $num = "0".$num;
	return $num;
}


	function stats()
	{

$totalSemana = 0;
$dias = array("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
$dias2 = array("Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo");
for($i=0;$i<7;$i++){
	$hoje = mktime(0,0,0,date("m"), date("d")-$i, date("Y"));
	$dia = date("d/m/Y", $hoje);
	$visitas["n"][] = $i;
	$vAtual = $this->buscaMYSQLNUM("fn_visitas", "id", "WHERE data = \"$dia\"");
	$visitas["visitas"][] = $vAtual;
	$visitas["nome"][] = date("D", $hoje);
	$totalSemana += $vAtual;
}
array_multisort($visitas["n"], SORT_DESC, $visitas["visitas"], $visitas["nome"]);

$porc_1 = @round(100*$visitas["visitas"][0]/$totalSemana, 2);
$porc_2 = @round(100*$visitas["visitas"][1]/$totalSemana, 2);
$porc_3 = @round(100*$visitas["visitas"][2]/$totalSemana, 2);
$porc_4 = @round(100*$visitas["visitas"][3]/$totalSemana, 2);
$porc_5 = @round(100*$visitas["visitas"][4]/$totalSemana, 2);
$porc_6 = @round(100*$visitas["visitas"][5]/$totalSemana, 2);
$porc_7 = @round(100*$visitas["visitas"][6]/$totalSemana, 2);

$visitas["nome"] = str_replace($dias, $dias2, $visitas["nome"]);
?>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table align="center" width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="height:30px;background:#000099;">
            <table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10">&nbsp;</td>
                <td><span style="color:#FFF;font:19px 'Trebuchet MS'; font-family: 'Trebuchet MS'; font-size: 19px">Estatísticas visitas</span></td>
              </tr>
            </table></td>
          </tr>
          <tr><!--#d3d3d3-->
            <td valign="bottom" style="background-color:#FFF;background-image:url(../fh_office/_imagens/arabesco.jpg);height:150px;">
            <table border="0" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="815" height="159" align="left"><table border="0" cellspacing="5" cellpadding="8">
                  <tr>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][0]?>
                      (
                      <?=$porc_1?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][1]?>
                      (
                      <?=$porc_2?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][2]?>
                      (
                      <?=$porc_3?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][3]?>
                      (
                      <?=$porc_4?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][4]?>
                      (
                      <?=$porc_5?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][5]?>
                      (
                      <?=$porc_6?>
                      % )</span></td>
                    <td height="10"><span style="font-size:12px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["visitas"][6]?>
                      (
                      <?=$porc_7?>
                      % )</span></td>
                  </tr>
                  <tr style="height:150px;">
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_1?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_2?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_3?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_4?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_5?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_6?>%" /></span></td>
                    <td align="center" valign="bottom" style="height:150px;"><span style="margin:0;"><img src="../fh_office/imagens/stats.jpg" alt="" width="52" height="<?=$porc_7?>%" /></span></td>
                  </tr>
                  <tr>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["nome"][0]?>
                    </span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["nome"][1]?>
                    </span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["nome"][2]?>
                    </span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["nome"][3]?>
                    </span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">
                      <?=$visitas["nome"][4]?>
                    </span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">Ontem</span></td>
                    <td align="center"><span style="font-size:14px;font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;">Hoje</span></td>
                  </tr>
                </table></td>
                <td width="251" align="right" valign='top' style="padding:5px;">
                <?
				/*
                <ul style="list-style:none;font-size:13px;padding:3;">
                <li>Usuários registrados: <?=buscaMYSQLNUM("fn_ferraCadastro", "id", "")?></li>
                <li>Administradores registrados: <?=buscaMYSQLNUM("fn_users", "id", "")?></li>
                <li>Modulos cadastros: <?=buscaMYSQLNUM("fn_modulos", "id", "")?></li>
                <li>Sub-módulos: <?=buscaMYSQLNUM("fn_modulosCategory", "id", "")?>
                </li>
                </ul>
				*/
				?>
                <br /><br /><br />
                <?php
				/*
				$busca_informacoes = mysql_query("SELECT * FROM fn_informacoes WHERE nome = 'link_webmail'");
				if(mysql_num_rows($busca_informacoes)){
				$link_webmail_stats = html_entity_decode(mysql_result($busca_informacoes, 0, 'valor'));	
			    }*/
				?>
                <!--a href="/webmail/" target="_blank"><img border="0" src="imagens/email.jpg" alt="Email" width="80"></a-->
                </td>
              </tr>
              <tr>
                <td colspan="2" align="center"><hr></td>
              </tr>
            </table>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
	<?	
	}

}

?>