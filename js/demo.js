// JavaScript Document
// valida numero inteiros ou não
function valida_numero(numero,inteiro) {
	numero = new String(numero);

	if(numero.length==0)
		return false;

	var exp = /^\$|\./g ;

	// retira $ e .
	numero = numero.replace(exp, "");

	exp = /,/g ;

	// troca , por .
	numero = numero.replace(exp,".");

	numero = parseFloat(numero);

	if(isNaN(numero))
		return false;

	if(inteiro && numero!=Math.round(numero))
		return false;

	return true;

}

// verifica se um ano é bissexto
function ano_bi(ano) {
	if (ano % 100 == 0) {
		if (ano % 400 == 0)
			return true;
	}
	else
		if ((ano % 4) == 0)
			return true;
	return false;
}


// Valida uma data
function valida_data(data) {
	var datePat = /^(\d{1,2})(\/|-|.)(\d{1,2})\2(\d{4})$/;

	var datadiv = data.match(datePat);

   	if (datadiv==null)
		return false;

	var dia = datadiv[1];
	var mes = datadiv[3];
	var ano = datadiv[4];

	if(dia<1 || dia>31 || mes<1 || mes>12 || ano < 2001)
		return false;

	if ((mes==4 || mes==6 || mes==9 || mes==11) && dia>30)
		return false;

	if(mes==2)
		if(dia>29)
			return false;
		else
			if(dia==29 && !ano_bi(ano))
				return false;

	return true;

}

// valida CEP
function valida_cep(cep) {
	if(cep.length>9 || (cep.indexOf("-")==-1 && cep.length>8))
		return false;

	var pat = /((\d{5})(-)(\d{3}))|(\d{8})/;

	var cepdiv = cep.match(pat);

	if(cepdiv==null)
		return false;
	return true;
}


// Calculo do CNPJ
function valida_cnpj(cnpj) {
	var erro = true;
	var aux_cnpj = "";
	var cnpj1=0,cnpj2=0;
	for(j=0;j<cnpj.length;j++)
		if(cnpj.substr(j,1)>="0" && cnpj.substr(j,1)<="9")
			aux_cnpj += cnpj.substr(j,1);
	if(aux_cnpj.length!=14)
		erro = false;
	else {
		cnpj1 = aux_cnpj.substr(0,12);
		cnpj2 = aux_cnpj.substr(aux_cnpj.length-2,2);
		fator = "543298765432";
		controle = "";
		for(j=0;j<2;j++) {
			soma = 0;
			for(i=0;i<12;i++)
				soma += cnpj1.substr(i,1) * fator.substr(i,1);
			if(j==1) soma += digito * 2;
			digito = (soma * 10) % 11;
			if(digito==10) digito = 0;
			controle += digito;
			fator = "654329876543";
		}
		if(controle!=cnpj2)
			erro = false;
	}
	return erro;
}

// Validação do CPF
function valida_cpf(cpf) {
	var cpf = new String(cpf);
    var aux_cpf = "";

	if(cpf.length!=11)
		return false;

    for(j=0;j<cpf.length;j++)
  		if(cpf.substr(j,1)>="0" && cpf.substr(j,1)<="9")
   			aux_cpf += cpf.substr(j,1);
	if(aux_cpf.length!=11)
		return false;
    else {
    	var cpf1 = String(aux_cpf);
    	var cpf2 = cpf.substr(cpf.length-2,2);
      	var controle = "";
      	var start = 2;
      	var end = 10;
      	for(var i=1;i<=2;i++) {
      		var soma = 0;
      		for(j=start;j<=end;j++)
      			soma += cpf1.substr((j-i-1),1)*(end+1+i-j);
        	if(i==2)
          		soma += digito * 2;
        	digito = (soma * 10) % 11;
        	if(digito==10)
          		digito = 0;
        	controle += digito;
        	start = 3;
        	end = 11;
      	}
      	if(controle!=cpf2)
        	return false;
    }

	return true;
}


// Esta é uma função simples para validar emails
function valida_email(email) {
	var chars = "@#$&[]()/\\\{}!^:'\"";
	var pat=/^(.+)@(.+)$/;

	var emaildiv = email.match(pat);

	if(emaildiv==null)
		return false;

	var login = emaildiv[1];
	var dominio = emaildiv[2];

	for(var i=0;i<chars.length;i++) {
		if(login.indexOf(chars.substr(i,1))!=-1)
			return false;
	}

	for(var i=0;i<chars.length;i++) {
		if(dominio.indexOf(chars.substr(i,1))!=-1)
			return false;
	}

	return true;
}

