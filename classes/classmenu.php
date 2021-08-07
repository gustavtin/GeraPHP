<?php 

	class menusup{
	
		var $bd;
		var $qry;

		var $nome;
		var $cor;
		var $corfonte;
		var $link1;
		var $conteudo;
		//SEO-----------
		var $descricao;
		var $keyword;
		var $titulo;
		//------------------
		var $lingua;
		
		var $ativo;
		var $visivel;
		var $ordem;
		var $menupai;
		var $tipo;
		var $tipolink;
		
		var $imagem;

		var $id;		

		var $cod_materia;
		var $materia;
		var $autor;
		var $autor_email;
		var $avaliacao;
		var $estrelas;
		var $data_inicial;
		var $data_final;
		
		
		function menusup($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);
			$this->cod_materia = 0;
			$this->titulo = "";
			$this->materia = "";
			$this->autor = "";
			$this->autor_email = "";
			$this->avaliacao = 0;
			$this->estrelas = 0;
			
			$this->id=0;
			$this->menupai=0;
			$this->tipo='T';
			$this->data_inicial = time();
			$this->data_final = time();

			$this->nome="";
			$this->tipolink="I";
			$this->cor="#BADF76";
			$this->corfonte="white";
			$this->link1="";
			$this->conteudo="";
			$this->imagem="";
			$this->ativo=1;
			$this->visivel=1;
			$this->ordem=1;
			
			$this->descricao="";
			$this->titulo="";
			$this->keyword="";
			
			$this->lingua='BR';
		}
		
		function incluir() {
			if($this->validar()) {


				$sql = "INSERT INTO menuseo(";
				$sql.= "nome,cor,corfonte,imagem,descricao,titulo,keyword,";
				$sql.= "lingua,link,tipolink, tipo, conteudo,";
				$sql.= "ativo,menusup,ordem) VALUES(";
				$sql.= "'" . utf8_decode($this->nome). "',";
				$sql.= "'" . $this->cor. "',";
				$sql.= "'" . $this->corfonte. "',";
				
				$sql.= "'" . $this->imagem. "',";
				$sql.= "'" . utf8_decode($this->descricao). "',";
				$sql.= "'" . utf8_decode($this->titulo). "',";
				$sql.= "'" . utf8_decode($this->keyword). "',";
				$sql.= "'" . $this->lingua. "',";
				$sql.= "'" . $this->link1. "',";
					$sql.= "'" . $this->tipolink. "',";
				$sql.= "'" . $this->tipo. "',";
				$sql.= "'" . $this->conteudo. "',";
				$sql.= $this->ativo. ",";
				$sql.= $this->menupai. ",";
				$sql.= $this->ordem. ")";
//echo $sql;
				$this->qry->executa($sql);
				
				return $this->qry->res;
			
			}
			return false;
		}
		
		function alterar() {
			$r=1;  //$this->validar();

			if($r) {
				$sql = "UPDATE menuseo SET ";
				$sql.= "nome = '" . utf8_decode($this->nome) . "' ,";
				//$sql.= "cor = '" . $this->cor . "', ";
				//$sql.= "corfonte = '" . $this->corfonte . "', ";
				$sql.= "link = '" . $this->link1 . "',";
				$sql.= "tipolink = '" . $this->tipolink . "',";
				$sql.= "descricao = '" . utf8_decode($this->descricao). "',";
				$sql.= "titulo = '" . utf8_decode($this->titulo). "',";
				$sql.= "keyword = '" . utf8_decode($this->keyword). "',";
				$sql.= "lingua = '" . $this->lingua. "',";
				$sql.= "conteudo = '" . $this->conteudo. "', ";//utf8_decode() 
				$sql.= "ativo = " . $this->ativo . ", ";
				$sql.= "imagem = '" . $this->imagem . "', ";
				$sql.= "visivel = " . $this->visivel . ", ";
				$sql.= "ordem = " . $this->ordem . ", ";
				$sql.= "menusup = " . $this->menupai . "";
				$sql.= " WHERE id = " . $this->id."";
//echo $sql;
				$this->qry->executa($sql);
				
				return $this->qry->res;
			}
			return false;
		}
		
		function validar() {
if (empty($this->conteudo))
{
echo "<center>Conteudo Invalido!</center>";
return false;
}

if (empty($this->ordem))
{
echo "<center>Ordem Invalida!</center>";
return false;
}

if (empty($this->link1))
{
echo "<center> Link vazio!</center>";
return false;
}



			if(empty($this->nome) OR empty($this->conteudo) OR
			empty($this->corfonte) OR $this->ativo<0)
				return false;
				
				if($this->link1!='home')
				{
				
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
			}return true;
			
		}
		
		function excluir() {
			$sql = "DELETE FROM menuseo WHERE ";
			$sql.= "id = '" . $this->id."'";
			
			$this->qry->executa($sql);
			
			
			
			return $this->qry->res;
		}

		function excluirlink() {
			$sql = "DELETE FROM menuseo WHERE ";
			$sql.= "link = '" . $this->link1."'";
			
			$this->qry->executa($sql);
			
			
			
			return $this->qry->res;
		}
		
		
		
		
		
		function selecionar($pagina=1,$cat,$tipo='T') {
			global $PHP_SELF;
			$sql = "SELECT * FROM menuseo where tipo='".$tipo."' ORDER BY ordem, nome";
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhum Menu cadastrado</b></p>";
				$row[0] = 0;
				$row[1] = 0;
				$row[2] = 0;
			}
			else {

				echo "<table border=0 cellpadding=1 cellspacing=2 width='500' align='center'>\n";
				echo "	<tr>\n";
				echo "		<td><b>Ordem</b></td>\n";
				echo "		<td><b>Nome</b></td>\n";
				//echo "		<td><b>Cor</b></td>\n";
				echo "		<td><b>Link</b></td>\n";
				echo "		<td><b>Tipolink</b></td>\n";
				echo "		<td><b>Ativo</b></td>\n";
				echo "		<td><b>Tipo</b></td>\n";
				echo "		<td><b>Lingua</b></td>\n";
				echo "          <td><b></b></td>\n";
				echo "	</tr>\n";						

				$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
				$row = calcula_pos($this->qry->nrw,$pagina);

				for($i=$row[0];$i<$row[1];$i++) {
					$this->qry->navega($i);
					echo "	<tr>\n";
					echo "		<td>" . $this->qry->data["ordem"] . "</td>\n";
					echo "		<td>" . utf8_encode($this->qry->data["nome"]) . "</td>\n";
					//echo "		<td>" . $this->qry->data["cor"] . "</td>\n";
					echo "		<td>" . $this->qry->data["link"] . "</td>\n";
					echo "		<td>" . $this->qry->data["tipolink"] . "</td>\n";
					echo "		<td>" .( ($this->qry->data["ativo"]==1)?"Sim":"Não") . "</td>\n";
					echo "		<td>" . $this->qry->data["tipo"]  . "</td>\n";
					echo "		<td>" . $this->qry->data["lingua"]  . "</td>\n";
					echo "<td class='link2'><a class='link2' href=\"$PHP_SELF?opt=A&idmenu=" . $this->qry->data["id"] . "\">Alterar</a>&nbsp;&nbsp;&nbsp;";
					echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=E&idmenu=" . $this->qry->data["id"] . "\" onclick='return confirm(\"Deseja excluir menu ".htmlentities($this->qry->data["nome"])."?\")'>Excluir</a>&nbsp;&nbsp;&nbsp;";
					
					//echo "<a class='link2' href=\"adm_man_mat_vinculos.php?cod_mat=" . $this->qry->data["cod_materia"] . "\">Vinculos</a>&nbsp;&nbsp;&nbsp;";
					//echo "<a class='link2' href=\"adm_man_mat_links.php?cod_mat=" . $this->qry->data["cod_materia"] . "\">Links</a></td>";
					echo "	</tr>\n";					
				}
			
				echo "</table>\n";
			}			


			echo "<p align='center' class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=I&tipo=$tipo\">Incluir Menu</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			//echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=L\">Listar Menus</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			echo "<p align='center' class='link1'>";
			link_paginas($row[2],$pagina,"&cod_cat=$cat");
			echo "</p>";
		}
		
		
		function listar($pagina=1) {
			$sql = "SELECT * FROM menuseo order by tipo, nivel, menusup";
			$this->qry->executa($sql);
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhuma Menu cadastrado</b></p>";
			}
			else {
				echo "<table border=0 cellpadding=1 cellspacing=1 width='500' align='center'>\n";
				echo "	<tr class='st1'>\n";
				echo "		<td><b>Id</b></td>\n";
				echo "		<td><b>Titulo Matéria</b></td>\n";
				echo "		<td><b>Autor</b></td>\n";				
				echo "		<td><b>Avaliação</b></td>\n";				
				echo "		<td><b>Estrelas</b></td>\n";				
				echo "		<td><b>Data Inicial</b></td>\n";
				echo "		<td><b>Data Final</b></td>\n";
				echo "	</tr>\n";						

				$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
				$row = calcula_pos($this->qry->nrw,$pagina);

				for($i=$row[0];$i<$row[1];$i++) {
					$this->qry->navega($i);
					echo "	<tr class='txt3' valign='top' bgcolor='#" . (($i%2==0) ? "f0f0f0" : "ffffff") . "'>\n";
					echo "		<td>" . $this->qry->data["cod_materia"] . "</td>\n";
					echo "		<td>" . $this->qry->data["titulo"] . "</td>\n";
					echo "		<td>" . $this->qry->data["autor"] . "</td>\n";					
					echo "		<td>" . $this->qry->data["avaliacao"] . "</td>\n";					
					echo "		<td>" . $this->qry->data["estrelas"] . "</td>\n";
					echo "		<td>" . date("d/m/Y",$this->qry->data["data_inicial"]) . "</td>\n";
					echo "		<td>" . date("d/m/Y",$this->qry->data["data_final"]) . "</td>\n";					
					echo "	</tr>\n";					
				}
			
				echo "</table>\n";
						


			echo "<p align='center' class='link2'>";
			link_paginas($row[2],$pagina,"");
			echo "</p>";
			}
		}
		
		
		function busca() {
			$sql = "SELECT * FROM menuseo WHERE ";
			$sql.= "id = " . $this->id."";
			//echo $sql;
			$this->qry->executa($sql);

			if(($this->qry->res) AND ($this->qry->nrw>0)) {

				$this->id = $this->qry->data["id"];
				$this->nome = utf8_encode($this->qry->data["nome"]);
				$this->cor = $this->qry->data["cor"];
				$this->corfonte = $this->qry->data["corfonte"];
				$this->link1 = $this->qry->data["link"];
				
				$this->imagem = $this->qry->data["imagem"];
				$this->descricao = utf8_encode($this->qry->data["descricao"]);
				$this->keyword = $this->qry->data["keyword"];
				$this->titulo = $this->qry->data["titulo"];
				$this->lingua = $this->qry->data["lingua"];
				$this->tipolink = $this->qry->data["tipolink"];
				$this->conteudo = utf8_decode(urldecode($this->qry->data["conteudo"]));//html_entity_decodeurldecode
				$this->ativo = $this->qry->data["ativo"];
				$this->visivel = $this->qry->data["visivel"];
				$this->ordem = $this->qry->data["ordem"];
				$this->tipo = $this->qry->data["tipo"];
				$this->menupai = $this->qry->data["menusup"];
//echo $this->nome;
				return true;
			}

			return false;
		}
			//--------------------------------------------------------------------
				function getimagemtopo($cat) {
			$sql = "SELECT nome,nivel,menusup, link, imagem FROM menuseo WHERE ";
			$sql.= "id = $cat";
			$sql.= " ORDER BY ordem";
			//echo $sql;
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res)
				return "";
			//if($qry->data["nivel"]==0)
			
			if($qry->data[2]==0)
			 return htmlentities($qry->data[4]);
			else	
			if($qry->data[2]!='')
			 return  $this->getimagemtopo($qry->data[2]); 
			 else return htmlentities($qry->data[4]);
		}
