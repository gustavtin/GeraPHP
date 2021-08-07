	<?php 

	class categorias {
	
		var $bd;
		var $qry;
		
		var $cod_categoria;
		var $nome;
		var $nivel;
		var $codigo_pai;
		var $codseg;

		var $ordemseg;
		var $nomeseg;
		var $ativoseg;
		
		var $link1;
	    var $tipolink;
		
		var $link0;

		var $icone;
		var $imagem;
		var $conteudo;

		var $ordem;
		//SEO-----------
		var $descricao;
		var $keyword;
		var $titulo;
		//------------------
		var $lingua;
		
		var $ativo;
		var $visivel;
		var $verif;
		var $i;

		var $nivelpai;
		
		function categorias($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);
			
			$this->cod_categoria = 0;
			$this->nome = "";
			$this->nivel = 0;
			$this->codigo_pai = 0;
			$this->codseg = 0;
			$this->ativo=0;

			$this->verif=-1;
			
			$this->ativoseg=0;
			$this->ordemseg=1;
			$this->ordem = 1;

			$this->icone = "";
			$this->imagem="";
			$this->link1 = "";
			$this->tipolink="";
			$this->conteudo="";
			
			$this->descricao="";
			$this->titulo="";
			$this->keyword="";
			
			$this->lingua='BR';
			
			$this->visivel=1;	
			$this->i = array();
		}

		function primeira()
		{	global $usr_seg, $link1;
			$sql = "SELECT * FROM categorias WHERE 1";
			$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			$sql.=  " AND VISIVEL<>0";
		
			if(strtoupper($link1)!="AJUDA")
 			    $sql.= " and ordem>0";
			else $sql.= " and ordem<0";

			$sql.=  " ORDER BY ordem,nivel,nome";

			$qry = new consulta($this->bd);
			$qry->executa($sql);

			$this->cod_categoria=$qry->data["menusup"];

		}

		function mostracategs($cat=0,$pagina=1,$seg=0)
		{

			global $PHP_SELF;
			global $usr_seg, $link1;
			
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.=  ($cat==0) ? "nivel=0" : "codigo_pai=" . $cat;
			$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			$sql.=  " AND VISIVEL<>0";
		
			if(strtoupper($link1)!="AJUDA")
 			    $sql.= " and ordem>0";
			else $sql.= " and ordem<0";

			$sql.=  " ORDER BY ordem";

			$qry = new consulta($this->bd);
			$qry->executa($sql);

			echo "<span class='link1'>". implode("&nbsp;&nbsp;&nbsp;«&nbsp;&nbsp;&nbsp;",array_reverse(explode("#",$this->arvorelink($cat)))) . "</span>";
							
			echo "<table valign='top' border=0 cellspacing=3 cellpadding=0 class=" . ((isset($nivel)&&($nivel==0)) ? "'txt1'" : "'txt3'") . "><tr>\n";
				for($i=0;$i<$qry->nrw;$i++) {
					if($i%8==7)
						echo "</tr><tr>";
					echo "<td valign='top' height='100%' ><table height='100%' border=0 valign='top' cellspacing=3 cellpadding=0 class=" . ((isset($nivel)&&($nivel==0)) ? "'txt1'" : "'txt3'") . ">\n";
					echo "<tr>";
					echo "<td valign='top'>|</td><td valign='top' align='center'><a class='rel_prd' style='color:#C30' href='?cod_cat=".$qry->data["cod_categoria"]."'>" . $qry->data["nome"];
					echo "</a></td></tr>";
					if($qry->data["imagem"]!="")
					{
						echo "<tr>";
						echo "<td></td><td valign='middle' align='center' class='bordabranca' height='100%' ><a style='text-decoration:underline' href='?cod_cat=".$qry->data["cod_categoria"]."'><img width='120' src='imagens/categorias/".$qry->data["imagem"]."' border='0' /></a>";
						echo "</td></tr>";
					}
					echo "</table></td>";

					$qry->proximo();
				}
				echo "</tr></table>";



		}

		
		function incseg(){
		
	        	$sql = "INSERT INTO seguimento(";
				$sql.= "NOME,ORDEM) VALUES(";
				$sql.= "'" . $this->nomeseg. "',";
				$sql.= "" . $this->ordemseg. ")";

				$qry = new consulta($this->bd);
				$qry->executa($sql);
				
				return $qry->res;
		}

		function altseg() {
			if(1) {//$this->validar()
				$sql = "UPDATE seguimento SET ";
				$sql.= "NOME = '" . $this->nomeseg . "', ";
				$sql.= "ORDEM = " . $this->ordemseg . " ";
				$sql.= " WHERE CODSEG = ";
				$sql.= $this->codseg;

				$qry = new consulta($this->bd);
				$qry->executa($sql);
				
				return $qry->res;
			}
		}

		function excluirseg() {
			$qry = new consulta($this->bd);
			/*
			$sql = "SELECT COUNT(*) FROM seguimento ";
			$sql.= "WHERE CODSEG = ";
			$sql.= $this->codseg;

			
			
			$qry->executa($sql);
			
			if($qry->data[0]>0)
				return false;
				
			$sql = "SELECT COUNT(*) FROM produtos ";
			$sql.= "WHERE cod_categoria = ";
			$sql.= $this->cod_categoria;

			$qry->executa($sql);
			
			if($qry->data[0]>0)
				return false;
			*/
			
			$sql = "DELETE FROM seguimento WHERE ";
			$sql.= "CODSEG=" . $this->codseg;


			
			$qry->executa($sql);
			
			return $qry->res;
		}
		
		function incluir() {
			if($this->codseg=='')$this->codseg=0;
$r=1;
			if($this->validar()) {
				$sql = "INSERT INTO categorias(";
				$sql.= "nome,nivel,menusup,descricao,keyword, titulo, lingua, link, tipolink, visivel, tipo,conteudo, ativo,ordem) VALUES(";//,CODSEGicone,imagem,
				$sql.= "'" . utf8_decode($this->nome) . "',";
				$sql.= $this->nivel . ",";
				$sql.= $this->codigo_pai . ",";
			//	$sql.= "'" .$this->icone. "',";
			//	$sql.= "'" .$this->imagem. "',";
				$sql.= "'" .utf8_decode($this->descricao). "',";
				$sql.= "'" .utf8_decode($this->keyword). "',";
				$sql.= "'" .utf8_decode($this->titulo). "',";
				$sql.= "'" .$this->lingua. "',";
				$sql.= "'" .$this->link1. "',";
				$sql.= "'" .$this->tipolink. "',";
				$sql.= $this->visivel . ",";
				$sql.= "'" .$this->tipo. "',";
				$sql.= "'" .$this->conteudo. "',";
				$sql.= $this->ativo . ",";
				$sql.= $this->ordem . ")";
			//	$sql.= $this->codseg . ")";
//echo "<script>alert(".$sql."); </script >";
				$qry = new consulta($this->bd);
				$qry->executa($sql);
				//echo $sql;

				return $qry->res;
			}
		}
		
		function alterar() {
		$r=1;  //
			if($this->validar()) {

			/*	$sql = "select * from categorias ";
				$sql.= "WHERE cod_categoria = ";
				$sql.= $this->codigo_pai;

				$qry = new consulta($this->bd);
				$qry->executa($sql);
				
				if(!$qry->res OR $qry->nrw<=0)
				    // return false;
					$this->nivelpai =0;
				else
				   $this->nivelpai = $qry->data["nivel"]+1;
				   
				   */


				$sql = "UPDATE categorias SET ";
				$sql.= "nome = '" . utf8_decode($this->nome) . "', ";
				//$sql.= "icone = '" . $this->icone . "', ";
				//$sql.= "imagem = '" . $this->imagem . "', ";
				$sql.= "descricao = '" . $this->descricao . "', ";
				$sql.= "keyword = '" . $this->keyword . "', ";
				$sql.= "titulo = '" . $this->titulo . "', ";
				$sql.= "lingua = '" . $this->lingua . "', ";
				
				$sql.= "conteudo = '" . $this->conteudo . "', ";
				$sql.= "visivel= " . $this->visivel . ", ";
				$sql.= "ativo= " . $this->ativo . ", ";
			    $sql .=" link = '".$this->link1."',";
				$sql.= "menusup = " . $this->codigo_pai . ", ";
				$sql.= "ordem = " . $this->ordem . " ";
			//	$sql.= ", nivel = " . ($this->nivelpai) . " ";
				$sql.= "WHERE id = ";
				$sql.= $this->id;
//echo "<script>alert(".$sql.");</script >";
//echo $sql;
				$qry = new consulta($this->bd);
				$qry->executa($sql);

				
				return $qry->res;
			}
		}

		function ativaseg() {
			if($this->codseg>0) {

				$sql = "UPDATE seguimento SET ";
				if($this->ativoseg==1)
				   $sql.= "ativo =0 ";
				else
				   $sql.= "ativo =1 ";	
				$sql.= "WHERE CODSEG = ";
				$sql.= $this->codseg;

				$qry = new consulta($this->bd);
				$qry->executa($sql);
				
				return $qry->res;
			}
		}

		function buscaseg() {
			$sql = "SELECT * FROM seguimento WHERE ";
			$sql.= "CODSEG = " . $this->codseg;
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res OR $qry->nrw<=0)
				return false;

			$this->nomeseg = $qry->data["NOME"];
			$this->ativoseg = $qry->data["ATIVO"];
			$this->ordemseg = $qry->data["ORDEM"];
			//$this->codigo_pai = $qry->data["codigo_pai"];
			
			return true;
		}


		
		function validar() {
			if($this->nome=="")
			{
			echo 'nome invalido';
				return false;
				}
			if($this->nivel!=0 AND $this->codigo_pai==0)
			{
			   echo 'erro menu';
				return false;
				}
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
				
			if(($this->link1!='home')and($this->link1!=$this->link0))
				{
				
				$sql = "SELECT * FROM categorias where link='".$this->link1."' and tipo='".$this->tipo."'";  
				//nao permite 2 links do mesmo tipo
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) 
			return true;
			else
			{
			  echo '<center>LINK JA EXISTE</center>';
			  return false;
			}
			}
			return true;
		}
		
		function excluir() {
			/*$sql = "SELECT COUNT(*) FROM categorias ";
			$sql.= "WHERE codigo_pai = ";
			$sql.= $this->cod_categoria;
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if($qry->data[0]>0)
				return false;
				
			$sql = "SELECT COUNT(*) FROM categorias ";
			$sql.= "WHERE cod_categoria = ";
			$sql.= $this->cod_categoria;

			$qry->executa($sql);
			
			if($qry->data[0]>0)
				return false;
				*/
				
				$qry = new consulta($this->bd);
			
			$sql = "DELETE FROM categorias WHERE ";
			$sql.= "id=" . $this->id;
			//echo $sql;
			$qry->executa($sql);
			
			return $qry->res;
		}
		
		function selecionar($cat=0,$pagina=1,$seg=0,$tipo='T') {
			global $PHP_SELF;
			global $usr_seg;
			
			$sql = "SELECT * FROM categorias WHERE 1=1 ";
			$sql.=  ($cat==0) ? " and tipo<>'L' " : " and menusup=" . $cat;   //nivel=0
			//$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			$sql.= " ORDER BY tipo desc, ordem asc";
			
			//echo $sql;
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			//echo "<span class='link1'>". implode("::",array_reverse(explode(",",$this->arvoreid($cat)))) . "</span>";
			
			if(!$qry->res OR $qry->nrw<=0) {
				echo "<p align='center'><b>Nenhuma categoria cadastrada.</b>";
				echo "<br><br><a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=N&tipo=$tipo&cod_cat=" .$cat . "\">Incluir sub-categoria</a></p>";
			}
			else {
				echo "<table border=0 cellpadding=3 cellspacing=1 width='700' align='center'>\n";
				echo "	<tr>\n";
				echo "		<td><b>Ordem</b></td>\n";
				echo "		<td><b>Id</b></td>\n";
				echo "		<td><b>Menu</b></td>\n";
				echo "		<td><b>Tipo Menu</b></td>\n";
			//	echo "		<td><b>Nivel</b></td>\n";
			//	echo "		<td><b>Pai</b></td>\n";
			    echo "		<td><b>Lingua</b></td>\n";
				echo "		<td><b>Opcoes</b></td>\n";
				echo "	</tr>\n";						

				$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
				$row = calcula_pos($qry->nrw,$pagina);

				for($i=$row[0];$i<$row[1];$i++) {
					$qry->navega($i);  //htmlentities
					echo "	<tr>\n";
					echo "		<td class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?cod_cat=" . $qry->data["id"] . "\">" . $qry->data["ordem"] . "</a></td>\n";
					echo "		<td class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?cod_cat=" . $qry->data["id"] . "\">" . $qry->data["id"] . "</a></td>\n";
					echo "		<td class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?cod_cat=" . $qry->data["id"] . "\">" . htmlentities($qry->data["nome"]) . "</a></td>\n";
					echo "		<td class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?cod_cat=" . $qry->data["id"] . "\">" . $qry->data["tipo"] . "</a></td>\n";
					//echo "		<td>" . $qry->data["nivel"] . "</td>\n";
					//echo "		<td>" . $qry->data["menusup"] . "</td>\n";
					echo "		<td>" . $qry->data["lingua"] . "</td>\n";
					echo "		<td class='link2'><a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=N&cod_cat=" . $qry->data["id"] . "\">Incluir menu interno</a>&nbsp;&nbsp;&nbsp;";
					if($qry->data["tipo"]=='L')
					echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=A&cod_cat=" . $qry->data["id"] . "\">Alterar</a>&nbsp;&nbsp;&nbsp;";
					echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=E&cod_cat=" . $qry->data["id"] . "\">Excluir</a></td>";
					echo "	</tr>\n";					
				}
			
				echo "</table>\n";
			}	
			echo "<p align='center' class='link2'>"; 		

			
			if (($qry->data["menusup"]=='')) { //&&($qry->nrw>0) &codseg=$seg
			//   if($qry->nrw>0)
			 //  echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=I\">Incluir Nov Menu</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			
			}
			else
			   echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=N&tipo=$tipo&cod_cat=" .$cat . "\">Incluir sub-categoria</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=L\">Listar Categorias</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			if($cat!=0) 
				echo "<a class='link2' href=\"".$_SERVER['PHP_SELF']."?opt=&cod_cat=" . $this->codigo_pai . "\">Acima</a>";
			echo "</p>";
			echo "<p align='center' class='link1'>";
if(isset($row))
			link_paginas($row[2],$pagina,"&cod_cat=$cat");
			echo "</p>";
		}
		
		function listar($cat=0,$nivel=0,$seg=0) {
			global  $usr_seg;
			$sql = "SELECT * FROM categorias WHERE 1=1";
			
			
			/* if($cat=='')
			   $sql.=" and menusup = 0 ";
			else*/
			if($cat!=0) 
			   $sql.=  " and menusup = $cat ";
			
			//$sql.= " and nivel=" . $nivel." ";
			//$sql.=  ($usr_seg==0) ? " and CODSEG=0" : " and CODSEG=" . $usr_seg;
			$sql.= " ORDER BY menusup, ordem";
//echo $sql;
			$qry = new consulta($this->bd);

			$qry->executa($sql);
			if(!$qry->res OR $qry->nrw<=0) {
				if($nivel!=0)
					return true;
				else
					echo "<p align='center'><b>Nenhuma Categoria cadastrada</b></p>";
			}
			else {
			
			
			
			
			
				echo "<table border=0 cellspacing=3 cellpadding=0 class=" . (($nivel==0) ? "'txt1'" : "'txt3'") . ">\n";
				for($i=0;$i<$qry->nrw;$i++) {
				
				foreach ($this->i as $a => $value) {
			  // echo $this->i[$a];
    			if ($this->i[$a]==$qry->data["id"])//se tiver então retorna vazio
			    {     return true; 
				}
			}
			//se nao tiver na lista insere na lista  id
			$this->i[sizeof($this->i)+1]=$qry->data["id"]; 
			//echo 'i'.$this->i[sizeof($this->i)];
			
					echo "<tr><td valign='top' width='30'>" . $qry->data["menusup"] . "</td>";
					echo "<td valign='top' width='30'>" . $qry->data["id"] . "</td>";
					echo "<td valign='top'>" . $qry->data["nome"];
					echo "<a href=\"" .$_SERVER['PHP_SELF'] ;
			        echo "?opt=E&cod_cat=" . $qry->data["id"] ." \" class='link2' onclick='return confirm(\"Deseja excluir categoria ".htmlentities($qry->data["nome"])."?\")'>[X]</a></td><td><br>";
					$this->listar($qry->data["id"],$qry->data["nivel"]+1,$seg);
					echo "</td></tr>";
					$qry->proximo();
				}
				echo "</table>";
			}
		}
		//------------------------------------------------------
		function arvore($cat) {
			$sql = "SELECT nome,ordem,id FROM categorias ";
			if($cat!=0)
			     $sql.= " WHERE  menusup = $cat";
			$sql.= " ORDER BY menusup, ordem";
			//echo $sql;

			$qry = new consulta($this->bd);
			$qry->executa($sql);

			if(!$qry->res)
				return "";
			else

			if($qry->data["menusup"]=='')
				return $qry->data[0];

			
			//
			if($cat!=0)
				return htmlentities($qry->data[0]);

			return htmlentities($qry->data[0]) . "," . $this->arvore($qry->data[2]);
		}