// Valida uma string em particular (tipo login ou senha)
function valida_string(string) {
	str = new String(string);
	if(str.length<5)
		return false;
	if(str.indexOf(" ")!=-1)
		return false;

	var chars = "@#$&[]()/\\\{}!^:'\"";

	for(var i=0;i<chars.length;i++) {
		if(str.indexOf(chars.substr(i,1))!=-1) {
			return false;
		}
	}

	return true;

}

// Valida o numero do Cartão de crédito
function valida_cartao(numero) {
	var str = new String(numero);

	if(str.length==0)
		return false;

	var peso = (str.length%2==0) ? 2 : 1;
	var soma = 0;

	for(var i=0;i<str.length;i++) {
		num = str.substr(i,1);
		vlr = num*peso;
		soma+= (vlr>9) ? vlr-9 : vlr;
		peso = (peso==2) ? 1 : 2;
	}

	return (soma%10==0 && soma!=0);
}

// Valida a Data de validade do cartão (mm/aa)
function valida_dtvalidade(data) {
	var datePat = /^(\d{1,2})(\/|-|.)(\d{1,2})$/;
	var dtdiv = data.match(datePat);

	if(dtdiv==null)
		return false;

	var dia = 31;
	var mes = parseInt(dtdiv[1]);
	var ano = parseInt(dtdiv[3]);

	if(mes<1 || mes>12 || ano<01)
		return false;

	var data = new Date();
	var mes_at = data.getMonth();
	var ano_at = data.getYear();
	mes_at++;
	ano+=2000;

	var anomes = ano*100+mes;
	var anomes_at = ano_at*100+mes_at;

	if(anomes<anomes_at)
		return false;

	return true;
}

function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if(((tecla > 47) && (tecla < 58))) return true;
    else{
    if (tecla != 8) return false;
    else return true;
    }
}

function retira_car(numero) {

	var exp = /^\$|\./g ;

	numero = numero.replace(exp, "");

	return numero;

}


//-----------------------------------------

//var SITE = "http://"+window.location.host+"/devgus";
var SITE = "http://"+window.location.host+"/paymein/public_html/devgus";



