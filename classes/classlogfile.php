<?php

	class logfile {
	
		var $bd;
		var $qry;
		var $sequencia;
		var $data;
		var $user_id;
		var $programa;
		var $ip;
		var $operacao;
		var $comentarios;
			
		function logfile($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);
			$this->sequencia = 0;
			$this->data = time();
			$this->user_id = 0;
			$this->programa = "";
			$this->ip = "";
			$this->operacao = "";
			$this->cometarios = "";
		}	
		
		function incluir() {
			global $PHP_SELF, $usr_h, $REMOTE_ADDR;
	
			$sql = "INSERT INTO logfile(";
			$sql.= "data,user_id,programa,";
			$sql.= "ip,operacao,observacoes) VALUES(";
			$sql.= time() . "," . $usr_h->user_id . ",";
			$sql.= "'" . $PHP_SELF . "',";
			$sql.= "'" . $REMOTE_ADDR . "',";
			$sql.= "'" . $this->operacao . "',";
			$sql.= "'" . $this->comentarios . "'";
			$sql.= ")";

			$this->qry->executa($sql,"log");
		}
	}
?>