//--------------------------------------------------------------
		function arvorelink($cat) {
			$sql = "SELECT nome,nivel,codigo_pai,cod_categoria FROM categorias WHERE ";
			$sql.= "cod_categoria = $cat";
			$sql.= " ORDER BY ordem";

			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res)
				return "";
			if($qry->data["nivel"]==0) //htmlentities()
				return "<a class='link1' href='?cod_cat=".$qry->data["cod_categoria"]."'>".$qry->data[0]."</a>";
//htmlentities()
			return "<a class='link1' href='?cod_cat=".$qry->data["cod_categoria"]."'>".$qry->data[0]."</a>" . "#" . $this->arvorelink($qry->data[2]);
		}

		function arvoreid($cat) {
			$sql = "SELECT id, nome,menusup,ordem,tipo FROM categorias WHERE ";
			$sql.= "menusup = $cat";
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res)
				return "";
			if($qry->data["tipo"]=='T')
				return htmlentities($qry->data["id"]);//data[0]

			return htmlentities($qry->data["id"]) . "," . $this->arvoreid($qry->data["menusup"]); 
		}
		


		function busca() {
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "id= " . $this->id;

//echo $sql;
			$qry = new consulta($this->bd);
			$qry->executa($sql);


			if(!$qry->res OR $qry->nrw<=0)
				return false;
			$this->nome = utf8_encode($qry->data["nome"]);
			$this->nivel = $qry->data["nivel"];
			
			$this->ativo = $qry->data["ativo"];
			$this->visivel = $qry->data["visivel"];
			
			$this->codigo_pai = $qry->data["menusup"];
			$this->menusup = $qry->data["menusup"];
		    $this->link1 = $qry->data["link"];
			
			 $this->link0 = $qry->data["link"];
			 
			//$this->codseg = $qry->data["CODSEG"];
			//$this->icone = $qry->data["icone"];
			//$this->imagem = $qry->data["imagem"];
			$this->descricao = $qry->data["descricao"];
			$this->keyword = $qry->data["keyword"];
			$this->titulo = $qry->data["titulo"];
			$this->lingua = $qry->data["lingua"];
			
			$this->conteudo = utf8_encode($qry->data["conteudo"]);
			$this->ordem = $qry->data["ordem"];
			
			return true;
		}
		
		function pai($cat=0) {
			if($cat==0)
				return 0;
				
			$sql = "SELECT codigo_pai FROM categorias ";
			$sql.= "WHERE cod_categoria = $cat";
		
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if(!$qry->res OR $qry->nrw<=0)
				return 0;
				
			return $qry->data[0];
		}
		
		function monta_select($cat_sel,$cat=0,$nivel=0) {
			global  $usr_seg,$codseg;
			$sql = "SELECT * FROM categoria WHERE ";
			$sql.= ($cat!=0) ? "menusup = $cat AND " : "";
			
		//	$sql.= "nivel=" . $nivel;
		//	$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
		
			$sql.= " 1=1 ORDER BY ordem";

			$qry = new consulta($this->bd);
			$qry->executa($sql);
			if(!$qry->res OR $qry->nrw<=0)
				return "";
			else {
			
			$opcoes ='';
			
			   if(($usr_seg!=0)OR(isset($codseg)))
			   if($cat=0)
				$opcoes.= "<option value=\"0\">MENU</option>\n";
				
				for($i=0;$i<$qry->nrw;$i++) {
				    $qry->navega($i);
					$opcoes.= "<option value=\"" . $qry->data["id"] . "\"";
					
					$opcoes.= ($cat_sel==$qry->data["id"] ? " SELECTED" : "") . ">";
					
					if($nivel>0) $opcoes.= str_repeat("&nbsp;",$nivel*5);
					$opcoes.= htmlentities($qry->data["nome"]) . "</option>\n";
					
					$opcoes.= $this->monta_select($cat_sel,$qry->data["id"],$qry->data["nivel"]+1);
					$qry->proximo();
				}
			}
			return $opcoes;
		}

		function exibirseglat(){
			global $PHP_SELF;
			$sql = "SELECT * FROM seguimento WHERE 1";
			$sql.= " ORDER BY ORDEM, NOME";

			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			
			if(!$qry->res OR $qry->nrw<=0) 
					return true;

			for($i=0;$i<$qry->nrw;$i++) {

			echo " <td  colspan='8' width='138' height='35' bgcolor='#BADF76' align='center' valign='middle' >";
       			 echo " <span class='menuprinc'  ><font  color='white' >" .htmlentities( $qry->data["NOME"]) . "</font></span>";
        		echo "<img align='right' height='100%'  src='cortemenu.png' /></td>"; 
			$qry->proximo();
 
			}

		}

		function exibirseginicio($seg=0,$cod_pai=0,$link="",$colunas=1,$class="titulo") {
			global $PHP_SELF;
			global $usr_h;
			global $area;
		
			$sql = "SELECT * FROM seguimento WHERE 1";
			//$sql.= "codigo_pai= " . (($cod_pai!=0) ? $cod_pai : "0");
		//	$sql.=  ($seg==0) ? " 1" : " AND CODSEG=" . $seg;
			$sql.= " AND ATIVO=1";
			$sql.= " ORDER BY ORDEM,NOME";
		
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			

			
			if(!$qry->res OR $qry->nrw<=0) 
					return true;
			
			$classe = ($class!="") ? "class=\"$class\"": "";


			//echo "<table  background='imagens/fundo_azul_claro.gif' border=0 cellspacing=0 cellpadding=0 width=\"100%\" align=\"center\" $classe>\n";
			
			//echo "<tr><td></br>".$lnk."<br></td></tr>";
			//echo "<tr>\n";
			
			$col_at = 0;
			for($i=0;$i<$qry->nrw;$i++) {
				$col_at++;
				if($col_at>$colunas) {
					//echo "</tr>\n<tr height=\"17\">";
					$col_at=1;
				}
				$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
				$lnk.= "?codseg=" . $qry->data["CODSEG"] . "\" $classe>";

				if ($seg== $qry->data["CODSEG"])
				{
				  $lnk="<td>>> $lnk". htmlentities($qry->data["NOME"]) . "</a><a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?opt=ES&codseg=" . $qry->data["CODSEG"] ." \" class='link2'><img src='imagens/remove.gif' border=0></a></td>\n";
				echo $lnk;
				  }
				else 
				{
				   $t= "<td>$lnk". htmlentities($qry->data["NOME"]) . "</a></td>\n";   //<h2  class=\"impresso\">
				echo "<li class=\"ui-state-default style1\">$lnk". htmlentities($qry->data["NOME"]) . "</a></li>";
				//class=\"ui-state-default ui-corner-all\"
				}
			

			$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?codseg=" . $qry->data["CODSEG"] . "&op=A\" $classe>";								


			
				//if($i==$qry->nrw-1)
				//	echo "</tr>";
				$qry->proximo();
			}		
			//echo "</table><br>";
						


			return true;
		}
		
		function exibirseg($seg=0,$cod_pai=0,$link="",$colunas=1,$class="titulo") {
			global $PHP_SELF;
			global $usr_h;
			global $area;
		
			$sql = "SELECT * FROM seguimento WHERE 1";
			//$sql.= "codigo_pai= " . (($cod_pai!=0) ? $cod_pai : "0");
		//	$sql.=  ($seg==0) ? " 1" : " AND CODSEG=" . $seg;
			
			$sql.= " ORDER BY ORDEM,NOME";
		
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			

			
			if(!$qry->res OR $qry->nrw<=0) 
					return true;
			
			$classe = ($class!="") ? "class=\"$class\"": "";

if(($usr_h->senha->tipo==1)&&($area != 0)) {

			$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?opt=IS&codseg=0 "." \" class='link2' style='color:#777'>Incluir Seguimento <img src=\"imagens/plus.gif\" border=0 /></a><br>"; //$classe
			}
			
			echo "<table  border=0 cellspacing=0 cellpadding=0 width=\"100%\" align=\"center\" $classe>\n";
			
			echo "<tr><td width=\"15\"></td><td></br>".$lnk."<br></td></tr>";
			echo "<tr>\n";
			
			$col_at = 0;
			for($i=0;$i<$qry->nrw;$i++) {
				$col_at++;
				if($col_at>$colunas) {
					echo "</tr>\n<tr height=\"17\">";
					$col_at=1;
				}
				$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
				$lnk.= "?codseg=" . $qry->data["CODSEG"] . "\" $classe>";
				if ($seg== $qry->data["CODSEG"])
				{
				  $lnk="<td width=\"15\"><img  width=\"5\" src=\"menu/SpryMenuBarRight.gif\" /></td><td> $lnk". htmlentities($qry->data["NOME"]) . "</a><a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?opt=ES&codseg=" . $qry->data["CODSEG"] ." \" class='link2' onclick='return confirm(\"Deseja excluir seguimento ".htmlentities($qry->data["NOME"])."?\")'><img src='imagens/remove.gif' border=0></a></td>\n";
				echo $lnk;
				  }
				else 
				{  
				if(($qry->data["ATIVO"]==1)&&($area == 0))
				   echo "<td width=\"15\"></td><td>$lnk". htmlentities($qry->data["NOME"]) . "</a></td>\n";
				else if($area == 1)
				   echo "<td width=\"15\"></td><td>$lnk". htmlentities($qry->data["NOME"]) . "</a></td>\n";
				}

			

			$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?codseg=" . $qry->data["CODSEG"] . "&op=A\" $classe>";								

			echo "<td>";

			if(($usr_h->senha->tipo==1)&&($area != 0)) 
			if($qry->data["ativo"]==1){
			    echo "<img border=0 src='imagens/status/icon_status_green.gif' alt='Ativar'> $lnk<img border=0 src='imagens/status/icon_status_red_light.gif' alt='desativar'></a>\n";

			}
			else
			{
			    echo "$lnk<img border=0 src='imagens/status/icon_status_green_light.gif' alt='Ativar' ></a> <img border=0 src='imagens/status/icon_status_red.gif'  alt='desativar'>\n";

			}

			$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
			$lnk.= "?codseg=" . $qry->data["CODSEG"] . "&opt=AL\" $classe>";	

			echo "$lnk<img border=0 src='imagens/btn_alterar.gif' alt='Alterar' ></a>\n";
			echo "</td>";


			if($i==$qry->nrw-1)
					echo "</tr>";
				$qry->proximo();
			}		
			echo "</table><br>";
						


			return true;
		}
