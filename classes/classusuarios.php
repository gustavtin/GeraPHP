<?php
  

	class usuarios {
		var $numero;
		var $ddd;	
	
		var $user_id;
		var $nome;
		var $endereco;
		var $bairro;
		var $cep;
		var $complemento;
		var $cidade;
		var $estado;
		var $pais;
		var $telefone;
		var $email;
		var $sexo;
		var $datanasc;
		var $site;
		var $identidade;
		var $cpf;
		var $publicidade;
		var $newsletter;
		var $promos;
		var $ultimavisita;
		var $ultimacompra;
		var $celular;
		var $tipoconta;
		
		var $origem;

		
		var $tipoemp;
		var $dddc;
		var $bd;
		var $qry;
		var $senha;
		var $banco;

		var $datacad;
		var $horacad;
		
		function usuarios($bd) {
			$this->bd = $bd;
			$this->senha = new senha($bd);
			$this->qry = new consulta($bd);
			$this->banco = new banco($bd);
			$this->user_id = 0;
			$this->nome = "";
			$this->endereco = "";
			$this->bairro = "";
			$this->cep = "";
			$this->cidade = "";
			$this->estado = "";
			$this->pais = "BRA";
			$this->telefone = "";
			$this->celular = "";
			$this->dddc = "0";
			$this->email = "";
			$this->datanasc= '';
			$this->sexo = 1;
			$this->origem = 'ADM';
			$this->identidade = "";
			$this->cpf = "";
			$this->cnpj= "";
			$this->ie = "";
			$this->publicidade = 1;
			$this->newsletter = 1;
			$this->promos = 1;
			$this->numero=0;
			$this->ddd=0;
		}

		function incluiremail(){
		   global $nomesite;
			if(1==1) { //$this->validar()
				// verifica se existe login igual
				
				$this->datacad=date("Y-m-d");
				$this->horacad = date("H:i:s");		

				$sql = "INSERT INTO emails ";
				$sql.= "(nome,email, data, hora) VALUES(";
				$sql.= "'" . $this->nome . "',";
				
				$sql.= "'" . $this->email . "',";
				$sql.= "'" . $this->datacad . "',";
				$sql.= "'" . $this->horacad . "'";
				$sql.= ")";


				$this->qry->executa($sql);

				if(!$this->qry->res)
					return false;
				
				$sql = "SELECT user_id FROM emails ORDER BY user_id DESC";
				$this->user_id = $this->qry->last_id("usuarios_user_id_seq",$sql);

			
				
				$mensagem = "Olá " . $this->nome . ",\n\n";
				$mensagem.= "Bem-vindo ao nosso site, você agora ";
				$mensagem.= "é um usuàrio registrado e poderá ";
				$mensagem.= "dispor dos privilégios de nossos ";
				$mensagem.= "revendedores,entre estes temos: ";
				$mensagem.= "promoções,  ";
				$mensagem.= "facilidades, downloads, etc. Lembramos, "; 
				$mensagem.= "que estes bebeficios estão disponiveis ";
				$mensagem.= "somente aos membros do ".$nomesite.".\n";
				$mensagem.= "Abaixo seguem seu login e senha. \n\n";
				$mensagem.= "Login: " . $this->senha->login . "\n";
				$mensagem.= "Senha: " . $this->senha->senha . "\n\n";
				$mensagem.= "Sugerimos que você troque sua senha o ";
				$mensagem.= "mais rápido possivel. para isto basta ";
				$mensagem.= "acessar o site, efetuar o login e clicar ";
				$mensagem.= "na opção troca de senha.\n\n\n";
				$mensagem.= "Obrigado por navegar em nosso site!\n\n";
				$mensagem.= "Equipe ".$nomesite;
				
				$assunto = $nomesite.": Seu cadastro no site";
				
				//$this->e_mail($assunto,$mensagem);
				
				return true;
				
			}
			else {
				$erro=2;
				return false;
			}
		
		}
		
		function incluir(&$erro) {
		   global $nomesite, $assunto, $mensagem;
			if(1) {//$this->validar()
				// verifica se existe login igual
				if($this->senha->busca("l")) {
					$erro = 1;
					return false;
				}
							
				$sql = "INSERT INTO usuarios ";
				$sql.= "(nome,endereco,numero,bairro,cep,cidade,";
				$sql.= "estado,pais,telefone,celular, dddc,email,sexo,complemento,";
				$sql.= "identidade,cpf,publicidade,newsletter,ddd, datanasc, site, tipoconta,tipoemp, origem";
				$sql.= ") VALUES(";
				$sql.= "'" . $this->nome . "',";
				$sql.= "'" . $this->endereco . "',";
				$sql.= "'" . $this->numero . "',";
				$sql.= "'" . $this->bairro . "',";
				$sql.= "'" . $this->cep . "',";
				$sql.= "'" . $this->cidade . "',";
				$sql.= "'" . $this->estado . "',";
				$sql.= "'" . $this->pais . "',";
				$sql.= "'" . $this->telefone . "',";
				$sql.= "'" . $this->celular . "',";
				$sql.= "" . $this->dddc . ",";
				$sql.= "'" . $this->email . "',";
				$sql.= $this->sexo . ",";
				$sql.= "'" . $this->complemento . "',";
				$sql.= "'" . $this->identidade . "',";
				$sql.= "'" . $this->cpf . "',";
				$sql.= $this->publicidade . ",";
				$sql.= $this->newsletter . ",";
				$sql.= $this->ddd . ",";
				$sql.= "'" .conv_data2($this->datanasc)."',"; 
				$sql.= "'" . $this->site . "',";
				$sql.= "'" . $this->tipoconta . "',";
				$sql.= "'" . $this->tipoemp . "',";
				$sql.= "'" . $this->origem . "'";

				//$sql.= $this->promos;
				$sql.= ")";

				
				$this->qry->executa($sql);

				if(!$this->qry->res)
					return false;
				
				$sql = "SELECT user_id FROM usuarios ORDER BY user_id DESC";
				$this->user_id = $this->qry->last_id("usuarios_user_id_seq",$sql);

				$this->senha->user_id = $this->user_id;

				if(!$this->senha->incluir())
					return false;
			
				
				$mensagem = "Olá " . $this->nome . ",\n\n";
				$mensagem.= "Bem-vindo ao nosso site, você agora ";
				$mensagem.= "é um usuàrio registrado e poderá ";
				$mensagem.= "dispor dos privilégios de nossos ";
				$mensagem.= "revendedores,entre estes temos: ";
				$mensagem.= "promoções,  ";
				$mensagem.= "facilidades, downloads, etc. Lembramos, "; 
				$mensagem.= "que estes bebeficios estão disponiveis ";
				$mensagem.= "somente aos membros do ".$nomesite.".\n";
				$mensagem.= "Abaixo seguem seu login e senha. \n\n";
				$mensagem.= "Login: " . $this->senha->login . "\n";
				$mensagem.= "Senha: " . $this->senha->senha . "\n\n";
				$mensagem.= "Sugerimos que você troque sua senha o ";
				$mensagem.= "mais rápido possivel. para isto basta ";
				$mensagem.= "acessar o site, efetuar o login e clicar ";
				$mensagem.= "na opção troca de senha.\n\n\n";
				$mensagem.= "Obrigado por navegar em nosso site!\n\n";
				$mensagem.= "Equipe ".$nomesite;
				
				$assunto = $nomesite.": Seu cadastro no site";
				
				$this->e_mail($assunto,$mensagem);
				
				return true;
				
			}
			else {
				$erro=2;
				return false;
			}
		}
		
		function validar() {
		
		if(strlen($this->endereco)<4)
			{
			echo "<font color=\"#FF0000\"><center>Erro:Endereço muito curto</center></font>";
			return false;
			}
			if(strlen($this->bairro)<5)
			{
			echo "<font color=\"#FF0000\"><center>Erro:Bairro muito curto</center></font>";
			return false;
			}
			if(strlen($this->cidade)<5)
			{
			echo "<font color=\"#FF0000\"><center>Erro:Cidade muito curto</center></font>";
			return false;
			}
			if(strlen($this->cep)<5)
			{
			echo "<font color=\"#FF0000\"><center>Erro:CEP muito curto</center></font>";
			return false;
			}
			if(strlen($this->telefone)<8)
			{
			echo "<font color=\"#FF0000\"><center>Erro:Telefone muito curto</center></font>";
			return false;
			}
			if(strlen($this->celular)<8)
			{
			echo "<font color=\"#FF0000\"><center>Erro:Celular muito curto</center></font>";
			return false;
			}



			if(strpos($this->email,"@")<=0 OR 
			strpos($this->email,"@")!=strrpos($this->email,"@"))
			{
				echo "<font color=\"#FF0000\"><center>email invalido</center></font>";	
			   	return false;
			}
/*
			if(empty($this->cep) OR !(ereg("([0-9]{5})-([0-9]{3})",$this->cep,$regs) OR 
	 	    ereg("([0-9]{8})",$this->cep,$regs))) 
			{
			echo "<font color=\"#FF0000\"><center>CEP invalido</center></font>";
					return false;
			}
			*/
			//return !($this->validacpf());

			return true;
		}
		
		function validacpf() {
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
		
		function alterar() {
			if($this->validar()) {
				$sql = "UPDATE usuarios  SET ";
				$sql.= "nome = '" . $this->nome . "',";
				$sql.= "endereco = '" . $this->endereco . "',";
				$sql.= "numero = '" . $this->numero . "',";
				$sql.= "bairro = '" . $this->bairro . "',";				
				$sql.= "cep = '" . $this->cep . "',";				
				$sql.= "cidade = '" . $this->cidade . "',";
				$sql.= "estado = '" . $this->estado . "',";
				$sql.= "pais = '" . $this->pais . "',";								
				$sql.= "telefone = '" . $this->telefone . "',";
				$sql.= "celular = '" . $this->celular . "',";
				$sql.= "dddc = " . $this->dddc . ",";
				$sql.= "email = '" . $this->email . "',";
				$sql.= "sexo = " . $this->sexo . ",";	
				$sql.= "identidade = '" . $this->identidade . "',";				
				$sql.= "cpf = '" . $this->cpf . "',";				
				$sql.= "complemento='" . $this->complemento . "',";							
				$sql.= "datanasc = '" . conv_data2($this->datanasc) . "',";								
				$sql.= "cnpj = '" . $this->cnpj . "',";	
				$sql.= "site = '" . $this->site . "',";	
				$sql.= "publicidade = " . $this->publicidade . ",";
				$sql.= "newsletter = " . $this->newsletter . ",";
				$sql.= "ddd = " . $this->ddd . ",";
				$sql.= "origem = '" . $this->origem . "'";
			//	$sql.= "promos = " . $this->promos;												
				$sql.= " WHERE user_id= " . $this->user_id;
//echo $sql;
				$this->qry->executa($sql);
				
				return $this->qry->res;
			}
			
			return false;
		}

		function excluiremail() {

			$sql = "DELETE FROM emails WHERE ";
			$sql.= "user_id = " . $this->user_id;

			$this->qry->executa($sql);
					
			return $this->qry->res;
				
		}
		
		function excluir() {
			$this->senha->user_id = $this->user_id;
			$this->senha->busca("u");
			if($this->senha->excluir())
				if($this->senha->tipo==1) {
					$sql = "DELETE FROM usuarios WHERE ";
					$sql.= "user_id = " . $this->user_id;

					$this->qry->executa($sql);
					
					return $this->qry->res;
				}
				else 
					return true;
			else
				return false;
		}

		function listar($pagina=1,$dest='',$tipo=0) {
			$sql = "SELECT user_id,login FROM senhas WHERE 1=1 ";
			$sql.= (($tipo!=0) ? " and tipo = " .$tipo : "");
			$sql.= (($dest!='') ? " and user_id IN ( " . $dest . " ) " : "");
			$sql.= " and ativo = 1 ORDER BY user_id";

			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhum Registro</b></p>";
				return false;
			}

			$pagina = ($pagina==0) ? $pagina=1 : $pagina;
				
			$row = calcula_pos($this->qry->nrw,$pagina);

			
			echo "<table border=0 cellpadding=0 cellspacing=3 width='450' class='txt2' valign='top'>\n";
			echo "	<tr>\n";
			echo "		<td><b>Id</b></td>\n";
			echo "		<td><b>Login</b></td>\n";
			echo "		<td><b>Nome</b></td>\n";
			echo "		<td><b>Endereço</b></td>\n";
			echo "		<td><b>Cidade</b></td>\n";
			echo "		<td><b>Estado</b></td>\n";
			echo "		<td><b>Pa&iacute;s</b></td>\n";
			echo "		<td><b>Telefone</b></td>\n";
			echo "		<td><b>Celular</b></td>\n";
			echo "		<td><b>E-mail</b></td>\n";									
			echo "		<td><b>&Uacute;ltima Visita</b></td>\n";
			//echo "		<td><b>&Uacute;ltima Compra</b></td>\n";
			echo "	</tr>\n";						

			for($i=$row[0];$i<$row[1];$i++) {
				$this->qry->navega($i);
				$this->user_id = $this->qry->data[0];
				$this->senha->login = $this->qry->data[1];
				$this->busca();
				echo "	<tr>\n";
				echo "		<td nowrap>" . $this->user_id . "</td>\n";
				echo "		<td nowrap>" . $this->senha->login . "</td>\n";
				echo "		<td nowrap>" . $this->nome . "</td>\n";
				echo "		<td nowrap>" . $this->endereco.','.$this->numero . "</td>\n";
				echo "		<td nowrap>" . $this->cidade . "</td>\n";
				echo "		<td nowrap>" . $this->estado . "</td>\n";
				echo "		<td nowrap>" . $this->pais . "</td>\n";
				echo "		<td nowrap>" .'('.$this->ddd.')'. $this->telefone . "</td>\n";
				echo "		<td nowrap>" .'('.$this->dddc.')'. $this->celular . "</td>\n";
				echo "		<td nowrap>" . $this->email . "</td>\n";									
				echo "		<td nowrap>" . $this->ultimavisita . "</td>\n";
				//echo "		<td nowrap>" . $this->ultimacompra . "</td>\n";
				echo "	</tr>\n";						
			}
			
			echo "</table>";
			echo "<p align='center' class='link2'>";
			link_paginas($row[2],$pagina,"");
			echo "</p>";			
		}
		
		function selecionar($pagina=1,$teste='') {
			global $PHP_SELF;
			$sql = "SELECT usuarios.user_id,login,nome,email,tipo,origem FROM usuarios,senhas ";
			$sql.= "WHERE senhas.user_id = usuarios.user_id AND ";
			$sql.= "senhas.ativo = 1 AND senhas.tipo<>3 ORDER BY user_id";
			
			if($teste!='')
			  echo $sql;
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhum usu&aacute;rio cadastrado</b></p>";
			}
			else {
				echo "<form name='usr' method='post' action='".$_SERVER['PHP_SELF']."?opt=M'>\n";
				echo "<table border=0 cellpadding=0 cellspacing=0 width='800'>\n";
				echo "	<tr>\n";
				echo "		<td></td>\n";				
				echo "		<td><b>Id</b></td>\n";
				echo "		<td><b>Login</b></td>\n";
				echo "		<td><b>Nome</b></td>\n";
				echo "		<td><b>E-mail</b></td>\n";
				echo "		<td><b>Tipo</b></td>\n";
				echo "		<td><b>Origem</b></td>\n";
				echo "		<td><b>Op&ccedil;ões</b></td>\n";
				echo "	</tr>\n";	
				
				$pagina = ($pagina==0) ? 1 : $pagina;
				$row = calcula_pos($this->qry->nrw,$pagina);
								
				for($i=$row[0];$i<$row[1];$i++) {
					echo "	<tr>\n";
					echo "		<td><input type='checkbox' name='email[]' value='" . $this->qry->data["user_id"] . "'></td>\n";					
					echo "		<td>" . $this->qry->data["user_id"] . "</td>\n";
					echo "		<td>" . $this->qry->data["login"] . "</td>\n";
					echo "		<td>" . $this->qry->data["nome"] . "</td>\n";
					echo "		<td>" . $this->qry->data["email"] . "</td>\n";
					echo "		<td>" . (($this->qry->data["tipo"]==1) ? "Admin" : "Cliente") . "</td>\n";					
					echo "		<td>" . $this->qry->data["origem"] . "</td>\n";
					echo "		<td class='link2'><a class='link2' href=\"$PHP_SELF?opt=A&user_id=" . $this->qry->data["user_id"] . "\">Alterar</a>&nbsp;&nbsp;";
					echo "<a class='link2' href=\"$PHP_SELF?opt=E&user_id=" .	 $this->qry->data["user_id"] . "\">Excluir</a></td>";
					echo "	</tr>\n";					
					$this->qry->proximo();	
				}
				
				echo "</table></form>\n";
			}

			echo "<br><p align='center' class='link2'><a class='link2' href=\"$PHP_SELF?opt=I\">Incluir Novo usuário</a>&nbsp;&nbsp;";
			//echo "<a class='link2' href=\"$PHP_SELF?opt=L\">Listar usu&aacute;rios</a>&nbsp;&nbsp";
			echo "<a class='link2' href=\"javascript: lista();\">Listar Usu&aacute;rios</a>";
			echo "<a class='link2' href=\"javascript: document.usr.submit();\">Enviar E-mail</a></p>";				
			echo "<p align='center' class='link1'>";
			link_paginas($row[2],$pagina,"");
			echo "</p>";
		}

