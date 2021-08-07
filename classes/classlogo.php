<?php

	class logo{
		var $bd;
		var $qry;
		var $nome;
		var $titulo;
		var $arquivo;
		var $exibir;
		var $alink;
		var $idlogo;
		var $datacad;
		

		function logo($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);

			$this->idlogo = 0;
			$this->nome = "";
			$this->titulo = "";
			$this->arquivo = "";
			
			$this->exibir = "1";
			$this->alink = "";
			$this->datacad = time();
			
		}

		function incluir() {
			if(1==1) {//$this->validar()
				$sql = "INSERT INTO logos(";
				$sql.= "nome,titulo,imagem,exibir,";
				$sql.= "link,datacad";//cod_fornecedor,
				$sql.= ") VALUES(";
				$sql.= "'" . $this->nome . "',";
				$sql.= "'" . $this->titulo . "',";			
				$sql.= "'" . $this->arquivo . "',";				
				$sql.= "'" . $this->exibir . "',";				
				$sql.= "'" . $this->alink . "',";				
				$sql.= "'" .date("Y-m-d")  . "'";
				$sql.=  ")";
				
 				//echo $sql;

				$this->qry->executa($sql);
				
				return $this->qry->res;
			}
		}

		function excluir() {
			if($this->idlogo==0)
				return false;
			
			$sql = "DELETE FROM logos WHERE ";
			$sql.= "id = " . $this->idlogo;
			
			$this->qry->executa($sql);

			return $this->qry->res;
		}

		function selecionar($pagina=1) {
			global $PHP_SELF,$DOCUMENT_ROOT, $caminho;
			$sql = "SELECT * FROM logos  ";
			$sql.= " ORDER BY id DESC";
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhum logo cadastrado</b></p>";
				$row[0] = 0;
				$row[1] = 0;
				$row[2] = 0;
			}
			else {
				echo "<table border='1px' cellpadding=1 cellspacing=2 width='550' align='center'>\n";
				echo "	<tr>\n";
				echo "		<td><b>Ativo</b></td>\n";
				echo "		<td><b>Logo</b></td>\n";
				echo "		<td><b>Nome</b></td>\n";
				echo "		<td><b>Titulo</b></td>\n";				
				echo "		<td><b>Link</b></td>\n";
				
				echo "		<td><b>Data</b></td>\n";
				echo "		<td><b>Opcoes</b></td>\n";
				echo "	</tr>\n";						

				$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
				$row = calcula_pos($this->qry->nrw,$pagina);

				for($i=$row[0];$i<$row[1];$i++) {
					$this->qry->navega($i);
					$st = ($this->qry->data["exibir"]==1) ? "Sim" : 
						  (($this->qry->data["exibir"]==0) ? "Nao" : "");
					echo "	<tr" . (($this->qry->data["exibir"]==0) ? " class=\"st1\"" : " class=\"txt3\"" ) . ">\n";
					echo "		<td>" . $st . "</td>\n";
				$this->arquivo= $this->qry->data["imagem"];
				$this->alink= $this->qry->data["link"];
				$this->titulo= $this->qry->data["titulo"];
				
				if($this->qry->data["imagem"]!="" ) //AND file_exists($DOCUMENT_ROOT."/topo/".$this->qry->data["imagem"])
				{ //.$caminho
					if(preg_match("/.swf/", $this->arquivo)){

					    echo '<td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID" title="titulo" width="778" height="200">
				  <param name="movie" value="../'.$caminho.'/topo/'.$this->arquivo.'" />
				  <param name="quality" value="high" />
				  <param name="wmode" value="opaque" />
				  <param name="swfversion" value="8.0.35.0" />
				  <!-- Esta tag param solicita que os usuários com o Flash Player 6.0 r65 e versões posteriores baixem a versão mais recente do Flash Player. Exclua-o se você não deseja que os usuários vejam o prompt. -->
				  <param name="expressinstall" value="Scripts/expressInstall.swf" />
				  <!-- A tag object a seguir aplica-se a navegadores que não sejam o IE. Portanto, oculte-a do IE usando o IECC. -->
				  <!--[if !IE]>-->
				  <object type="application/x-shockwave-flash" data="../'.$caminho.'/topo/'.$this->arquivo.'" width="778" height="200" >
				    <!--<![endif]-->
				    <param name="quality" value="high" />
				    <param name="wmode" value="opaque" />
				    <param name="swfversion" value="8.0.35.0" />
				    <param name="expressinstall" value="Scripts/expressInstall.swf" />
				    <!-- O navegador exibe o seguinte conteúdo alternativo para usuários que tenham o Flash Player 6.0 e versões anteriores. -->
				    <div>
				      <h4>O conte&uacute;do desta p&aacute;gina requer uma vers&atilde;o mais recente do Adobe Flash Player.</h4>
				      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Obter Adobe Flash player" width="112" height="33" /></a></p>
			        </div>
				    <!--[if !IE]>-->
			      </object>
				  <!--<![endif]-->
			    </object></td>';//<embed src="../'.$caminho.'/topo/'.$this->arquivo.'>" ></embed>
		
					}else{
				   	   echo '<td align="left"><img src="../'.$caminho.'/topo/'.$this->qry->data["imagem"].'"></td>';
					}
                

				}else  echo '<td align="left"></td>';


					echo "		<td>" . $this->qry->data["nome"] . "</td>\n";
					echo "		<td>" . $this->qry->data["titulo"] . "</td>\n";
					echo "		<td>" . $this->qry->data["link"] . "</td>\n";
					echo "		<td>" . date("d/m/Y ",strtotime($this->qry->data["datacad"])) . "</td>\n";
					echo "<td><a class='link2' onclick='return confirm(\"Deseja excluir o topo  "."?\")' href=../"$PHP_SELF?opt=E&idlogo=" . $this->qry->data["id"] . "\">Excluir</a></td>";
					//echo "		<td>" . $this->qry->data["remetente"] . "</td>\n";
					//echo "		<td>" . $this->qry->data["assunto"] . "</td>\n";
					//echo "<td class='link2'><a class='link2' href=../"$PHP_SELF?opt=L&cod_msg=" . 
					//	$this->qry->data["cod_mensagem"] . "\">Ler</a></td>";
					echo "	</tr>\n";					
				}
			
				echo "</table>\n";
			}	
		
			echo "<br><p align='center' class='link2'><a  href=../"$PHP_SELF?opt=I\"><center><h1>Incluir Logo</h1></center></a>    ";
			echo "<p align='center' class='link1'>";
			link_paginas($row[2],$pagina,"&user_id=" . $this->user_id);
			echo "</p>";
		}


		function mostralogo() {
			global $PHP_SELF,$DOCUMENT_ROOT, $caminho;
			$sql = "SELECT * FROM logos ";
			$sql.= "WHERE exibir='1'";
			
			$sql.= " ORDER BY RAND() ";

			$this->qry->executa($sql);
			//echo $sql;
			if(!$this->qry->res)
				return false;

			$this->arquivo = $this->qry->data["imagem"];
			$this->titulo = $this->qry->data["titulo"];
			$this->alink = $this->qry->data["link"];
			if($this->alink!='')
					$sr=$this->alink;
				else $sr='';

			if(preg_match("/.swf/", $this->arquivo)){

			    echo '<td><a href="'.$sr.'" title="'.$this->titulo.'"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID" title="'.$this->titulo.'" width="778" height="200">
				  <param name="movie" value="../'.$caminho.'/topo/'.$this->arquivo.'" />
				  <param name="quality" value="high" />
				  <param name="wmode" value="opaque" />
				  <param name="swfversion" value="8.0.35.0" />
				  <!-- Esta tag param solicita que os usuários com o Flash Player 6.0 r65 e versões posteriores baixem a versão mais recente do Flash Player. Exclua-o se você não deseja que os usuários vejam o prompt. -->
				  <param name="expressinstall" value="Scripts/expressInstall.swf" />
				  <!-- A tag object a seguir aplica-se a navegadores que não sejam o IE. Portanto, oculte-a do IE usando o IECC. -->
				  <!--[if !IE]>-->
				  <object type="application/x-shockwave-flash" data="../'.$caminho.'/topo/'.$this->arquivo.'" width="778" height="200" >
				    <!--<![endif]-->
				    <param name="quality" value="high" />
				    <param name="wmode" value="opaque" />
				    <param name="swfversion" value="8.0.35.0" />
				    <param name="expressinstall" value="Scripts/expressInstall.swf" />
				    <!-- O navegador exibe o seguinte conteúdo alternativo para usuários que tenham o Flash Player 6.0 e versões anteriores. -->
				    <div>
				      <h4>O conte&uacute;do desta p&aacute;gina requer uma vers&atilde;o mais recente do Adobe Flash Player.</h4>
				      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Obter Adobe Flash player" width="112" height="33" /></a></p>
			        </div>
				    <!--[if !IE]>-->
			      </object>
				  <!--<![endif]-->
			    </object></a></td>';//<embed src="../$inf_dominio/painel/_imagens/_upload/topo/$imagemTopo" width="715" height="184"></embed>
	
			}else{
			if($this->alink!='')
			   echo '<td><a href="'.$this->alink.'" title="'.$this->titulo.'"><img alt="'.$this->titulo.'" border="0" src="../'.$caminho.'/topo/'.$this->arquivo.'" /></td>';
			else
 			echo '<td><img alt="'.$this->titulo.'" border="0" src="../'.$caminho.'/topo/'.$this->arquivo.'" /></td>';

			}

			return true;
		}


}