$(document).ready(function(){
	
	$('.btnLimpar').click(function(){
		$('#contato')[0].reset();
	});
	
	$('.imovelUl li img').click(function(){
		
		var imgGd = $(this).attr('title');
		
		$('.imagem_imovel').html('<img src="../arquivos/imoveis/'+imgGd+'" width="349" height="251" alt="" />')
		
	});
/*
        	 $("#cpf").mask("999.999.999-99");
		 $("#datanasc").mask("99/99/9999");
                 $("#cep").mask("99999-999");
                 
                   $("#rg").mask("*********");
  */                 
	
	$('#contato').submit(function(event){
		
		
			var dados = $('#contato').serialize();
			
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=contato&" + dados,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					// Preenche a tabela com os dados
					$('.retornoContato').html(valor);
					return true;
				}
			});
		
		
		return false;
	});

        $('#fgeral').submit(function(event){
    //  $('#salvargeral').click(function(event){


			var dados = $('#fgeral').serialize();
//alert(dados);
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=salvargeral&" + dados,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});
	
		$('#geral').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);
			
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=geral&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					
					
					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});
		
		
		return false;
	});

        $('#endereco').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);

			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=endereco&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){


					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});

        $('#contato').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);

			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=contato&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){


					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});

        $('#senha').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);

			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=senha&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){


					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});

        $('#preferencias').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);

			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=preferencias&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){


					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});

        $('#IPN').click(function(event){
			//var dados = $(this).attr('title');
			var pin=$('#pin').val();
			var uid=$('#uid').val();
			//alert(pin);

			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=geral&pin=" + pin+"&uid="+uid ,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){


					// Preenche a tabela com os dados
					$('#alterar').html(valor);
					return true;
				}
			});


		return false;
	});


	
	$('.idPacote').click(function(event){
		
		
			var dados = $(this).attr('title');
			
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=pacote&val=" + dados,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					// Preenche a tabela com os dados
					$('.retornoPacote').html(valor);
					return true;
				}
			});
		
		
		return false;
	});
	
	$('.videoThumb img').click(function(){
		
		var video = $(this).attr('title');
		
		$('.vidPrincipal').html('<iframe title="YouTube video player" class="youtube-player" type="text/html" width="330" height="201" src="http://www.youtube.com/embed/'+video+'" frameborder="0"></iframe>')
	});
	$('#fone').keypress(function(e){
	  if ((e.which>=48 && e.which<=57) || e.which==8 || e.which==0) {
		return true;
	  } else {
		$('.retornoContato').html('Somente Números');
		return false;
	  }
	});
	/*
	$("ul.tabs").tabs("div.panes > div");
	$("ul.tabs2").tabs("div.panes2 > div");
	
	$('#pubSel').change(function(){
		var sel = $('#pubSel').val();
		
			$('.selecao1').fadeOut('slow');
			$('.selecao2').fadeOut('slow');
			$('.selecao3').fadeOut('slow');
			$('.selecao4').fadeOut('slow');
			$('.selecao5').fadeOut('slow');
			$('.selecao6').fadeOut('slow');
			
		if(sel == '1')
		{
			$('.selecao1').fadeIn('slow');
			$('.tabs2 .li1').click();
		}
		else if(sel == '2')
		{
			$('.selecao2').fadeIn('slow');
			$('.tabs2 .li1').click();
		}
		else if(sel == '3')
		{
			$('.selecao3').fadeIn('slow');
			$('.tabs2 .li1').click();
		}
		else if(sel == '4')
		{
			$('.selecao4').fadeIn('slow');
			$('.tabs2 .li1').click();
		}
		else if(sel == '5')
		{
			$('.selecao5').fadeIn('slow');
			$('.tabs2 .li2').click();
		}
		else if(sel == '6')
		{
			$('.selecao6').fadeIn('slow');
			$('.tabs2 .li2').click();
		}
	});
	*/
	
	$('.av1').click(function(){
		var tipo = $('input:radio[name=tipoCad]:checked').val();
		if(tipo == 2 || tipo == 3 || tipo == 4){
			$('#passo2').click();
			$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
			$('#passo2').css('background-position','0 0')
			$('.retornoCadastro').html('');
			if(tipo == 2)
			{
				$('.documento').html('CREC:');
			}
			else{
				$('.documento').html('CPF:');
			}
		}
		else{
			$('.retornoCadastro').html('Escolha um tipo');
		}
	});
	$('.av2').click(function(){
		var usu = $('.nomeUsu').val();
		var senha = $('.senhaUsu').val();
		var senha2 = $('.senha2Usu').val();
		var email = $('.emailUsu').val();
		
		if(senha != senha2){
			$('.retornoCadastro').html('Senhas incorretas');
		}
		else if(usu != "" && senha != "" && senha2 != "" && email != ""){
			$('#passo3').click();
			$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
			$('#passo3').css('background-position','0 0')
			$('.retornoCadastro').html('');
		}
		else{
			$('.retornoCadastro').html('Preencha todos os campos');
		}
	});
	$('.av3').click(function(){
		var nome = $('.nomeCompUsu').val();
		var fone1 = $('.foneUsu').val();
		var documento = $('.documento2').val();
		if(nome != "" && fone1 != "" && documento != ""){
			$('#passo4').click();
			$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
			$('#passo4').css('background-position','0 0')
			$('.retornoCadastro').html('');
		}
		else{
			$('.retornoCadastro').html('Preencha o campo Nome, Telefone e CPF');
		}
	});
	$('.vol1').click(function(){
		$('#passo1').click();
		$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
		$('#passo1').css('background-position','0 0')
		$('.retornoCadastro').html('');
	});
	$('.vol2').click(function(){
		$('#passo2').click();
		$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
		$('#passo2').css('background-position','0 0')
		$('.retornoCadastro').html('');
	});
	$('.vol3').click(function(){
		$('#passo3').click();
		$('#passo1, #passo2, #passo3, #passo4').css('background-position','0 51px')
		$('#passo3').css('background-position','0 0')
		$('.retornoCadastro').html('');
		$('#enviarCadastro').fadeOut('slow');
	});
	$('.aceitoSim').click(function(){
		$('#enviarCadastro').fadeIn('slow');
	});
	/*
	$('#cadastro1').submit(function(event){
		
		
			var dados = $('#cadastro1').serialize();
			
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=cadastro&" + dados,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					// Preenche a tabela com os dados
					$('.retornoCadastro').html(valor);
					return true;
				}
			});
		
		
		return false;
	});
	$('.foneUsu, .fone2Usu, .celUsu, .documento').keypress(function(e){
	  if ((e.which>=48 && e.which<=57) || e.which==8 || e.which==0) {
		return true;
	  } else {
		$('.retornoContato').html('Somente Números');
		return false;
	  }
	});
	
	
	
		var triggers = $(".overlay").overlay({
	
		// some mask tweaks suitable for modal dialogs
		mask: {
			color: '#000',
			opacity: 0.8
		},	
		closeOnClick: true
	});
	*/

	 