//--------------------------------------------------------------------
			function getlingua($cat) {
			$sql = "SELECT nome,nivel,menusup, link, lingua FROM menuseo WHERE ";
			$sql.= "id = $cat";
			$sql.= " ORDER BY ordem";
			//echo $sql;
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res)
				return "";
			//if($qry->data["nivel"]==0)
			
			if($qry->data[2]==0)
			 return htmlentities($qry->data[4]);
			else	
			if($qry->data[2]!='')
			 return  $this->getlingua($qry->data[2]); 
			 else return htmlentities($qry->data[4]);
		}
	//--------------------------------------------------------------------
				function arvore($cat) {
			$sql = "SELECT nome,nivel,menusup, link FROM menuseo WHERE ";
			$sql.= "id = $cat";
			$sql.= " ORDER BY ordem";
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res)
				return "";
			//if($qry->data["nivel"]==0)
			
			
				
			if($qry->data[2]!='')
			 return  $this->arvore($qry->data[2]).'  &nbsp;>&nbsp;<a href="index.php?p='.$qry->data[3].'">'.htmlentities($qry->data[0]).'</a>'; //
			 else return htmlentities($qry->data[0]);
		}
//--------------------------------------------------------------------

	
		function geramenu($tipo,$pai='',$lang=''){
		
		//if(isset($this->link1)&&($this->link1!=""))  //&&(strtoupper($this->link1)!="home")
	{  //
		//  echo '<ul>';//tabmenu 
	 $pagina=1;
			// mysql_connect($host, $user, $pass);
			// mysql_select_db($banco);
			
			$qry= new consulta($this->bd);
			
			if($tipo=='R')
			$sep='';
			else
			$sep='   |  ';//
			
			 $sql="SELECT * FROM menuseo where tipo='".$tipo."'  and ativo=1";
			 if($lang!='')
			 {
			     $sql .=" and lingua='".$lang."'"; 
			 }
			  
			 if($tipo=='L')
			 {  
			      $sep=' ';
				  
				//  if($this->tipo=='L'){
				  if($pai!='')
				     $sql .=" and menusup=".$pai.""; 
				  else
			       //  $sql .=" and menusup=".$this->menupai.""; 
				//  }
				  //else  
				  $sql .=" and menusup=".$this->id.""; 
				  
				  
			
			 
			 } 
			 $sql .=" order by ordem"; 
			 
			// $resultado = mysql_query($sql);
		//	echo $sql;
			
			$qry->executa($sql);
		
			$row = calcula_pos($qry->nrw,$pagina);
echo "<ul>";
				for($i=$row[0];$i<$row[1];$i++) 
			 {
			 $this->qry->navega($i);
			
			// $this->link1= $qry->data["nome"];
			// $this->buscalink();
			
			if($qry->data["tipolink"]=='I')
			 echo "<li><a href='index.php?p=".$qry->data["link"]."'>".htmlentities($qry->data["nome"])."</a> ".$sep." </li>";
			else echo "<li><a href='".$qry->data["link"]."'>".htmlentities($qry->data["nome"])."</a> ".$sep." </li>";
			
			
			
			if($tipo=='L')
			{
			// echo '<li>';
			$pai=$qry->data["id"];
			//$this->geramenu('L',$pai);
			// echo '</li>';
			
			}

			  $qry->proximo();
			 }
			 
			 echo "</ul>";
			 
			 
         //  echo "<ul>";
	//	echo $sql;
		}
}

	
		function buscalink() {
			$sql = "SELECT * FROM menuseo WHERE ";
			$sql.= "link = '" . $this->link1."' and ativo=1 ORDER BY TIPO";
			//echo $sql;
			$this->qry->executa($sql);

			if($this->qry->res AND $this->qry->nrw>0) {

				$this->id = $this->qry->data["id"];
				$this->nome = $this->qry->data["nome"];
				$this->cor = $this->qry->data["cor"];
				$this->corfonte = $this->qry->data["corfonte"];
				$this->lingua = $this->qry->data["lingua"];
				$this->link1 = $this->qry->data["link"];
				$this->keyword = $this->qry->data["keyword"];
				$this->descricao = $this->qry->data["descricao"];
				$this->titulo = $this->qry->data["titulo"];
				$this->tipolink = $this->qry->data["tipolink"];
				$this->conteudo = urldecode($this->qry->data["conteudo"]);
				$this->ativo = $this->qry->data["ativo"];
				$this->visivel = $this->qry->data["visivel"];
				$this->imagem = $this->qry->data["imagem"];
				$this->ordem = $this->qry->data["ordem"];
				$this->tipo = $this->qry->data["tipo"];
				$this->menupai = $this->qry->data["menusup"];
				return true;
			}

			return false;
		}
		
		
		function monta_materia($rows,$tipo) {

			$this->cod_materia = $rows[0];
			$this->busca();
			
			$result = "<table border=0 cellpadding=0 cellspacing=1 width=\"100%\" valign=\"top\">\n";
			$result.= "<tr><td colspan=\"2\">";
			$result.= "<span class=\"mat_titulo\">". $this->titulo .  "</span><br>";
			$result.= "<span class=\"mat_autor\">". $this->autor .  "</span>&nbsp;";
			$result.= "<span class=\"mat_email\">&lt;". $this->autor_email .  "&gt;</span><br><br>";
			$result.= "</td></tr>\n";
			
			$result.= "<tr><td colspan=\"2\" class=\"mat_text\">";
			$result.= $this->materia;
			$result.= "</td></tr>\n";
			
			$result.= "<tr><td colspan=\"2\" height=\"10\"></td></tr>\n";
			
			$lnk = new materia_links($this->bd);
			$lnk->cod_materia = $this->cod_materia;
			$prel = $lnk->links();

			if(($tipo!="P" AND $prel!="") OR sizeof($rows)>1) {
				$result.= "<tr>\n";
				if($tipo!="P" AND $prel!="")
					$result.= "<td class=\"mat_rel\">Produtos relacionados</td>";
				if(sizeof($rows)>1)
					$result.= "<td class=\"mat_rel\">Veja Também</td></tr>\n";
				$result.= "<tr>\n";
				if($tipo!="P" AND $prel!="") {
					$result.= "<td class=\"link2\">";
					$result.= $prel . "</td>";
				}
				if(sizeof($rows)>1) {
					$result.= "<td valign=\"top\" class=\"link2\">";
					for($i=1;$i<sizeof($rows);$i++) {
						$this->cod_materia = $rows[$i];
						$this->busca();
						$result.= "<a href=\"ver_materia.php?cod_mat=" . $rows[$i] . "\" class=\"link2\">". $this->titulo . "</a><br>";
					}
					$result.= "</td>";
				}
				$result.= "</tr>\n";
			}
			$result.= "<tr><td height=\"20\"></td></tr>";
			$result.= "</table>";
		
			return $result;
		}


		function exibir($tipo="H",$chave=0,$materias=5) {
			$vinc = new materia_vinculos($this->bd);
			$rows = $vinc->vinculos($tipo,$chave,$materias);

			if(!$rows)
				return "";

			$materias = sizeof($rows);

			srand ((double)microtime()*1000000);
			shuffle ($rows);
			
			return $this->monta_materia($rows,$tipo);
		}

		
		function avaliacoes($cod_produto,$numero=5) {
			$vinc = new materia_vinculos($this->bd);
			$rows = $vinc->vinculos("P",$cod_produto,$numero,1);

			if(!$rows OR sizeof($rows)==1) {
				$result = "<table border=0 cellpadding=0 cellspacing=1 valign=\"top\">\n";
				$result.= "<tr height=\"40\"><td class=\"link3\"><a class=\"link3\" href=\"opinar.php?cod_produto=$cod_produto\">";
				$result.= "Seja o primeiro a opinar</a></td></tr>\n";
				$result.= "</table>";
				return $result;
			}
			
			$avg = array_pop($rows);
			$avgn = (int) $avg;
			$avgd = $avg-$avgn;
			$avg = $avgn+(($avgd<0.5) ? 0 : 0.5);

			$numero = sizeof($rows);

			srand ((double)microtime()*1000000);
			shuffle ($rows);
			
			$result = "<table border=0 cellpadding=0 cellspacing=1 valign=\"top\">\n";
			$result.= "<tr><td height=\"35\" class=\"st1\">";
			$result.= "Média das avaliações de usuários: " . "<img src=\"/livro_siteb2c/imagens/";
			$result.= "estrelas" . number_format($avg,1) . ".gif\" border=0 align=\"absmiddle\"></td></tr>";
			
			for($i=0;$i<$numero;$i++) {
				$this->cod_materia = $rows[$i];
				$this->busca();
				$result.= "<tr><td class=\"txt1\" valign=\"top\">" . $this->autor;
				$result.= "<span class=\"mat_texto\">&nbsp;&nbsp;&nbsp;(" . date("d/m/Y",$this->data_inicial) . ")&nbsp;&nbsp;</span>";
				$result.= "<img src=\"/livro_siteb2c/imagens/estrelas" . number_format($this->estrelas,1) . ".gif\"></td></tr>\n";
				$result.= "<tr class=\"titulo_aval\" valign=\"top\"><td>" . $this->titulo . "</td></tr>\n";
				$result.= "<tr class=\"mat_texto\" valign=\"top\"><td>" . $this->materia . "</td></tr>\n";
				$result.= "<tr><td height=\"10\"></td></tr>\n";				
			}
			
			$result.= "<tr><td class=\"link3\"><a class=\"link3\" href=\"opinar.php?cod_produto=$cod_produto\">";
			$result.= "Dê sua Opinião</a></td></tr>\n";
			$result.= "</table>";
			
			return $result;
		}

	}
	
?>