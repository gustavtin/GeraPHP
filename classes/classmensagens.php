<?php

	class mensagens {
	
		var $bd;
		var $qry;
		var $usr;
		var $user_id;
		var $cod_mensagem;
		var $remetente;
		var $e_mail;
		var $data;
		var $assunto;
		var $mensagem;
		var $status;
		
		
		function mensagens($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);
			$this->usr = new usuarios($bd);
			$this->user_id = 0;
			$this->cod_mensagem = 0;
			$this->remetente = "";
			$this->e_mail = "";	
			$this->data = time();
			$this->assunto = "";
			$this->mensagem = "";
			$this->status = 0;

		}
		
		function incluir() {
			$sql = "INSERT INTO mensagens(";
			$sql.= "user_id,remetente,e_mail,";
			$sql.= "data,assunto,mensagem,status)";
			$sql.= "VALUES(" . $this->user_id . ",";
			$sql.= "'" . $this->remetente . "',";
			$sql.= "'" . $this->e_mail . "',";
			$sql.= time() . ",";
			$sql.= "'" . $this->assunto . "',";
			$sql.= "'" . $this->mensagem . "',";
			$sql.= 0 . ")";

			$this->qry->executa($sql);
			
			return $this->qry->res;
		}

		
		function responder($resposta) {
			if(strlen($resposta)==0)
				return false;

			$this->mensagem.= "<br><br><font color=\"#0000ff\">";
			$this->mensagem.= "[Resposta]<br><br>";
			$this->mensagem.= "[Data: " . date("d/m/Y H:i",time()) . "]<br><br>";
			$this->mensagem.= "<p align=\"justify\">";
			$this->mensagem.= $resposta;
			$this->mensagem.= "</p></font>";
			
			$sql = "UPDATE mensagens SET ";
			$sql.= "mensagem = '" . $this->mensagem . "' ";
			$sql.= "WHERE cod_mensagem= " . $this->cod_mensagem;

			$this->qry->executa($sql);
				
			if(!$this->qry->res)
				return false;
			
			$this->usr->email = $this->e_mail;
			$assunto = "RE: " . $this->assunto;

			if(!$this->usr->e_mail($assunto,$resposta))
				return false;
			
			$this->status = 2;
			
			return $this->atualiza();
		}
		
		
		function atualiza() {
			$sql = "UPDATE mensagens SET ";
			$sql.= "status = " . $this->status;
			$sql.= " WHERE cod_mensagem=" . $this->cod_mensagem;
			
			$this->qry->executa($sql);
			
			return $this->qry->res;
		}
		
		
		function excluir() {
			if($this->cod_mensagem==0)
				return false;
			
			$sql = "DELETE FROM mensagens WHERE ";
			$sql.= "cod_mensagem = " . $this->cod_mensagem;
			
			$this->qry->executa($sql);

			return $this->qry->res;
		}
		
		function selecionar($pagina=1) {
			global $PHP_SELF;
			$sql = "SELECT * FROM mensagens WHERE ";
			$sql.= "user_id = " . $this->user_id;
			$sql.= " ORDER BY cod_mensagem DESC";
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhuma Mensagem</b></p>";
				$row[0] = 0;
				$row[1] = 0;
				$row[2] = 0;
			}
			else {
				echo "<table border=0 cellpadding=1 cellspacing=2 width='550' align='center'>\n";
				echo "	<tr>\n";
				echo "		<td><b>Status</b></td>\n";
				echo "		<td><b>ID</b></td>\n";
				echo "		<td><b>Data</b></td>\n";				
				echo "		<td><b>Enviada por</b></td>\n";
				echo "		<td><b>Assunto</b></td>\n";
				echo "		<td><b>Opções</b></td>\n";
				echo "	</tr>\n";						

				$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
				$row = calcula_pos($this->qry->nrw,$pagina);

				for($i=$row[0];$i<$row[1];$i++) {
					$this->qry->navega($i);
					$st = ($this->qry->data["status"]==1) ? "L" : 
						  (($this->qry->data["status"]==2) ? "LR" : "");
					echo "	<tr" . (($this->qry->data["status"]==0) ? " class=\"st1\"" : " class=\"txt3\"" ) . ">\n";
					echo "		<td>" . $st . "</td>\n";
					echo "		<td>" . $this->qry->data["cod_mensagem"] . "</td>\n";
					echo "		<td>" . date("d/m/Y H:i",$this->qry->data["data"]) . "</td>\n";
					echo "		<td>" . $this->qry->data["remetente"] . "</td>\n";
					echo "		<td>" . $this->qry->data["assunto"] . "</td>\n";
					echo "<td class='link2'><a class='link2' href=\"$PHP_SELF?opt=L&cod_msg=" . 
						$this->qry->data["cod_mensagem"] . "\">Ler</a></td>";
					echo "	</tr>\n";					
				}
			
				echo "</table>\n";
			}			

			echo "<p align='center' class='link1'>";
			link_paginas($row[2],$pagina,"&user_id=" . $this->user_id);
			echo "</p>";
		}
		
		function busca() {
			$sql = "SELECT * FROM mensagens WHERE ";
			$sql.= "user_id = " . $this->user_id;
			$sql.= " AND cod_mensagem = " . $this->cod_mensagem;

			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0)
				return false;
		
			$this->remetente = $this->qry->data["remetente"];
			$this->e_mail = $this->qry->data["e_mail"];
			$this->data = $this->qry->data["data"];
			$this->assunto = $this->qry->data["assunto"];
			$this->mensagem = $this->qry->data["mensagem"];
			$this->status = $this->qry->data["status"];
			
			if($this->status==0) {
				$this->status=1;
				$this->atualiza();
			}
		
			return true;
		}
		
		function mensagens_novas() {
			if($this->user_id==0)
				return 0;
			
			$sql = "SELECT COUNT(*) FROM mensagens WHERE ";
			$sql.= "user_id=" . $this->user_id . " AND ";
			$sql.= "status=0";
			
			$this->qry->executa($sql);
			
			return $this->qry->data[0];
		}
		
		
	}
	
?>