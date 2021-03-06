function somenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if((tecla>47) && (tecla<58)) return true;
    else{
        if((tecla==8) || (tecla==0)) return true;
        else return false;
    }
}

function id_input(id){
    return document.getElementById(id);
}

function borda_input_select(id){
    var input = document.getElementById(id);
    if(input.selectedIndex!=0){
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }else{
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
    }
}

function borda_input_select_nn(id){
    var input = document.getElementById(id);
    if(input.selectedIndex!=0){
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }else{
        input.style.border='';
        input.style.background='';
    }
}

function borda_input_text(id){
    var input = document.getElementById(id);
    if(input.value!=""){
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
    else{
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
    }
}

function borda_input_text_nn(id){
    var input = document.getElementById(id);
    if(input.value==""){
        input.style.border='';
        input.style.background='';
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function teste(id){
    var input = document.getElementById(id);
    alert(input.value);
}

function valida_identidade(id){
    var input = document.getElementById(id);
    var identidade = input.value.replace(".","").replace("-","");
    
    if(identidade == "__________"){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(input.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
        
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_cpf(id) {
    var input = document.getElementById(id);
    cpf = input.value.replace(/[^\d]+/g,'').replace(".","").replace("-","");	
	// Elimina CPFs invalidos conhecidos	
        if(cpf == ''){
            input.style.border='2px solid red';
            input.style.background='rgba(255,0,0,0.2)';
            input.focus();
            return false;
        }
        if(cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" ||
            cpf == "33333333333" ||	cpf == "44444444444" || cpf == "55555555555" || 
            cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || 
            cpf == "99999999999"){
                alert("CPF Inválido!");
                input.style.border='2px solid red';
                input.style.background='rgba(255,0,0,0.2)';
                input.focus();
                return false;
        }
	// Valida 1o digito	
	add = 0;	
	for (i=0; i < 9; i ++)		
            add += parseInt(cpf.charAt(i)) * (10 - i);	
            rev = 11 - (add % 11);	
            if (rev == 10 || rev == 11)		
                rev = 0;	
            if (rev != parseInt(cpf.charAt(9))){
                alert("CPF Inválido!");
                input.style.border='2px solid red';
                input.style.background='rgba(255,0,0,0.2)';
                input.focus();
                return false;
            }
	// Valida 2o digito	
	add = 0;	
	for (i = 0; i < 10; i ++)		
            add += parseInt(cpf.charAt(i)) * (11 - i);	
	rev = 11 - (add % 11);	
	if (rev == 10 || rev == 11)	
            rev = 0;	
	if (rev != parseInt(cpf.charAt(10))){
            alert("CPF Inválido!");
            input.style.border='2px solid red';
            input.style.background='rgba(255,0,0,0.2)';
            input.focus();
            return false;
        }
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
        return true;
}

function valida_titulo(id){
    var input = document.getElementById(id);
    var titulo = input.value.replace(" ","").replace(" ","");
    
    if(titulo == '____________'){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(input.value!="" && titulo == '000000000000' ||titulo == '111111111111' || 
       titulo == '222222222222' || titulo == '333333333333' || titulo == '444444444444' || titulo == '555555555555' ||
       titulo == '666666666666' || titulo == '777777777777' || titulo == '888888888888' || titulo == '999999999999'){
       
        alert("Número de Titulo Eleitoral Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
        
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_preccp(id){
    var input = document.getElementById(id);
    var preccp = input.value.replace(".","").replace("-","");
    if(preccp == ''){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(document.formAtualizacao.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
        
    }
    else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_cnh_num(id){
    var input = document.getElementById(id);
    var cnhNum = input.value.replace(".","").replace("-","");
    if(cnhNum == ''){
        input.style.border='';
        input.style.background='';
        input.focus();
    }
    else if(document.formAtualizacao.txtCnhNum.value!="" && cnhNum == '00000000000' || cnhNum == '11111111111' || 
            cnhNum == '22222222222' || cnhNum == '33333333333' || cnhNum == '44444444444' || cnhNum == '55555555555' ||
            cnhNum == '66666666666' || cnhNum == '77777777777' || cnhNum == '88888888888' || cnhNum == '99999999999'){
        alert("Número da CNH Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();  
    }
    else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_dataNascMil(id){
    var input = document.getElementById(id);
    var anoNasc = input.value.substring(0,4);
    var mesNasc = input.value.substring(5,7);
    var diaNasc = input.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual == mesNasc && dataAtual.getDate() < diaNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual < mesNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() < anoNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else if((dataAtual.getFullYear()-anoNasc) < 18){
        alert("O Militar deve ter uma idade mínima de 18 anos!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_dataNasc(id){
    var input = document.getElementById(id);
    var anoNasc = input.value.substring(0,4);
    var mesNasc = input.value.substring(5,7);
    var diaNasc = input.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual == mesNasc && dataAtual.getDate() < diaNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual < mesNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() < anoNasc){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_dataPraca(id){
    var input = document.getElementById(id);
    var anoPraca = input.value.substring(0,4);
    var mesPraca = input.value.substring(5,7);
    var diaPraca = input.value.substring(8,10);
    var anoNasc = document.formAtualizacao.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formAtualizacao.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formAtualizacao.txtDataNasc.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(anoPraca == anoNasc && mesPraca == mesNasc && diaPraca < diaNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(anoPraca == anoNasc && mesPraca < mesNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(anoPraca < anoNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_dataValidade(id){
    var input = document.getElementById(id);
    var anoValCnh = input.value.substring(0,4);
    var mesValCnh = input.value.substring(5,7);
    var diaValCnh = input.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoValCnh && mesAtual == mesValCnh && dataAtual.getDate() > diaValCnh){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() == anoValCnh && mesAtual > mesValCnh){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(dataAtual.getFullYear() > anoValCnh){
        alert("Data Inválida!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_cep(id){
    var input = document.getElementById(id);
    var cep = input.value.replace(".","").replace("-","");
    if(cep == '________'){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(cep == '00000000' || cep == '11111111' || cep == '22222222' ||
       cep == '33333333' || cep == '44444444' || cep == '55555555' ||
       cep == '66666666' || cep == '77777777' || cep == '88888888' ||
       cep == '99999999'){
            alert("CEP Inválido!");
            input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();     
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_fone(id){
    var input = document.getElementById(id);
    var fone = input.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(fone == '___________'){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }
    else if(input.value != "" && fone == '00000000000' || fone == '11111111111' ||
            fone == '22222222222' || fone == '33333333333' || fone == '44444444444' || fone == '55555555555' ||
            fone == '66666666666' || fone == '77777777777' || fone == '88888888888' || fone == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
        
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_fone_nn(id){
    var input = document.getElementById(id);
    var fone = input.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(fone == '___________'){
        input.style.border='';
        input.style.background='';
    }
    else if(input.value != "" && fone == '00000000000' || fone == '11111111111' ||
            fone == '22222222222' || fone == '33333333333' || fone == '44444444444' || fone == '55555555555' ||
            fone == '66666666666' || fone == '77777777777' || fone == '88888888888' || fone == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
        
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}

function valida_zona(id){
    var input = document.getElementById(id);
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else if(input.value != "" && input.value.length < 3){
        alert("A Zona é formada por 3 caracteres!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }    
}

function valida_secao(id){
    var input = document.getElementById(id);
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else if(input.value != "" && input.value.length < 4){
        alert("A Seção é formada por 4 caracteres!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }    
}

function valida_senha(id){
    var input = document.getElementById(id);
    if(input.value == ""){
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else if(input.value != "" && input.value.length < 6){
        alert("A senha deve conter no mínimo 6 caracteres!");
        input.style.border='2px solid red';
        input.style.background='rgba(255,0,0,0.2)';
        input.focus();
    }else{
        input.style.border='2px solid green';
        input.style.background='rgba(61,102,14,0.2)';
    }
}


function validacao_att(){
    //Dados Pessoais
    //Divisão/Seção
    if(document.formAtualizacao.txtDivSec.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Divisão/Seção.");
        document.formAtualizacao.txtDivSec.style.border='2px solid red';
        document.formAtualizacao.txtDivSec.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDivSec.focus();
        return false;
    }
    
    //Posto/Graduação
    if(document.formAtualizacao.txtPostGrad.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Posto/Graduação.");
        document.formAtualizacao.txtPostGrad.style.border='2px solid red';
        document.formAtualizacao.txtPostGrad.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtPostGrad.focus();
        return false;
    }
    
    //Qas/Qms
    if(document.formAtualizacao.txtQasQms.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Qas/Qms.");
        document.formAtualizacao.txtQasQms.style.border='2px solid red';
        document.formAtualizacao.txtQasQms.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtQasQms.focus();
        return false;
    }
    
    //Nome Completo
    if(document.formAtualizacao.txtNomeComp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome Completo.");
        document.formAtualizacao.txtNomeComp.style.border='2px solid red';
        document.formAtualizacao.txtNomeComp.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNomeComp.focus();
        return false;
    }
    
    //Nome de Guerra
    if(document.formAtualizacao.txtNomeGuerra.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome de Guerra.");
        document.formAtualizacao.txtNomeGuerra.style.border='2px solid red';
        document.formAtualizacao.txtNomeGuerra.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNomeGuerra.focus();
        return false;
    }
    
    //Sexo
    if((document.formAtualizacao.txtSexo[0].checked == false)&&(document.formAtualizacao.txtSexo[1].checked == false)){
        alert("Campo Obrigatório!\nInforme seu Sexo.");
        document.formAtualizacao.txtSexo[0].focus();
        return false;
    }
    
    //Naturalidade Estado Militar
    if(document.formAtualizacao.txtNatEstMilitar.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado de Naturalidade.");
        document.formAtualizacao.txtNatEstMilitar.style.border='2px solid red';
        document.formAtualizacao.txtNatEstMilitar.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNatEstMilitar.focus();
        return false;
    }
    
    //Naturalidade Cidade Militar
    if(document.formAtualizacao.txtNatCidMilitar.value==""){
        alert("Campo Obrigatório!\nDigite a sua Cidade de Naturalidade.");
        document.formAtualizacao.txtNatCidMilitar.style.border='2px solid red';
        document.formAtualizacao.txtNatCidMilitar.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNatCidMilitar.focus();
        return false;
    }
    
    //Estado Cívil
    if(document.formAtualizacao.txtEstCivil.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado Cívil.");
        document.formAtualizacao.txtEstCivil.style.border='2px solid red';
        document.formAtualizacao.txtEstCivil.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtEstCivil.focus();
        return false;
    }
    
    //Data Nascimento
    if(document.formAtualizacao.txtDataNasc.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data de Nascimento.");
        document.formAtualizacao.txtDataNasc.style.border='2px solid red';
        document.formAtualizacao.txtDataNasc.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataNasc.focus();
        document.formAtualizacao.txtDataNasc.focus();
        return false;
    }
    var anoNasc = document.formAtualizacao.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formAtualizacao.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formAtualizacao.txtDataNasc.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formAtualizacao.txtDataNasc.value == ""){
        document.formAtualizacao.txtDataNasc.style.border='2px solid red';
        document.formAtualizacao.txtDataNasc.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual == mesNasc && dataAtual.getDate() < diaNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='2px solid red';
        document.formAtualizacao.txtDataNasc.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual < mesNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='2px solid red';
        document.formAtualizacao.txtDataNasc.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() < anoNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='2px solid red';
        document.formAtualizacao.txtDataNasc.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else{
        document.formAtualizacao.txtDataNasc.style.border='2px solid green';
        document.formAtualizacao.txtDataNasc.style.background='rgba(61,102,14,0.2)';
    }
    
    //Data de Praça
    if(document.formAtualizacao.txtDataPraca.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data Praça.");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }   
    var anoPraca = document.formAtualizacao.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formAtualizacao.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formAtualizacao.txtDataPraca.value.substring(8,10);
    var anoNasc = document.formAtualizacao.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formAtualizacao.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formAtualizacao.txtDataNasc.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formAtualizacao.txtDataPraca.value == ""){
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(anoPraca == anoNasc && mesPraca == mesNasc && diaPraca < diaNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(anoPraca == anoNasc && mesPraca < mesNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(anoPraca < anoNasc){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='2px solid red';
        document.formAtualizacao.txtDataPraca.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else{
        document.formAtualizacao.txtDataPraca.style.border='2px solid green';
        document.formAtualizacao.txtDataPraca.style.background='rgba(61,102,14,0.2)';
    }
    
    //Identidade
    if(document.formAtualizacao.txtIdentidade.value==""){
        alert("Campo Obrigatório!\nDigite a sua Identidade.");
        document.formAtualizacao.txtIdentidade.style.border='2px solid red';
        document.formAtualizacao.txtIdentidade.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtIdentidade.focus();
        return false;
    }
    var identidade = document.formAtualizacao.txtIdentidade.value.replace(".","").replace("-","");

    if(document.formAtualizacao.txtIdentidade.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        document.formAtualizacao.txtIdentidade.style.border='2px solid red';
        document.formAtualizacao.txtIdentidade.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtIdentidade.focus();
        return false;
    }
    
    //Cpf
    if(document.formAtualizacao.txtCpf.value==""){
        alert("Campo Obrigatório!\nDigite o seu CPF.");
        document.formAtualizacao.txtCpf.style.border='2px solid red';
        document.formAtualizacao.txtCpf.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtCpf.focus();
        return false;
    }else{
        cpf = document.formAtualizacao.txtCpf.value.replace(/[^\d]+/g,'').replace(".","").replace("-","");	
	// Elimina CPFs invalidos conhecidos	
        
        if(cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" ||
            cpf == "33333333333" ||	cpf == "44444444444" || cpf == "55555555555" || 
            cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || 
            cpf == "99999999999"){
                alert("CPF Inválido!");
                document.formAtualizacao.txtCpf.style.border='2px solid red';
                document.formAtualizacao.txCpf.style.background='rgba(255,0,0,0.2)';
                document.formAtualizacao.txtCpf.focus();
                return false;
        }
	// Valida 1o digito	
	add = 0;	
	for (i=0; i < 9; i ++)		
            add += parseInt(cpf.charAt(i)) * (10 - i);	
            rev = 11 - (add % 11);	
            if (rev == 10 || rev == 11)		
                rev = 0;	
            if (rev != parseInt(cpf.charAt(9))){
                alert("CPF Inválido!");
                document.formAtualizacao.txtCpf.style.border='2px solid red';
                document.formAtualizacao.txCpf.style.background='rgba(255,0,0,0.2)';
                document.formAtualizacao.txtCpf.focus();
                return false;
            }
	// Valida 2o digito	
	add = 0;	
	for (i = 0; i < 10; i ++)		
            add += parseInt(cpf.charAt(i)) * (11 - i);	
	rev = 11 - (add % 11);	
	if (rev == 10 || rev == 11)	
            rev = 0;	
	if (rev != parseInt(cpf.charAt(10))){
            alert("CPF Inválido!");
            document.formAtualizacao.txtCpf.style.border='2px solid red';
            document.formAtualizacao.txCpf.style.background='rgba(255,0,0,0.2)';
            document.formAtualizacao.txtCpf.focus();
            return false;
        }
    }
    
    //Titulo Eleitor
    var titulo = document.formAtualizacao.txtTeleitorRegistro.value.replace(" ","").replace(" ","");
    if(document.formAtualizacao.txtTeleitorRegistro.value==""){
        alert("Campo Obrigatório!\nDigite o seu Titulo Eleitor.");
        document.formAtualizacao.txtTeleitorRegistro.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorRegistro.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorRegistro.focus();
        return false;
    }
    else if(document.formAtualizacao.txtTeleitorRegistro.value!="" && titulo == '000000000000' ||titulo == '111111111111' || 
       titulo == '222222222222' || titulo == '333333333333' || titulo == '444444444444' || titulo == '555555555555' ||
       titulo == '666666666666' || titulo == '777777777777' || titulo == '888888888888' || titulo == '999999999999'){
       
        alert("Número de Titulo Eleitoral Inválido!");
        document.formAtualizacao.txtTeleitorRegistro.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorRegistro.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorRegistro.focus();
        return false;
    }
    
    //TeleitorZona
    if(document.formAtualizacao.txtTeleitorZona.value==""){
        alert("Campo Obrigatório!\nDigite a Zona.");
        document.formAtualizacao.txtTeleitorZona.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorZona.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorZona.focus();
        return false;
    }
    else if(document.formAtualizacao.txtTeleitorZona.value.length < 3){
        alert("A TeleitorZona é formada por 3 caracteres!");
        document.formAtualizacao.txtTeleitorZona.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorZona.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorZona.focus();
        return false;
    }
    
    //Seção
     if(document.formAtualizacao.txtTeleitorSecao.value==""){
        alert("Campo Obrigatório!\nDigite a Seção.");
        document.formAtualizacao.txtTeleitorSecao.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorSecao.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorSecao.focus();
        return false;
    }
    else if(document.formAtualizacao.txtTeleitorSecao.value.length < 4){
        alert("A Seção é formada por 4 caracteres!");
        document.formAtualizacao.txtTeleitorSecao.style.border='2px solid red';
        document.formAtualizacao.txtTeleitorSecao.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtTeleitorSecao.focus();
        return false;
    }
    
    //Preccp
    var preccp = document.formAtualizacao.txtPreccp.value.replace(".","").replace("-","");
    if(document.formAtualizacao.txtPreccp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Preccp.");
        document.formAtualizacao.txtPreccp.style.border='2px solid red';
        document.formAtualizacao.txtPreccp.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtPreccp.focus();
        return false;
    }
    else if(document.formAtualizacao.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        document.formAtualizacao.txtPreccp.style.border='2px solid red';
        document.formAtualizacao.txtPreccp.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtPreccp.focus();
        return false;
    }
    
    //Escolaridade
    if(document.formAtualizacao.txtEscolaridade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Escolaridade.");
        document.formAtualizacao.txtEscolaridade.style.border='2px solid red';
        document.formAtualizacao.txtEscolaridade.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtEscolaridade.focus();
        return false;
    }
    
    //Religião   
    if(document.formAtualizacao.txtReligiao.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Religião.");
        document.formAtualizacao.txtReligiao.style.border='2px solid red';
        document.formAtualizacao.txtReligiao.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtReligiao.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtReligiao.selectedIndex==(document.formAtualizacao.txtReligiao.length-1) && document.formAtualizacao.txtOutraReligiao.value==""){
        alert("Campo Obrigatório!\nDigite a sua Religião.");
        document.formAtualizacao.txtOutraReligiao.style.border='2px solid red';
        document.formAtualizacao.txtOutraReligiao.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtOutraReligiao.focus();
        return false;
    }
    
    //--
    
    //Dados Familiares
    if(checkboxConjuge.checked == true){
        //Nome Conjuge
        if(document.formAtualizacao.txtNomeConjuge.value==""){
            alert("Campo Obrigatório!\nDigite o Nome Completo do seu Conjuge.");
            document.formAtualizacao.txtNomeConjuge.style.border='2px solid red';
            document.formAtualizacao.txtNomeConjuge.style.background='rgba(255,0,0,0.2)';
            document.formAtualizacao.txtNomeConjuge.focus();
            return false;
        }
        
        //Fone Conjuge
        var foneCon = document.formAtualizacao.txtFoneConjuge.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
        if(document.formAtualizacao.txtFoneConjuge.value==""){
            alert("Campo Obrigatório!\nDigite o Fone do seu Conjuge.");
            document.formAtualizacao.txtFoneConjuge.style.border='2px solid red';
            document.formAtualizacao.txtFoneConjuge.style.background='rgba(255,0,0,0.2)';
            document.formAtualizacao.txtFoneConjuge.focus();
            return false;
        }
        else if(document.formAtualizacao.txtFoneConjuge.value!="" && foneCon == '00000000000' || foneCon == '11111111111' ||
           foneCon == '22222222222' || foneCon == '33333333333' || foneCon == '44444444444' || foneCon == '55555555555' ||
           foneCon == '66666666666' || foneCon == '77777777777' || foneCon == '88888888888' || foneCon == '99999999999'){

            alert("Número de Telefone Inválido!");
            document.formAtualizacao.txtFoneConjuge.style.border='2px solid red';
            document.formAtualizacao.txtFoneConjuge.style.background='rgba(255,0,0,0.2)';
            document.formAtualizacao.txtFoneConjuge.focus();
            return false;
        }
        
        //Data Nascimento Conjuge
        if(document.formAtualizacao.txtDataNascConjuge.value==""){
            alert("Campo Obrigatório!\nDigite a Data de Nascimento do seu Conjuge.");
            document.formAtualizacao.txtDataNascConjuge.style.border='2px solid red';
            document.formAtualizacao.txtDataNascConjuge.style.background='rgba(255,0,0,0.2)';
            document.formAtualizacao.txtDataNascConjuge.focus();
            return false;
        }
        
        //Gravidez
        if((document.formAtualizacao.txtGravidez[0].checked == false)&&(document.formAtualizacao.txtGravidez[1].checked == false)){
            alert("Campo Obrigatório!\nInforme se sua Esposa está grávida ou não.");
            document.formAtualizacao.txtGravidez[0].focus();
            return false;
        }
    }
    
    //Dados de Endereço
    //Cep
    if(document.formAtualizacao.txtCep.value==""){
        alert("Campo Obrigatório!\nDigite o seu CEP.");
        document.formAtualizacao.txtCep.style.border='2px solid red';
        document.formAtualizacao.txtCep.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtCep.focus();
        return false;
    }
    var cep = document.formAtualizacao.txtCep.value.replace(".","").replace("-","");

    if(document.formAtualizacao.txtCep.value!="" && cep == '00000000' || cep == '11111111' || 
       cep == '22222222' || cep == '33333333' || cep == '44444444' || cep == '55555555' ||
       cep == '66666666' || cep == '77777777' || cep == '88888888' || cep == '99999999'){
       
        alert("CEP Inválido!");
        document.formAtualizacao.txtCep.style.border='2px solid red';
        document.formAtualizacao.txtCep.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtCep.focus();
        return false;
    }
    
    //Estado
    if(document.formAtualizacao.txtEstado.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado.");
        document.formAtualizacao.txtEstado.style.border='2px solid red';
        document.formAtualizacao.txtEstado.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtEstado.focus();
        return false;
    }
    
    //Cidade
    if(document.formAtualizacao.txtCidade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Cidade.");
        document.formAtualizacao.txtCidade.style.border='2px solid red';
        document.formAtualizacao.txtCidade.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtCidade.focus();
        return false;
    }
    
    //Bairro
    /*if(document.formAtualizacao.txtpadrao.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtpadrao.style.border='2px solid red';
        document.formAtualizacao.txtpadrao.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtpadrao.focus();
        return false;
    }
    else if(document.formAtualizacao.txtBairroManaus.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroManaus.style.border='2px solid red';
        document.formAtualizacao.txtBairroManaus.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroManaus.focus();
        return false;
    }
    else if(document.formAtualizacao.txtBairroRioPretoDaEva.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroRioPretoDaEva.style.border='2px solid red';
        document.formAtualizacao.txtBairroRioPretoDaEva.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroRioPretoDaEva.focus();
        return false;
    }
    else if(document.formAtualizacao.txtBairroManacapuru.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroManacapuru.style.border='2px solid red';
        document.formAtualizacao.txtBairroManacapuru.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroManacapuru.focus();
        return false;
    }
    else if(document.formAtualizacao.txtBairroIranduba.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroIranduba.style.border='2px solid red';
        document.formAtualizacao.txtBairroIranduba.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroIranduba.focus();
        return false;
    }*/
    
    //Bairro
    if(document.formAtualizacao.txtCidade.value=="1" && document.formAtualizacao.txtBairroManaus.selectedIndex=="0" ){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroManaus.style.border='2px solid red';
        document.formAtualizacao.txtBairroManaus.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroManaus.focus();
        return false;
    }
    else if(document.formAtualizacao.txtCidade.value=="2" && document.formAtualizacao.txtBairroRioPretoDaEva.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroRioPretoDaEva.style.border='2px solid red';
        document.formAtualizacao.txtBairroRioPretoDaEva.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroRioPretoDaEva.focus();
        return false;
    }
    else if(document.formAtualizacao.txtCidade.value=="4" && document.formAtualizacao.txtBairroManacapuru.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroManacapuru.style.border='2px solid red';
        document.formAtualizacao.txtBairroManacapuru.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroManacapuru.focus();
        return false;
    }
    else if(document.formAtualizacao.txtCidade.value=="3" && document.formAtualizacao.txtBairroIranduba.selectedIndex=="0" ){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairroIranduba.style.border='2px solid red';
        document.formAtualizacao.txtBairroIranduba.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtBairroIranduba.focus();
        return false;
    }
    
    //Rua
    if(document.formAtualizacao.txtLogradouro.value==""){
        alert("Campo Obrigatório!\nDigite o seu Endereço.");
        document.formAtualizacao.txtLogradouro.style.border='2px solid red';
        document.formAtualizacao.txtLogradouro.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtLogradouro.focus();
        return false;
    }
    
    //Número
    if(document.formAtualizacao.txtNum.value==""){
        alert("Campo Obrigatório!\nDigite o número da sua residência.");
        document.formAtualizacao.txtNum.style.border='2px solid red';
        document.formAtualizacao.txtNum.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNum.focus();
        return false;
    }
    
    //--
    //Dados de Contato
    //Fone01
    if(document.formAtualizacao.txtFone01.value==""){
        alert("Campo Obrigatório!\nDigite o número do Telefone 01.");
        document.formAtualizacao.txtFone01.style.border='2px solid red';
        document.formAtualizacao.txtFone01.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtFone01.focus();
        return false;
    }
    var fone1 = document.formAtualizacao.txtFone01.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formAtualizacao.txtFone01.value!="" && fone1 == '00000000000' || fone1 == '11111111111' ||
       fone1 == '22222222222' || fone1 == '33333333333' || fone1 == '44444444444' || fone1 == '55555555555' ||
       fone1 == '66666666666' || fone1 == '77777777777' || fone1 == '88888888888' || fone1 == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtFone01.style.border='2px solid red';
        document.formAtualizacao.txtFone01.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtFone01.focus();
        return false;
    }

    //Fone02
    var fone = document.formAtualizacao.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(document.formAtualizacao.txtFone02.value!="" && fone == '00000000000' || fone == '11111111111' ||
       fone == '22222222222' || fone == '33333333333' || fone == '44444444444' || fone == '55555555555' ||
       fone == '66666666666' || fone == '77777777777' || fone == '88888888888' || fone == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        document.formAtualizacao.txtFone02.style.border='2px solid red';
        document.formAtualizacao.txtFone02.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtFone02.focus();
        return false;
    }
    
    //Email
    if(document.formAtualizacao.txtEmail.value==""){
        alert("Campo Obrigatório!\nDigite o seu Email.");
        document.formAtualizacao.txtEmail.style.border='2px solid red';
        document.formAtualizacao.txtEmail.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtEmail.focus();
        return false;
    }
    
    //Nome de Referência
    if(document.formAtualizacao.txtNomeReferencia.value==""){
        alert("Campo Obrigatório!\nDgite o nome da sua referência.");
        document.formAtualizacao.txtNomeReferencia.style.border='2px solid red';
        document.formAtualizacao.txtNomeReferencia.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtNomeReferencia.focus();
        return false;
    }
    
    //Fone de Referência
    if(document.formAtualizacao.txtFoneReferencia.value==""){
        alert("Campo Obrigatório!\nDigite o número de telefone da sua referência.");
        document.formAtualizacao.txtNomeReferencia.style.border='2px solid red';
        document.formAtualizacao.txtNomeReferencia.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtFoneReferencia.focus();
        return false;
    }
    var foneFam = document.formAtualizacao.txtFoneReferencia.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(document.formAtualizacao.txtFoneReferencia.value!="" && foneFam == '00000000000' || foneFam == '11111111111' ||
       foneFam == '22222222222' || foneFam == '33333333333' || foneFam == '44444444444' || foneFam == '55555555555' ||
       foneFam == '66666666666' || foneFam == '77777777777' || foneFam == '88888888888' || foneFam == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtNomeReferencia.style.border='2px solid red';
        document.formAtualizacao.txtNomeReferencia.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtContFamiliar.focus();
        return false;
    }

    //Senha
    if(document.formAtualizacao.txtSenha.value==""){
        alert("Campo Obrigatório!\nDigite a sua Senha.");
        document.formAtualizacao.txtSenha.style.border='2px solid red';
        document.formAtualizacao.txtSenha.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtSenha.focus();
        return false;
    }
    else if(document.formAtualizacao.txtSenha.value.length < 6){
        alert("A senha deve conter no mínimo 6 caracteres!");
        document.formAtualizacao.txtSenha.style.border='2px solid red';
        document.formAtualizacao.txtSenha.style.background='rgba(255,0,0,0.2)';
        document.formAtualizacao.txtSenha.focus();
        return false;
    }
}