<?php 

function isnumero($var)
{
	if(!is_numeric(trim($var)) )
	{
	echo "Nro. Inválido!";
	exit;
	return false;
	}
	return true;
}
function verificaPost($varPost){
	
	return htmlspecialchars(utf8_decode($varPost), ENT_QUOTES);

}
	
############### VALIDAÇÕES ###############
// ID
function getID($id) {
	if (function_exists('filter_var'))
		$id = filter_var($id, FILTER_VALIDATE_INT);
	$id = (int) $id;

	return $id;
}
// FlOAT
function getFloat($input) {
	if (is_float($input))
		return $input;
	else
		return false;
}

// Alfanumerico
function getAlpha($input) {
	if (ctype_alnum($input))
		return $input;
	else
		return false;
}

// Email
function getEmail($email) {
	$email = htmlspecialchars($email);
	if (function_exists('filter_var'))
		$email = filter_var($email, FILTER_VALIDATE_EMAIL);

	return $email;
}

/*function apiki_isEmail($strEmail) {
	if ( preg_match('/^([w.-]+)+@+([w.-]+)+.+[a-z]{2,3}$/',$strEmail) ) {
		return true;
	} else {
		return false;
	}
}
*/

function validaEMAIL($email){ 
   $mail_correcto = 0; 
   
   //verifico umas coisas 
   if ((strlen($email) >= 6) && (substr_count($email,"@") == 1) && (substr($email,0,1) != "@") && (substr($email,strlen($email)-1,1) != "@")){ 
   
      if ((!strstr($email,"'")) && (!strstr($email,"\"")) && (!strstr($email,"\\")) && (!strstr($email,"\$")) && (!strstr($email," "))) { 
	  
         //vejo se tem caracter . (ponto)
         if (substr_count($email,".")>= 1){ 
		 
            //obtenho a terminação do dominio 
            $term_dom = substr(strrchr ($email, '.'),1); 
			
            //verifico que a terminação do dominio seja correcta 
			 if (strlen($term_dom)>1 && strlen($term_dom)<5 && (!strstr($term_dom,"@")) ){ 
			 
	            //verifico que o de antes do dominio seja correcto 
				$antes_dom = substr($email,0,strlen($email) - strlen($term_dom) - 1); 
				$caracter_ult = substr($antes_dom,strlen($antes_dom)-1,1); 
				
			   if ($caracter_ult != "@" && $caracter_ult != "."){ 
				   $mail_correcto = 1; 
			   } 
			}
         } 
      } 
   } 
   return $mail_correcto;
} 


/*function validaEmail ($email) {
	$email = htmlspecialchars($email);
	if (ereg("^([0-9,a-z,A-Z]+)([.,_-]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$", $email)) {
		return $email;
	} else {
		return false;
	}
}
*/
// ESCAPAR STRINGS (usar depois que a conexão com o banco for aberta)
function escape($v) {
	$v = htmlspecialchars($v);
	return is_array($v) ? array_map('escape', $v) : mysql_real_escape_string($v);
}

function gerarSenha () {
	$caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	$max = strlen($caracteres)-1;
	$password = NULL;

	for($i=0; $i < 8; $i++) {
		$password .= $caracteres{mt_rand(0, $max)};
	}
	return $password;
}


############### VERIFICA SE EMAIL É VÁLIDO ###############
function verificaEmail($email) {
	list($user, $domain) = explode("@", $email);
		if (function_exists('checkdnsrr'))
			$result = checkdnsrr($domain, 'MX');
		else
			$result = TRUE;
		return($result);
}


############### CALCULA PORCENTAGEM ###############
function porcentagem ($valor, $total, $precisao) {
	$resultado = ($valor / $total) * 100;

	return round($resultado, $precisao)."%";
}

############### PEGA EXTENSÃO ###############
function pegaExt($arquivo) {
	$path_parts = pathinfo($arquivo);
	$ext = strtolower($path_parts['extension']);
	
	return $ext;
}

