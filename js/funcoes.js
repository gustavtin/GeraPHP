//////////////////// ATUALIZA AS DIVIS ////////////////////
function goValor(pag,div){
	$.ajax({
		type: "GET",
		url: pag,
		success: function(texto){
			
			$("#"+div).val(texto); 
			
		}
	});
}

function goPage(pag,div){

	$.ajax({
		type: "GET",
		url: pag,
		success: function(texto){
			$("#"+div).html(texto);
		}
	});
}


function excluirDado(pag,div){
	
	if(confirm('Deseja Excluir?')){
	
		goPage(pag,div)
	
	}
}

//////////////////// TABLES SORT ////////////////////
function Numero(e)
{
  navegador = /msie/i.test(navigator.userAgent);
  if (navegador)
   var tecla = event.keyCode;
  else
   var tecla = e.which;
  
  if(tecla > 47 && tecla < 58) // numeros de 0 a 9
    return true;
  else
    {
      if (tecla != 8) // backspace
        return false;
      else
        return true;
    }
}


//////////////////// AJAX COMBOBOX ////////////////////

//CRIA A VARIÁVEL RETORNO
var retorno;
function CarregaArquivo(url,valor)
{
    retorno = null;
	//CRIA O OBJETO HttpRequest PARA O RESPECTIVO NAVEGADOR
	//Mozilla Fire Fox / Safari ...
	//
    if (window.XMLHttpRequest) {
        retorno = new XMLHttpRequest();
		//SETA A FUNÇÃO QUE SERÁ CHAMADA QUANDO O AJAX DER UM RETORNO
        retorno.onreadystatechange = processReqChange;
		 //ABRE A REQUISIÇÃO AJAX, PASSANDO O MÉTODO DE ACESSO, URL E O PARÂMETRO
        retorno.open("GET", url+'?id='+valor, true);
		//INICIA O TRANSPORTA DOS OBJETOS NA REQUISIÇÃO
        retorno.send(null);
    } else if (window.ActiveXObject) {
		//
		//IE
		//
        retorno = new ActiveXObject("Microsoft.XMLHTTP");
        if (retorno) {
			//SETA A FUNÇÃO QUE SERÁ CHAMADA QUANDO O AJAX DER  UM RETORNO
            retorno.onreadystatechange = processReqChange;
		    //ABRE A REQUISIÇÃO AJAX, PASSANDO O MÉTODO DE ACESSO, URL E O PARÂMETRO
            retorno.open("GET", url+'?id='+valor, true);
			//INICIA O TRANSPORTA DOS OBJETOS NA REQUISIÇÃO
            retorno.send();
        }
    }
}
//FUNÇÃO QUE TRATA O RETORNO DO AJAX
function processReqChange()
{
	//CASO O STATUS DO AJAX SEJA OK, CHAMA A FUNÇÃO mudar()
	//A LISTA COMPLETA DOS VALORES readyState É A SEGUINTE:
	//0 (uninitialized) 
	//1 (a carregar) 
	//2 (carregado) 
	//3 (interactivo) 
	//4 (completo) 
    if (retorno.readyState == 4)
	{
		if(retorno.status == 200)
			{
				//PROCURA PELA DIV MOSTRACOMBO E INSERE O OBJETO
				document.getElementById('mostraCombo').innerHTML = retorno.responseText;
			} 
				else 
				{
					//MOSTRA UM ALERTA AO OBTER UM RETORNO DE OK.
					alert("Houve um problema ao obter os dados:\n" + retorno.statusText);
				}
   }
}

//////////////////// SELECIONAR TODOS ////////////////////

function CheckAll(nome) {
	
	for (var i=0;i<document.formulario.elements.length;i++) {
		var x = document.formulario.elements[i];
		if (x.name == nome) {
			x.checked = document.formulario.selall.checked;
		}
	}
}

//////////////////// EXIBE / ESCONDE DIV ////////////////////