function selecionaremails($pagina=1) {
			global $PHP_SELF;
			$sql = "SELECT * FROM emails ";
			$sql .= "ORDER BY user_id";
			
			$this->qry->executa($sql);
			
			if(!$this->qry->res OR $this->qry->nrw<=0) {
				echo "<p align='center'><b>Nenhum email cadastrado</b></p>";
			}
			else {
				echo "<form name='usr' method='post' action='$PHP_SELF?opt=M'>\n";
				echo "<table border=0 cellpadding=0 cellspacing=0 width='800'>\n";
				echo "	<tr>\n";
				echo "		<td></td>\n";				
				echo "		<td><b>Id</b></td>\n";
				echo "		<td><b>Nome</b></td>\n";
				echo "		<td><b>E-mail</b></td>\n";
				echo "		<td><b>Data</b></td>\n";
				echo "		<td><b>Op&ccedil;ões</b></td>\n";
				echo "	</tr>\n";	
				
				$pagina = ($pagina==0) ? 1 : $pagina;
				$row = calcula_pos($this->qry->nrw,$pagina);
								
				for($i=$row[0];$i<$row[1];$i++) {
					echo "	<tr>\n";
					echo "		<td><input type='checkbox' name='email[]' value='" . $this->qry->data["user_id"] . "'></td>\n";					
					echo "		<td>" . $this->qry->data["user_id"] . "</td>\n";
					//echo "		<td>" . $this->qry->data["login"] . "</td>\n";
					echo "		<td>" . $this->qry->data["nome"] . "</td>\n";
					echo "		<td>" . $this->qry->data["email"] . "</td>\n";
					echo "		<td>" . date("d/m/Y",strtotime($this->qry->data["data"]))." ". date("H:i:s",strtotime($this->qry->data["hora"])) . "</td>\n";
					//echo "		<td>" . (($this->qry->data["tipo"]==1) ? "Admin" : "Revendedor") . "</td>\n"; //<a class='link2' href=\"$PHP_SELF?opt=A&user_id=" . $this->qry->data["user_id"] . "\">Alterar</a>					
					echo "		<td class='link2'>&nbsp;&nbsp;";
					echo "<a class='link2' href=\"$PHP_SELF?opt=E&user_id=" .	 $this->qry->data["user_id"] . "\">Excluir</a></td>";
					echo "	</tr>\n";					
					$this->qry->proximo();	
				}
				
				echo "</table>\n";
			}

			//echo "<br><p align='center' class='link2'><a class='link2' href=\"$PHP_SELF?opt=I\">Incluir Novo usuário</a>&nbsp;&nbsp;";
			//echo "<a class='link2' href=\"$PHP_SELF?opt=L\">Listar usuários</a>&nbsp;&nbsp";
			echo "<a class='link2' href=\"javascript: document.usr.submit();\">Enviar E-mail</a></p>";				
			echo "<p align='center' class='link1'>";
			link_paginas($row[2],$pagina,"");
			echo "</p>";
		}

	function e_mail($assunto,$mensagem,$param="",$outroemail="") {
	        global $emailsuporte;
			if($mensagem=="" OR empty($mensagem) OR $this->email=="")
				return false;
			if($param=="")
				$param = "From: ".$emailsuporte;
			@mail($this->email,$assunto,$mensagem,$param);

			if($outroemail!="")
			   @mail($outroemail,$assunto,$mensagem,$param);
			
			return true;	
		}
		
		
      function monta_cidade_select($cod=0,$estado=0) {
		$sql = "SELECT * FROM cidades where codestado = ".$estado;
		if($cod>0)
		$sql .=" and cod=".$cod;
		$sql .=" order by nome asc";
		               //echo $sql;
		$this->qry->executa($sql);
		//echo $sql;
		$opcoes='';
		if(!$this->qry->res OR $this->qry->nrw<=0)
			return "";
		else {
			for($i=0;$i<$this->qry->nrw;$i++) {
				$opcoes.= "<option value=\"" . $this->qry->data["cod"] . "\" ";
				$opcoes.= ($cod==$this->qry->data["cod"]) ? "SELECTED>" : ">";
				$opcoes.= htmlentities($this->qry->data["nome"]) . "</option>\n";
				$this->qry->proximo();
			}
		}
		return $opcoes;
	}

              function monta_estado_select($cod=0) {
		$sql = "SELECT * FROM estados order by nome asc";
		$this->qry->executa($sql);
		$opcoes='';
		if(!$this->qry->res OR $this->qry->nrw<=0)
			return "";
		else {
			for($i=0;$i<$this->qry->nrw;$i++) {
				$opcoes .= "<option value=\"" . $this->qry->data["cod"] . "\" ";
				$opcoes .= (($cod==$this->qry->data["cod"])?" SELECTED>" : ">");
				$opcoes .= htmlentities($this->qry->data["nome"])." </option>\n";
				$this->qry->proximo();
			}
		}
		return $opcoes;
	}
		 
                function getCidade($cod) {

			$sql = "SELECT * FROM cidades WHERE ";
			$sql.= "cod=" . $cod;
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if(!$qry->res OR $qry->nrw<0)
				return false;
		
			return $qry->data["nome"];
		}
		
                		
		function getEstado($cod) {

			$sql = "SELECT * FROM estados WHERE ";
			$sql.= "cod=" . $cod;

			$qry = new consulta($this->bd);
			$qry->executa($sql);

			if(!$qry->res OR $qry->nrw<0)
				return false;

			return $qry->data["nome"];

		}
		
		
		function busca() {
			if($this->user_id==0 OR empty($this->user_id))
				return false;
			$sql = "SELECT * FROM usuarios WHERE ";
			$sql.= "user_id=" . $this->user_id;
			
			$qry = new consulta($this->bd);
			$qry->executa($sql);
			
			if(!$qry->res OR $qry->nrw<0)
				return false;
			
			$this->nome = $qry->data["nome"];
			$this->endereco = $qry->data["endereco"];
			$this->numero = $qry->data["numero"];
			$this->bairro = $qry->data["bairro"];
			$this->cep = $qry->data["cep"];
			$this->cidade = $qry->data["cidade"];
			$this->estado = $qry->data["estado"];
			$this->pais = $qry->data["pais"];
			$this->telefone = $qry->data["telefone"];
			$this->celular = $qry->data["celular"];
			$this->dddc = $qry->data["dddc"];
			$this->email = $qry->data["email"];
			$this->sexo = $qry->data["sexo"];
			if(isset($qry->data["complemento"]))
			$this->complemento = $qry->data["complemento"];
			$this->identidade = $qry->data["identidade"];
			$this->cpf = $qry->data["cpf"];
			$this->cnpj = $qry->data["cnpj"];
			$this->site = $qry->data["site"];
			$this->tipoconta = $qry->data["tipoconta"];
			//$this->ie = $qry->data["IE"];
			$this->publicidade = $qry->data["publicidade"];
			$this->newsletter = $qry->data["newsletter"];
			$this->ddd = $qry->data["ddd"];
			$this->origem = $qry->data["origem"];
			//$this->promos = $qry->data["promos"];
            $this->datanasc = date("d/m/Y",strtotime($qry->data["datanasc"]));
		
			return true;
		}
		
		
		function login($login,$senha) {
			$this->senha->login = $login;
			$erro = "OK";
			if(!$this->senha->busca("l")) 
				$erro = "Usuario nao cadastrado";
			elseif($this->senha->senha!=$senha)
				$erro = "Senha informada esta incorreta"; 
			elseif($this->senha->tipo==0)
				$erro = "Usuario esta inativo";
			else {
				$this->user_id = $this->senha->user_id;
				if(!$this->busca())
					$erro= "Erro no Cadastro do usuário";
			}
			
			return $erro;
		}
		
		function recupera_senha() {
		   global $nomesite;
			if(!empty($this->email)) {
				$sql = "SELECT user_id FROM usuarios WHERE ";
				$sql.= "email = '" . $this->email . "'";
				$this->qry->executa($sql);
				if(!$this->qry->res OR $this->qry->nrw<=0)
					return "E-mail informado nao existe";
				$this->user_id = $this->qry->data[0];
				$this->senha->user_id = $this->user_id;
				$chave = "u";
			}
			else
				$chave = "l";
			
			if(!$this->senha->busca($chave))
				$erro = "Usuario nao existe no nosso Banco de Dados!";
			else {
				$this->user_id = $this->senha->user_id;
				if(!$this->busca())
					$erro = "Erro no Cadastro de usuários!!";
				else {
					$assunto = $nomesite." - Seu cadastro no site";
					$mensagem = "Prezado(a) " . $this->nome . ",\n\n";
					$mensagem.= "Conforme sua solicitação segue abaixo sua ";
					$mensagem.= "senha em nosso site:\n\n";
					$mensagem.= "Login: " . $this->senha->login . "\n";
					$mensagem.= "Senha: " . $this->senha->senha . "\n\n";
					$mensagem.= "Obrigado por utilizar nosso site\n\n";
					$mensagem.= "Equipe ".$nomesite;
					
					$this->e_mail($assunto,$mensagem);
					
					$erro = "OK";
				}
			}
			
			return $erro;
		}
		
	}
	
	