//OBSOLETO
	function gera_menu($cod_ul_pai,$tabs,$id_do_pai,$nivel=0){
			global $PHP_SELF;
			global $usr_seg;
			 $link="index.php";

			if($usr_seg==0) return false;

			if($nivel==0)
			{
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai=0";
			}
			else		
			{
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai= " . (($id_do_pai!=0) ? $id_do_pai : "0");
			}

			if($id_do_pai==0)
			$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			//$sql.= " AND nivel=$nivel";
			
			$sql.= " and ordem>0 ";
			$sql.= " ORDER BY  nivel,ordem, nome";
			//echo $sql;
			$qry = new consulta($this->bd);
			$qry->executa($sql);

			$ret = "";
			
			//if(!$qry->res OR $qry->nrw<=0) 
			//		return true;
if ($qry->nrw>0)
{
$ret .= $cod_ul_pai."\r\n";

		for($i=0;$i<$qry->nrw;$i++) {
			//$cod_ul_pai="<ul id='MenuBar$i' class='MenuBarVertical'>";
				
			if($id_do_pai==0)
			{ 
				$href = "<a class='stylemenu2' width='100%'  href=\"" . (($link=="") ? $PHP_SELF : $link);
				$href.= "?cod_cat=" . $qry->data["cod_categoria"] . "\" >";
		//bgcolor="#89F4DC" 
			echo '<tr><td  height="23"  width="80%" class="MenuBarItemSubmenu" ><div class="demos-nav ui-corner-all ui-state-default " >' ; //stylemenu2 
			echo "  <font width='160' class='stylemenu2 ' color='white'>".$href.htmlentities($qry->data["nome"])."</a></font></div></td></tr><tr><td>";
			}
			else
			{

			
			//$ret .= $cod_ul_pai."\r\n";	
			$href = "<a class='MenuBarItemSubmenu' href=\"" . (($link=="") ? $PHP_SELF : $link);
			$href.= "?cod_cat=" . $qry->data["cod_categoria"] . "\" >"; //$classe
			
			  $ret .= $tabs."    <li >$href<img src='menu/SpryMenuBarRight.gif' border=0  /><font class='stylemenu'> ".htmlentities($qry->data["nome"])."</font>";  //
			 // $ret .= "<font class='stylemarcador'>></font>";
			  $ret .= "</a>";
				
			  }


			/*  
			   //testando se tem filhos
			   $sql2 = "SELECT * FROM categorias WHERE ";
			$sql2.= "codigo_pai= " . (($qry->data["cod_categoria"]!=0) ? $qry->data["cod_categoria"] : "0");  
			//$sql2.=  ($seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $seg;

			$sql2.= " and ordem>0 ";
			$sql2.= " ORDER BY nivel,ordem,nome and VISIVEL!=0"; //AND VISIVEL=1 

			$qry2 = new consulta($this->bd);
			  $qry2->executa($sql2);
			*/
			
               // $recfilho = mysql_query($sql2);
                echo $ret;
	
		//if ($qry2->nrw>0)	//".$tabs."
		//if ($qry->nrw>0)				// id='nav'   class='MenuBarVertical'						
  			   $ret = "\r\n        ".$this->gera_menu("\n $tabs<ul>","        ",$qry->data["cod_categoria"],$qry->data["nivel"]+1)."";//."</ul>    ".$tabs
		 
				
              //  if(mysql_num_rows($recfilho)>0){
              //      $ret .= "\r\n".$tabs."        ".$this->gera_menu("<ul>",$tabs."        ",$qry2->data["cod_categoria"])."    ".$tabs;//
              //  }
            //fim filhos
            $ret .= $tabs."</li>\r\n";
	
            $qry->proximo();


		if($id_do_pai==0)
		{ 
			echo '</td></tr>';
		}

	}

$ret .= $tabs."</ul>\r\n"; //
}   
    
   // mysql_free_result($recc);
    //echo $ret;
    return $ret;
}