function displayDiv(name) {
	if (document.getElementById(name).style.display=='') {
		document.getElementById(name).style.display='none';
	} else {
		document.getElementById(name).style.display='';
	}
}

//////////////////// EXECUTAR ACAO ////////////////////

function executeAcao(acao, tabela, id_registro, ip) {
	if (confirm('Confirma?')) {
		var head = document.getElementsByTagName('head').item(0);
		var eScript = document.createElement("script");
		if (id_registro)
			eScript.setAttribute('src','includes/acoes.php?acao='+acao+'&tabela='+tabela+'&id_registro='+id_registro+'&ip='+ip);
		head.appendChild(eScript);
	} else {
		return false;
	}
}

//////////////////// BARRAS AUTOMATICAS EM DATA ////////////////////

function formatar(src, mask) {
	var i = src.value.length;
	var saida = mask.substring(0,1);
	var texto = mask.substring(i)
	if (texto.substring(0,1) != saida) {
		src.value += texto.substring(0,1);
	}
}

//////////////////// POP UP ////////////////////

function popupWindow(url, nome, largura, altura) {
  window.open(url,nome,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,width='+largura+',height='+altura+',screenX=20,screenY=20,top=20,left=20')
}

//////////////////// PREÇO FORMATADO ////////////////////

function Limpar(valor, validos) {
	var result = "";
	var aux;
	for (var i=0; i < valor.length; i++) {
		aux = validos.indexOf(valor.substring(i, i+1));
		if (aux>=0) {
			result += aux;
		}
	}
	return result;
}




function Formata(campo,tammax,teclapres,decimal) {
	var tecla = teclapres.keyCode;
	vr = Limpar(campo.value,"0123456789");
	tam = vr.length;
	dec=decimal

	if (tam < tammax && tecla != 8) { tam = vr.length + 1 ; }

	if (tecla == 8 ) {
		tam = tam - 1 ;
	}

	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ) {
		if ( tam <= dec ) {
			campo.value = vr ;
		}

	if ( (tam > dec) && (tam <= 5) ) {
		campo.value = vr.substr( 0, tam - 2 ) + "," + vr.substr( tam - dec, tam ) ;
	}
	if ( (tam >= 6) && (tam <= 8) ) {
		campo.value = vr.substr( 0, tam - 5 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ;
	}
	if ( (tam >= 9) && (tam <= 11) ) {
		campo.value = vr.substr( 0, tam - 8 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ;
	}
	if ( (tam >= 12) && (tam <= 14) ) {
		campo.value = vr.substr( 0, tam - 11 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ) ;
	}
	if ( (tam >= 15) && (tam <= 17) ) {
		campo.value = vr.substr( 0, tam - 14 ) + "." + vr.substr( tam - 14, 3 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - 2, tam ) ;}
	}
}


/*
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
							FUNÇÃO DE FORMATAR VALOR EM REAIS
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
*/


function FormataPeso(campo,tammax,teclapres) {
	var tecla = teclapres.keyCode;
	
	if(document.all) {tecla=event.keyCode;} else {tecla=teclapres.which;} 
	if (tecla > 57)
	{
		//tecla=0;tecla < 48 || 
		campo.focus(); 
		return false;
	}
	vr = new String(campo.value);
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;

	if(tam < tammax && tecla != 8){
		tam = vr.length + 1;
	}

	if(tecla == 8 ){
		tam = tam - 1;
	}
	if(tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if(tam <= 3 ){ 
			campo.value = vr;
		}
		if((tam > 3)){
			campo.value = vr.substr( 0, tam - 3 ) + '.' + vr.substr( tam - 3, tam );
		}
	}
}


/*
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
			FUNÇÃO PARA FORMATAÇÃO DE MASCARA DO CAMPO DO JEITO QUE COLOCAR
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
*/

function txtBoxFormat(objeto, sMask, evtKeyPress) {
var i, nCount, sValue, fldLen, mskLen,bolMask, sCod, nTecla;
if(document.all) { // Internet Explorer
nTecla = evtKeyPress.keyCode; }
else if(document.layers) { // Nestcape
nTecla = evtKeyPress.which;
}else{
nTecla = evtKeyPress.which;
}
sValue = objeto.value;
// Limpa todos os caracteres de formatação que
// já estiverem no campo.
sValue = sValue.toString().replace( "-", "" );
sValue = sValue.toString().replace( "-", "" );
sValue = sValue.toString().replace( ".", "" );
sValue = sValue.toString().replace( ".", "" );
sValue = sValue.toString().replace( "/", "" );
sValue = sValue.toString().replace( "/", "" );
sValue = sValue.toString().replace( ":", "" );
sValue = sValue.toString().replace( ":", "" );
sValue = sValue.toString().replace( "(", "" );
sValue = sValue.toString().replace( "(", "" );
sValue = sValue.toString().replace( ")", "" );
sValue = sValue.toString().replace( ")", "" );
sValue = sValue.toString().replace( " ", "" );
sValue = sValue.toString().replace( " ", "" );
fldLen = sValue.length;
mskLen = sMask.length;
i = 0;
nCount = 0;
sCod = "";
mskLen = fldLen;
if (nTecla != 8) { // backspace
while (i <= mskLen) {
bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))
if (bolMask) {
sCod += sMask.charAt(i);
mskLen++; }
else {
sCod += sValue.charAt(nCount);
nCount++;
}
i++;
}
objeto.value = sCod;
if (sMask.charAt(i-1) == "9") { // apenas números...
return ((nTecla > 47) && (nTecla < 58)); } // números de 0 a 9
else { // qualquer caracter...
return true;
} }
else {
return true;
}
}