/*	 $('#usuario').focusout(function(event){
            var dados = $('#usuario').val();
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=usuario2&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",
                success: function(valor){
                    // Preenche a tabela com os dados
					$('.retornoCadastro').html(valor);
					
					return true;
                }
            });
        return false;
    });
	
	$('.senha2Usu').focusout(function(){
		var s1 = $('.senhaUsu').val();
		var s2 = $('.senha2Usu').val();
		
		if(s1 != s2)		
		{
			$('.retornoCadastro').fadeIn('slow');
			$('.retornoCadastro').html("Confirmação de senha deve ser igual a senha.");
			$('.retornoCadastro').delay(3000).fadeOut('slow');
			$('.senhaUsu').val("");
			$('.senha2Usu').val("");
			$('.senhaUsu').focus();
		}
	});
	$('.emailUsu').focusout(function(){
		 var dados = $('.emailUsu').val();
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=email&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",
                success: function(valor){
                    // Preenche a tabela com os dados
					$('.retornoCadastro').html(valor);
					
					return true;
                }
            });
        return false;
	});*/
	
<!-- INICIO - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba COMPRAS -->
	$('.cidades').change(function(){
		 var dados = $('.cidades').val();
               
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=cidades&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",

                success: function(valor){
                    // Preenche a tabela com os dados
					$('#retornoCidades').html(valor);
					
					return false;
                }
            });
        return false;
	});
	
		$('.cidadesr').change(function(){
		 var dados = $('.cidadesr').val();
             
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=cidadesr&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",

                success: function(valor){
                    // Preenche a tabela com os dados
					$('#retornoCidadesr').html(valor);
					
					return true;
                }
            });
        return false;
	});
<!-- FIM - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba COMPRAS -->

<!-- INICIO - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba LOCACAO -->
	$('.cidades_locacao').change(function(){
		 var dados = $('.cidades_locacao').val();
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=cidades_locacao&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",
                success: function(valor){
                    // Preenche a tabela com os dados
					$('#retornoCidades_locacao').html(valor);
					
					return true;
                }
            });
        return false;
	});
<!-- FIM - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba LOCACAO -->	


<!-- INICIO - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba TROCA -->
	$('.cidades_troca').change(function(){
		 var dados = $('.cidades_troca').val();
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=cidades_troca&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",
                success: function(valor){
                    // Preenche a tabela com os dados
					$('#retornoCidades_troca').html(valor);
					
					return true;
                }
            });
        return false;
	});
<!-- FIM - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba TROCA -->

<!-- INICIO - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba TROCA -->
	$('.cidades_temporada').change(function(){
		 var dados = $('.cidades_temporada').val();
            $.ajax({
                header: {
                    "Content-Type": "text/html;  charset=ISO-8859-1"
                },
                type: "get",
                data: "acao=cidades_temporada&val=" + dados,
                url: SITE + "/ajax.php",
                dataType: "html",
                success: function(valor){
                    // Preenche a tabela com os dados
					$('#retornoCidades_temporada').html(valor);
					
					return true;
                }
            });
        return false;
	});
<!-- FIM - Ligacao entre o AJAX e o TPL para consulta da cidade conforme estado na aba TROCA -->


	$('#compra').submit(function(event){
				
			var dados = $('#compra').serialize();
			
			$.ajax({
				header: {
					"Content-Type": "text/html;  charset=ISO-8859-1"
				},
				type: "get",
				data: "acao=compra&" + dados,
				url: SITE + "/ajax.php",
				dataType: "html",
				success: function(valor){
					// Preenche a tabela com os dados
					$('.retornoBusca2').html(valor);
					return true;
				}
			});
		
		
		return false;
	});
		
	 
});