function gera_busca(){
  global $_SESSION;   //$PHP_SELF 
echo '

<table width="100%" class="categ" cellpadding="0"  bgcolor="#D2DDE3" cellspacing="0"><!-- class="busc" style="background-color:#BFB"-->
<tr><td class=\'stylemenu3\' >Pesquisar</td></tr>
<tr>
      
    <td  valign="top" ><form id="form1" name="form1" method="post" action="index.php">
    <!--fieldset class="form-search"> 
    <legend>Pesquisa</legend class="searchBox" <label>--> 
        
          &nbsp;<input type="text"  size="20" maxlength="40"  name="busca1" id="textfield" value="Codigo" onFocus="if (this.value==\'Codigo\') this.value=\'\'" onBlur="if(this.value==\'\') { this.value=\'Codigo\'; return false; }" />
          <input type="image" align="absmiddle" name="imageField" id="imageField" src="temas/'.$_SESSION["usr_seg"].'/find1.png" /><!--a style="cursor:pointer" onclick="form1.submit()"><img height="25" src="temas/'.$_SESSION["usr_seg"].'/find.png" border="0"></a-->
          <br>
 &nbsp;<input type="text"  size="20" maxlength="40"  name="busca" id="textfield" value="Palavra" onFocus="if (this.value==\'Palavra\') this.value=\'\'" onBlur="if(this.value==\'\') { this.value=\'Palavra\'; return false; }" />
          <input type="image" align="absmiddle" name="imageField" id="imageField" src="temas/'.$_SESSION["usr_seg"].'/find1.png" /><!--a style="cursor:pointer" onclick="form1.submit()"><img height="25" src="temas/'.$_SESSION["usr_seg"].'/find.png" border="0"></a-->

<!-- class="button" <input type="image" class="button" align="absmiddle" name="imageField" id="imageField" src="btbuscar.png" /><img src="imagens/busca_av.gif" border="0">-->
          &nbsp;&nbsp;&nbsp;<a href="busca_avancada.php" class="button" ><span>Busca Avançada</span></a>
          
          <!--</label>/fieldset-->
    </form></td></tr>
</table>
<br>
';

}