############### PEGA ALTURA / LARGURA DA IMAGEM ###############
function pegaTamanho($imagem) {
	$tam_img = getimagesize($imagem);
	$largura = $tam_img[0];
	$altura = $tam_img[1];
	
	return $largura.', '.$altura;
}

############### FORMATA TELEFONE (BD - SITE) ###############
function telEspaco($tel) {
	$parte1 = substr($tel, 0, 4);
	$parte2 = substr($tel, -4);

	return $parte1." ".$parte2;
}

############### FORMATA TELEFONE (SITE - BD) ###############
function telTraco($tel) {
	$tel = str_replace(" ", "", $tel);

	return $tel;
}

############### DATA (YYYY-MM-DD para DD/MM/YYYY) ###############
function dataBarra($data_c) {

	$data = date($data_c);
	$data_fim = explode("-", $data);

	return $data_fim[2]."/".$data_fim[1]."/".$data_fim[0];
}

############### DATA (DD/MM/YYYY para YYYY-MM-DD) ###############
function dataTraco($data) {
	$dia = substr($data, 0, 2);
	$mes = substr($data, 3, 2);
	$ano = substr($data, 6, 4);
	
	return ($ano."-".$mes."-".$dia);
}

############### HORA HH:MM:SS para HH:MM ###############
function horaHM($hora) {
	$hora_fim = explode(":", $hora);

	return $hora_fim[0].":".$hora_fim[1];
}

############### HORA HH:MM:SS para MM:SS ###############
function horaMS($hora) {
	$hora_fim = explode(":", $hora);

	return $hora_fim[1].":".$hora_fim[2];
}

############### HORA HH:MM:SS para SS ###############
function horaS($hora) {
	$segundo = explode(":", $hora);

	return $segundo[2];
}

############### HORA HH:MM:SS para SS ###############
function horaM($hora) {
	$minuto = explode(":", $hora);

	return $minuto[1];
}

############### HORA HH:MM:SS para SS ###############
function horaH($hora) {
	$hora_fim = explode(":", $hora);

	return $hora_fim[0];
}

############### CONVERTER HORAS PARA SEGUNDOS (HH:MM:SS - S) ###############
function hora_para_seg($hora) {
	$segundos = array();
	$arrayHora = explode(":", $hora);
	
	$segundos[0] = $arrayHora[2];
	if ($arrayHora[1] > 0) {
		$segundos[1] = ($arrayHora[1] * 60);
	}
	if ($arrayHora[2] > 0) {
		$segundos[2] = ($arrayHora[0] * 60 * 60);
	}
	
	$total = ($segundos[0] + $segundos[1] + $segundos[2]);

	return $total;
}

############### CONVERTER SEGUNDOS PARA HORA (S - HH:MM:SS) ###############
function seg_para_hora($segundos) {
	$seconds = (int)$segundos;

	$hours = str_pad(floor($seconds / 3600), 2, '0', STR_PAD_LEFT);
	$seconds -= $hours * 3600;
	$minutes = str_pad(floor($seconds / 60), 2, '0', STR_PAD_LEFT);
	$seconds -= ($minutes * 60);

	return $hours.":".$minutes.":".str_pad($seconds, 2, '0', STR_PAD_LEFT);
}

############### DIA COMPLETO (Quinta-feira, 10 de Setembro de 2008 ###############
function diaCompleto($semana = 1, $time) { //Ativar semana: 1
	$texto = "";
	if ($semana == 1)
		$texto .= ucwords(strftime('%A', $time)).', ';
	$texto .= date('j', $time).' de '.ucwords(strftime('%B', $time)).' de '.date('Y', $time);
	
	return $texto;
}

############### CORTA O TEXTO NA CHAMADA ###############
function cortaTexto($texto, $caracteres) {
	if(strlen($texto) > $caracteres) {
		$final = substr($texto, 0, $caracteres) . "..."; 
	} else {
    	$final = $texto;
	}
	return ($final);
}

