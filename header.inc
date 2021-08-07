<?php
	include_once("include/diversos.fcn");
	include_once("include/funcoes.php");
	require_once("classlogfile.inc");
	require_once("classdb.inc");
	require_once("classusuarios.inc");


	
//if (!isset($_SESSION))
session_start();
	
	$con = new bd("mysql");

	$banco="paymein"; //
	$host="localhost"; //
	$user="root"; //root
	$pass="";
	$caminho="/paymein/public_html/devgus/"; //     /paymein

	$nomesite="PAYMEIN";
	$emailalerta="alerta@paymein.com";
	$emailcomercial="comercial@paymein.com";
	$emailsuporte="contato@paymein.com";
	$emailpessoal="";
	$urlsite="http://br.paymein.com";

	//$con->conecta("fenix","localhost","","root","root");

        $con->conecta($banco,$host,"",$user,$pass);
	
	$usr_h = new usuarios($con); //usuarios
	
	
/*	session_register("usr_login");

	session_register("usr_nome");

	session_register("usr_tipo");
	session_register("SESSskin");

*/

/*
	session_register("usr_cesta");
	session_register("usr_anima");
*/
//	session_register("usr_id");	

//	session_register("usr_seg");

//	session_register("inf_pedido");
	
	$codseg=0; //apagar se usaseguimento


	// Executa o logout do usuario
if (isset($_REQUEST['logout']))
$logout=$_REQUEST['logout'];

      if(isset($logout))
	if($logout=="S") {
		session_unset();
		session_destroy();
		session_start();
	}




if (isset($_REQUEST['usuario']))
$usuario=$_REQUEST['usuario'];
else $usuario='';


if (isset($_REQUEST['senha']))
$senha=$_REQUEST['senha'];
else $senha='';



	if(!empty($_SESSION["usr_id"])) { //$HTTP_SESSION_VARS
		$usr_h->login = $_SESSION["usr_login"];  //senha->  //$HTTP_SESSION_VARS
		$usr_h->user_id = $_SESSION["usr_id"];//$HTTP_SESSION_VARS
		//$usr_h->nome = $_SESSION["usr_nome"];//$HTTP_SESSION_VARS
		$usr_h->senha->tipo = $_SESSION["usr_tipo"]; //senha->//$HTTP_SESSION_VARS
		
		$usr_h->busca();
	}
	elseif(!empty($usuario) AND !empty($senha)) {

		$erro = $usr_h->login($usuario,$senha);
		if($erro!="OK") {
			$usr_h->senha->tipo = 0; //senha->
			$usr_h->senha->login = 0;  //senha->
			echo '<script> alert("' . $erro . '");</script>';
			exit;
		}
		else {
			$_SESSION["usr_id"] = $usr_h->user_id;					
			$_SESSION["usr_login"] = $usr_h->senha->login;//senha->
			$_SESSION["usr_nome"] = $usr_h->nome;
			$_SESSION["usr_senha"] = $usr_h->senha->senha;
			//$usr_nome = $usr_h->nome;
			$_SESSION["usr_tipo"] = $usr_h->senha->tipo; //senha->

		}
	}
	
	
/*
if ($codseg==0)$usr_seg=0;

if(!empty($codseg)) {
    $usr_seg=$codseg;

}*/
                
	if(($area!=$usr_h->senha->tipo) AND ($area!=0)) { //senha->
      // echo $area;
		echo "<script>document.location.href=\"".$caminho."/login.php\";</script>";
		//exit;
	}

	/*if(empty($usr_anima)) {
		$param = "onLoad=\"inicio();\"";

		if(!ereg("index.php",$_SERVER['PHP_SELF'])) //$PHP_SELF
			$param = "";
		elseif(!empty($QUERY_STRING))
			$param = "";
	}
	else 
		$param = "";
*/
	
	$usr_anima = 1;
	
?>