//--------------------------------------------------------------------------------------------------------
	function gera_menuplus($cod_ul_pai,$tabs,$id_do_pai,$nivel=0){
			global $PHP_SELF;
			global $usr_seg, $link1;
			 $link="index.php";

			//if($usr_seg==0) return false;
			
			if($nivel==0)
			{
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai=0";
			//$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			$sql.= " AND VISIVEL!=0 ";

			if(strtoupper($link1)!="AJUDA")
 			    $sql.= " and ordem>0";
			else $sql.= " and ordem<0";

			}
			else		
			{
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai= " . (($id_do_pai!=0) ? $id_do_pai : "0");
			$sql.= " AND VISIVEL!=0 ";
			}

			//if($id_do_pai==0)
			$sql.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			//$sql.= " AND nivel=$nivel";
			

			$sql.= " ORDER BY nivel, ordem,nome";
			//echo $sql;

			$qry = new consulta($this->bd);
			$qry->executa($sql);

			$ret = "";


			
			//if(!$qry->res OR $qry->nrw<=0) 
			//		return true;
		$nmen=1;	
 		
			
if ($qry->nrw>0)
{
$ret .= "".$cod_ul_pai."\r\n";
//$ret .="<span class=\"Menu\">";

		for($i=0;$i<$qry->nrw;$i++) {
			//$cod_ul_pai="<ul id='MenuBar$i' class='MenuBarVertical '>";
				
			if($nivel==0)  //$id_do_pai
			{ 
				$href = "<a class='stylemenu2' width='100%'  href=\"" . (($link=="") ? $PHP_SELF : $link);
				$href.= "?cod_cat=" . $qry->data["cod_categoria"] . "\" >";
		//bgcolor="#89F4DC" 
			//echo '<span class="Menu" ><tr class="demos-nav ui-corner-all ui-state-default" style="padding-top:5px;padding-bottom:5px;">';
			echo '<span class="Menu" ><table class="categ"><tr class="" style="padding-top:5px;padding-bottom:5px;">';

			if(!stristr($this->arvoreid($id_do_pai),$qry->data["cod_categoria"])) 
			  $quad="plus.gif";
			else  $quad="minus.gif"; 
			echo "<td><img src='imagens/".$quad."' ID='img_".$nmen."' border='0' onClick='javascript: Menu(".$nmen.");' /></td>";

			if($qry->data["icone"]!="")
			   echo '<td height="20" width="168"  class="MenuBarItemSubmenu" align="left" >'.'<div class=""  >' ; 
			else
			   echo '<td colspan=2 height="20" width="168"   class="MenuBarItemSubmenu" align="left" >'.'<div class=""  >' ; 
			
			//stylemenu2 width="120" 
			//echo '<div class="" style="width:100px;"  >';

			
			echo "  <font class='stylemenu2 ' color='white'>".$href.htmlentities($qry->data["nome"])."</a></font></div></td>";
			//if($qry->data["icone"]!="")
			//   echo "<td style='padding:0;margin:0;'><IMG align='left' ID='imgT_".$nmen."' SRC='imagens/categorias/".$qry->data["icone"]."' width='50' border='1' onClick='javascript: Menu(".$nmen.");'></td>";
			//else echo "<img src='imagens/".$quad."' border='0' /></td>";
  
			echo "";  
			//='imagens/".$quad."'
			echo "</tr></span>\r\n<tr><td colspan=3>";

				echo "<span id='ktg_".$nmen."'";
			//if($id_do_pai!=$qry->data["cod_categoria"])
			$ar=$this->arvoreid($id_do_pai);
//echo 'iddopai'.$ar.' '.$qry->data["cod_categoria"];
			if(!stristr($this->arvoreid($id_do_pai),$qry->data["cod_categoria"])) 
			   echo " style='display:none;'";
			echo " >";  
			$nmen++;
			}
			else
			{
			   //testando se tem filhos
			   $sql2 = "SELECT * FROM categorias WHERE ";
			$sql2.= "codigo_pai= " . (($qry->data["cod_categoria"]!=0) ? $qry->data["cod_categoria"] : "0");  //$qry->data["cod_categoria"]
			//$sql2.=  ($seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $seg;
			$sql2.=  ($usr_seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $usr_seg;
			$sql2.= " AND VISIVEL!=0 ";

			/*if(strtoupper($link1)!="AJUDA")
 			    $sql2.= " and ordem>0";
			else $sql2.= " and ordem<0";*/

			$sql2.= " ORDER BY nivel, ordem, nome"; //AND VISIVEL=1 

			$qry2 = new consulta($this->bd);
			  $qry2->executa($sql2);
			  
			if(!$qry2->res OR $qry2->nrw<=0) 
			  $cl='';
			else  $cl='temsub'; 
$href='';
			
			//$ret .= $cod_ul_pai."\r\n";	//
			$href .= "<a class='MenuBarItemSubmenu ".$cl."' href=\"" . (($link=="") ? $PHP_SELF : $link);
			$href.= "?cod_cat=" . $qry->data["cod_categoria"] . "\" >";
			if($qry->data["icone"]!="")
			$href.= "<img src='imagens/categorias/".$qry->data["icone"]."' width='20' border='0' />   "; //$classe
			
						  

               // $recfilho = mysql_query($sql2);
			
			// class='".$cl."'                                //$href<!--img src='menu/SpryMenuBarRight.gif' border=0  /-->
			  $ret .= $tabs."    <li onmouseover='mostrafilhos(this,".$qry->data["cod_categoria"].")' onmouseout='escondefilhos(this,".$qry->data["cod_categoria"].")' >$href<font class='stylemenu'> ".htmlentities($qry->data["nome"])."</font>";  //
			 // $ret .= "<font class='stylemarcador'>></font>";
			  $ret .= "</a>"; 
				
			  }


		echo $ret; 
                
		//$ret='';
	
		//if ($qry2->nrw>0)	//".$tabs."
		//if ($qry->nrw>0)				// id='nav'   class='MenuBarVertical'						
  			   $ret = "".$this->gera_menuplus("\n$tabs<ul  id='nav".$qry->data["cod_categoria"]."'>","",$qry->data["cod_categoria"],$qry->data["nivel"]+1)."";//."</ul>".$tabs
		
				//"\r\n        "
              //  if(mysql_num_rows($recfilho)>0){
              //      $ret .= "\r\n".$tabs."".$this->gera_menu("<ul>",$tabs."",$qry2->data["cod_categoria"])."".$tabs;//
              //  }
            //fim filhos
if(isset($cl))
          if($cl!='')  // if(($i==$qry->nrw-1)&&($nivel>1)&&($qry->nrw>0) ) //
            $ret .= $tabs."</li>"; //\r\n
//echo $ret;

		if($nivel==0) //$id_do_pai
		{ 
			echo '</ul></td></tr></table>';//</span></td></tr></span>   //</ul>
		}
//	echo "cat".$qry->data["cod_categoria"]."pai".$qry->data["codigo_pai"]."nivel".$qry->data["nivel"]."ordem".$qry->data["ordem"];

            $qry->proximo();




	}
//$ret .="</span>";

}   
if(isset($cl))
if(($cl=='')&&($i==$qry->nrw)&&($nivel>0)&&($qry->nrw>0) ) //
echo $tabs."</ul>\r\n"; //</span> //$ret .=
    
   // mysql_free_result($recc);
    //echo $ret;
    return $ret;
}



		
		function exibir($cod_pai=0,$link="",$colunas=1,$class="link3",$seg=0) {
			global $PHP_SELF;
			
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai= " . (($cod_pai!=0) ? $cod_pai : "0");
			$sql.=  ($seg==0) ? " AND CODSEG=0" : " AND CODSEG=" . $seg;
			$sql.= " ORDER BY nivel, ordem, nome";
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if(!$qry->res OR $qry->nrw<=0) 
					return true;
			
			$classe = ($class!="") ? "class=\"$class\"": "";
			
			echo "<table  border=0 cellspacing=0 cellpadding=0 width=\"100%\" align=\"center\" $classe>\n";
			echo "<tr height=\"17\">\n";
			
			$col_at = 0;
			for($i=0;$i<$qry->nrw;$i++) {
				$col_at++;
				if($col_at>$colunas) {
					echo "</tr>\n<tr height=\"17\">";
					$col_at=1;
				}
				$lnk = "<a href=\"" . (($link=="") ? $PHP_SELF : $link);
				$lnk.= "?cod_cat=" . $qry->data["cod_categoria"] . "\" $classe>";
				
				echo "<td>$lnk". $qry->data["nome"] . "</a></td>\n";
				if($i==$qry->nrw-1)
					echo "</tr>";
				$qry->proximo();
			}		
			echo "</table>";

			return true;
		}
		

		// WAP
		function wap_exibir($cod_pai=0) {
			global $PHP_SELF;
			
			$sql = "SELECT * FROM categorias WHERE ";
			$sql.= "codigo_pai= " . (($cod_pai!=0) ? $cod_pai : "0");
			$sql.= " ORDER BY nome";
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if(!$qry->res OR $qry->nrw<=0) 
					return "";
			
			for($i=0;$i<$qry->nrw;$i++) {
				$lnk = "<a href=\"" . $PHP_SELF;
				$lnk.= "?cod_cat=" . $qry->data["cod_categoria"] . "\">";
				$result.= "<p mode=\"nowrap\">$lnk". $qry->data["nome"] . "</a></p>";
				$qry->proximo();
			}		
			return $result;
		}


	}
	
	?>	