############### CALCULA IDADE (ENTRADA YYYY-MM-DD, DD/MM/YYYY, time()) ###############
function calculaIdade ($dataNasc) {
	if (getID($dataNasc)) {
		$dia = date("d", $dataNasc);
		$mes = date("m", $dataNasc);
		$ano = date("Y", $dataNasc);
	} else {
		if (strpos($dataNasc, "/")) {
			$data = explode("/", $dataNasc);
			$dia = $data[0];
			$mes = $data[1];
			$ano = $data[2];
		} else {
			$data = explode("-", $dataNasc);
			$dia = $data[2];
			$mes = $data[1];
			$ano = $data[0];
		}
	}

	if (!checkdate($mes, $dia, $ano)) {
		return false;
	} else {
		$dia_atual = date("d");
		$mes_atual = date("m");
		$ano_atual = date("Y");
		$idade = $ano_atual - $ano;
		if ($mes > $mes_atual) {
			$idade--;
		}
		if ($mes == $mes_atual and $dia_atual < $dia) {
			$idade--;
		}
		return $idade;
	}
} 


############### PREÇO 9.99,99 para 999.99 ###############
function floatPreco($valor) {
	return str_replace(",", ".", str_replace(".", "", $valor));
}

############### PREÇO 999.99 para 9.99,99 ###############
function formataPreco($valor) {
	if (!empty($valor)) {
		$xValor = explode (".", $valor);
		$antesVirgula = $xValor[0];
		$depoisVirgula = $xValor[1];

		if (strlen($depoisVirgula) == 0) {
			$centavos = "00";
		} elseif (strlen($depoisVirgula) == 1) {
			$centavos = $depoisVirgula . "0";
		} else {
			$centavos = $depoisVirgula;
		}

		$tamanhoReais = strlen($antesVirgula);

		if ($tamanhoReais > 3) {
			for ($x=0;$x<$tamanhoReais;$x++) {
				$xStart = ($tamanhoReais-1) - $x;
				if ($x%3 == 0) {
					$xPonto = substr($antesVirgula, $xStart, 1) . ".";
				} else {
					$xPonto = substr($antesVirgula, $xStart, 1);
				}
				$reais = $xPonto . $reais;
			}
			$reais = substr($reais,0,-1);
		} else {
			$reais = $antesVirgula;
		}
		$valorFormatado = $reais . "," . $centavos;
		return $valorFormatado;
	} else {
		$valorFormatado = "0,00";
		return $valorFormatado;
	}
}