// Função única que fará a transação  
function getEndereco(fpaginarodar, fidrodar) {  
	 // Se o campo CEP não estiver vazio  
	 if($.trim($("#fcep").val()) != ""){  
		 /* 
                Para conectar no serviço e executar o json, precisamos usar a função 
                getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros 
                dataTypes não possibilitam esta interação entre domínios diferentes 
                 Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário 
                 http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#fcep").val() 
				 
				 http://republicavirtual.com.br/web_cep.php?cep=
             */  
		 $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#fcep").val(), function(){  
			 // o getScript dá um eval no script, então é só ler!  
			 //Se o resultado for igual a 1  
			 if(resultadoCEP["resultado"]){  
				 // troca o valor dos elementos  
				 $("#fendereco").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));  
				 $("#fbairro").val(unescape(resultadoCEP["bairro"]));  
				 $("#fcidade").val(unescape(resultadoCEP["cidade"]));  
				 $("#festado").val(unescape(resultadoCEP["uf"]));  
				 
				 goPage(fpaginarodar+'?idUF='+resultadoCEP["uf"]+'&idMunicipio='+resultadoCEP["cidade"], fidrodar)
				 
			 }else{  
				 alert("Endereço não encontrado");  
			 }  
		 });  
	 }  
}




/*// Função única que fará a transação  
function getEndereco() {  
	 // Se o campo CEP não estiver vazio  
	 if($.trim($("#fcep").val()) != ""){  
		 
                Para conectar no serviço e executar o json, precisamos usar a função 
                getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros 
                dataTypes não possibilitam esta interação entre domínios diferentes 
                 Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário 
                 http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#fcep").val() 
				 
				 http://republicavirtual.com.br/web_cep.php?cep=
               
		 $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#fcep").val(), function(){  
			 // o getScript dá um eval no script, então é só ler!  
			 //Se o resultado for igual a 1  
			 if(resultadoCEP["resultado"]){  
				 // troca o valor dos elementos  
				 $("#fendereco").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));  
				 $("#fbairro").val(unescape(resultadoCEP["bairro"]));  
				 $("#fcidade").val(unescape(resultadoCEP["cidade"]));  
				 $("#festado").val(unescape(resultadoCEP["uf"]));  
			 }else{  
				 alert("Endereço não encontrado");  
			 }  
		 });  
	 }  
}
*/