//-------------------------------------------------------------------------------------------

	// Classe senha 
	
	class senha {
	
		var $user_id;
		var $login;
		var $senha;
		var $data;
		var $senhaanterior;
		var $tipo;
		var $ativo;
		var $bd;
		var $qry;
		
		function senha($bd) {
			$this->user_id = 0;
			$this->login = "";
			$this->senha = "";
			$this->data = "";
			$this->senhaanterior = "";
			$this->tipo = 0;
			$this->ativo = 0;
			$this->bd = $bd;
			$this->qry = new consulta($bd);
		}
		
		function incluir() {
			if($this->busca("l")) 
				return false; // Existe um usuário com o login informado
			
			if($this->user_id=="" OR $this->login=="")
				return false;
		
			$matriz = "abcdefghijklmnopqrztuvwxyz";
			$matriz.= "0123456789";
			$matriz.= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			
			srand((double)microtime()*1000000);
  			$senha='';
			
			for($i=0;$i<8;$i++)
				$senha.= substr($matriz,round(rand(0,strlen($matriz)-1)),1);
			$this->senha = $senha;

			$sql = "INSERT INTO senhas VALUES(";
			$sql.= $this->user_id . ",";
			$sql.= "'" . $this->login . "',";
			$sql.= "'" . $this->senha . "',";
			$sql.= time() . ",";
			$sql.= "'',";
			$sql.= $this->tipo . ",";
			$sql.= "1";  // Ativo
			$sql.= ")";
			
			$this->qry->executa($sql);
			
			return $this->qry->res;
			
  		}
	
		function alterar($senha,$senha_nova) {
			if($this->validar($senha)) {
				$sql = "UPDATE senhas SET";
				$sql.= " senhaanterior = '" . $senha . "',";
				$sql.= " senha = '" . $senha_nova . "',";
				$sql.= " data = " . time();
				$sql.= " WHERE user_id = " . $this->user_id;
				$this->qry->executa($sql);
				return $this->qry->res;
			}
			else
				return false;
		}
		
		function excluir() {
			if($this->tipo==1) { 
				// Admin
				$sql = "DELETE FROM senhas WHERE user_id = " . $this->user_id;
				$this->qry->executa($sql);
				return $this->qry->res;
			}
			else 
				return $this->desativar();
			
		}
		
		function validar($senha) {
			if($this->busca("u"))
				if($this->senha==$senha)
					return true;
			return false;
		} 
		
		function desativar() {			
				$sql = "UPDATE senhas SET ativo = 0 WHERE user_id = " . $this->user_id;	
				$this->qry->executa($sql);
				return $this->qry->res;
		}
		
		function ativar() {
				$sql = "UPDATE senhas SET ativo = 1 WHERE user_id = " . $this->user_id;	
				$this->qry->executa($sql);
				return $this->qry->res;
		}
		
		function busca($chave="l") {
			$sql = "SELECT * FROM senhas WHERE " . (($chave=="u") ? "user_id = " . $this->user_id : "login = '" . $this->login . "'");
			$this->qry->executa($sql);
			if($this->qry->nrw==1) {
				$this->user_id = $this->qry->data["user_id"];
				$this->login = $this->qry->data["login"];
				$this->senha = $this->qry->data["senha"];
				$this->tipo = $this->qry->data["tipo"];
				$this->ativo = $this->qry->data["ativo"];
				return true;
			}
			return false;
		}
		
	}

	class banco{
	
		var $conta_cedente;
		var $conta_cedente_dv;
		var $user_id;
		
		var $bd;
		var $qry;

		
		function banco($bd) {
			$this->bd = $bd;
			$this->qry = new consulta($bd);
			$this->user_id = 0;
			$this->conta_cedente = "";
			$this->conta_cedente_dv = "";
			
		}

	}


?>