############### VALIDA CPF ###############
function validaCPF ($cpf) {
	$cpf = str_replace(".", "", str_replace("-", "", $cpf));
	//VERIFICA SE O QUE FOI INFORMADO É NÚMERO
	if(!is_numeric($cpf)) {
	
		$status = false;
		
	}else if(strlen($cpf)==11) {
	
 		//VERIFICA
		if( ($cpf == '12345678909') || ($cpf == '11111111111') || ($cpf == '22222222222') ||
		($cpf == '33333333333') || ($cpf == '44444444444') ||
		($cpf == '55555555555') || ($cpf == '66666666666') ||
		($cpf == '77777777777') || ($cpf == '88888888888') ||
		($cpf == '99999999999') || ($cpf == '00000000000') ) {
		
			$status = false;
			
		} else {
			//PEGA O DIGITO VERIFIACADOR
			$dv_informado = substr($cpf, 9,2);

			for($i=0; $i<=8; $i++) {
				$digito[$i] = substr($cpf, $i,1);
			}

			//CALCULA O VALOR DO 10º DIGITO DE VERIFICAÇÂO
			$posicao = 10;
			$soma = 0;

			for($i=0; $i<=8; $i++) {
				$soma = $soma + $digito[$i] * $posicao;
				$posicao = $posicao - 1;
			}

			$digito[9] = $soma % 11;

			if($digito[9] < 2) {
				$digito[9] = 0;
			} else {
				$digito[9] = 11 - $digito[9];
			}

			//CALCULA O VALOR DO 11º DIGITO DE VERIFICAÇÃO
			$posicao = 11;
			$soma = 0;

			for ($i=0; $i<=9; $i++) {
				$soma = $soma + $digito[$i] * $posicao;
				$posicao = $posicao - 1;
			}

			$digito[10] = $soma % 11;

			if ($digito[10] < 2) {
				$digito[10] = 0;
			} else {
				$digito[10] = 11 - $digito[10];
			}

			//VERIFICA SE O DV CALCULADO É IGUAL AO INFORMADO
			$dv = $digito[9] * 10 + $digito[10];
			if ($dv != $dv_informado) {
				$status = false;
			} else {
				$status = $cpf;
			}
		}
	}else{
	
		$status = false;
		
	}
	
	return $status;
}
	
	function validacpf2() {
			$cpf = $this->cpf;
			$erro = false;
    		$aux_cpf = "";
    		for($j=0;$j<strlen($cpf);$j++)
      			if(substr($cpf,$j,1)>="0" AND substr($cpf,$j,1)<="9")
         				$aux_cpf .= substr($cpf,$j,1);
    		if(strlen($aux_cpf)!=11)
      			$erro = true;
    		else {
    			$cpf1 = $aux_cpf;
      			$cpf2 = substr($cpf,-2);
      			$controle = "";
      			$start = 2;
      			$end = 10;
      			for($i=1;$i<=2;$i++) {
      				$soma = 0;
        				for($j=$start;$j<=$end;$j++)
          				  $soma += substr($cpf1,($j-$i-1),1)*($end+1+$i-$j);
        				if($i==2)
          				  $soma += $digito * 2;
        				$digito = ($soma * 10) % 11;
        				if($digito==10)
          				  $digito = 0;
        				$controle .= $digito;
        				$start = 3;
        				$end = 11;
      			}
      			if($controle!=$cpf2)
        				$erro = true;
    		}
    		if ($erro) echo "CPF invalido";
    		return $erro;
		}



############### JAVASCRIPT ###############
function alerta($mensagem) {
	$return = '<script type="text/javascript">alert("'.$mensagem.'");</script>';
	return $return;
}
function redir($url) {
	$return = '<script type="text/javascript">location.href="'.$url.'";</script>';
	return $return;
}
function voltar() {
	$return = '<script type="text/javascript">history.back(1);</script>';
	return $return;
}


function verificaCampo($fvarCampo){
	
	if(trim($fvarCampo)==''){
		
		$fvarCampo = 'NULL';
		
	}else
	if(trim($fvarCampo)==0){
		
		$fvarCampo = 'NULL';
		
	}else {
		
		$fvarCampo = "'".$fvarCampo."'";
	
	}
	
	return $fvarCampo;

}

function verificaCampoRVar($fvarCampo){
	
	if(trim($fvarCampo)==0){
		
		$fvarCampo = '';
		
	}
	
	return $fvarCampo;

}


############### DISPLAY NO ADMIN ###############
function display($msgm) {
	$msgm = '<br><div align="center" style="padding: 3px; color:#FFFFFF; vertical-align:middle; background-color: #0097D0; font-weight: bold">' . $msgm . '</div>';
	
	return $msgm;
}

function display_erro($msgm) {
	$msgm = '<br><div align="center" style="padding: 3px; color:#FFFFFF; vertical-align:middle; background-color: #C90000; font-weight: bold">' . $msgm . '</div>';

	return $msgm;
}

############### LINK ADICIONAR ###############
function addLink ($url, $objeto) {
	$link = " <a href=\"".$url."\"><img src=\"imgs/add.png\" width=\"11\" height=\"10\" title=\"".$objeto."\" align=\"absmiddle\" /></a>";

	return $link;
}




function EnviarEmails($fassunto, $fmensagem, $femail, $fnome){

	$mail = new PHPMailer();
	$mail->SetLanguage("br", "phpmailer/language/"); 

	$mail->IsSMTP();                           // telling the class to use SMTP
	$mail->Host = SITE_SMTP;                   // SMTP server
	$mail->SMTPAuth = true;                    // ativo a autenticação SMTP
	$mail->Username = SITE_SMTP_USER;              // Usuário SMTP
	$mail->Password = SITE_SMTP_SENHA;         // Senha do usuário SMTP
	
	$mail->SetFrom(SITE_EMAIL, SITE_NOME);

	$mail->IsHTML(true);
	$mail->Subject = $fassunto;
	$mail->Body = $fmensagem;

	$mail->AddAddress($femail, $fnome);

	if($mail->Send()) {
		$fretorno = 1;
	}else {
		$fretorno = 0;		
	}
	
	return $fretorno;
}


function is_cnpj($str) { 

	if (!preg_match('|^(\d{2,3})\.?(\d{3})\.?(\d{3})\/?(\d{4})\-?(\d{2})$|', $str, $matches))
		return false;

	array_shift($matches);
	$str = implode('', $matches);

	if (strlen($str) > 14)
		$str = substr($str, 1);

	$sum1 = 0;
	$sum2 = 0;
	$sum3 = 0;
	$calc1 = 5;
	$calc2 = 6;

	for ($i=0; $i <= 12; $i++) {
		$calc1 = ($calc1 < 2) ? 9 : $calc1;
		$calc2 = ($calc2 < 2) ? 9 : $calc2;

		if ($i <= 11)
			$sum1 += $str[$i] * $calc1;

		$sum2 += $str[$i] * $calc2;
		$sum3 += $str[$i];
		$calc1--;
		$calc2--;
	}

	$sum1 %= 11;
	$sum2 %= 11;

	return ($sum3 && $str[12] == ($sum1 < 2 ? 0 : 11 - $sum1) && $str[13] == ($sum2 < 2 ? 0 : 11 - $sum2)) ? $str : false;
}

function busca_cep($cep) {
	
		$timeout=0;
        $ch = curl_init();
        curl_setopt ($ch, CURLOPT_URL, 'http://republicavirtual.com.br/web_cep.php?cep='.urlencode($cep).'&formato=query_string');
        curl_setopt ($ch, CURLOPT_HEADER, 1);
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $conteudo = curl_exec($ch);
        curl_close($ch);
        //$arquivo = explode("\n", $conteudo);
  
        return $conteudo;
}

function ValidaData($dat){

	$data = explode("/","$dat"); // fatia a string $dat em pedados, usando / como referência
	$d = $data[0];
	$m = $data[1];
	$y = $data[2];

	// verifica se a data é válida!
	// 1 = true (válida)
	// 0 = false (inválida)
	$res = checkdate($m,$d,$y);
	if ($res == 1){
	
		return true;
	   
	} else {
	
	   return false;
	   
	}
}


function ValidaDataMenor($dat){

	$data = explode("/","$dat"); // fatia a string $dat em pedados, usando / como referência
	$d = $data[0];
	$m = $data[1];
	$y = $data[2];
	
	$mkData = mktime(0,0,0,$m,$d,$y);
	$mkDataAtual = mktime(0,0,0,date('m'),date('d'),date('Y'));

	if ($mkData<$mkDataAtual){
	
		return false;
	   
	} else {
	
	   return true;
	   
	}
}
function validaCEP($cep)
{
		if(empty($cep) OR !(ereg("([0-9]{5})-([0-9]{3})",$cep,$regs) OR 
	 	    ereg("([0-9]{8})",$cep,$regs))) 
		{
			echo "<font color=\"#FF0000\"><center>CEP invalido</center></font>";
					return false;
			}
			return true;
}

function digite($texto)
{
	echo " Por favor digite".$texto."!";
//	echo "<p align='center'><a href='javascript:history.go(-1);'>Voltar</a></p>"; 
//	exit;
}

function vz($texto)
{
	if(isset($texto))
	return (trim($texto)=="");
	else return false;
	
}


function vzmo($texto,$msg)
{
	if(vz($texto)){digite(' o '.$msg);}
	return vz($texto);
}
function vzma($texto,$msg)
{
	if(vz($texto)){digite(' a '.$msg);}
	return vz($texto);
}
function vzms($texto,$msg)
{
	if(vz($texto)){echo " Por favor selecione ".$texto."!";}
	return vz($texto);
}

?>