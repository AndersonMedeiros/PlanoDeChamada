
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

function valida_fone(id){
    var input = document.getElementById(id);
    var fone = input.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(fone == ''){
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

function validacao_cad(){
    //Dados Pessoais
    if(document.formCadastro.txtDivSec.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Divisão/Seção.");
        document.formCadastro.txtDivSec.style.border='2px solid red';
        document.formCadastro.txtDivSec.style.background='rgba(255,0,0,0.2)';
        document.formCadastro.txtDivSec.focus();
        return false;
    }
    
    if(document.formCadastro.txtPostGrad.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Posto/Graduação.");
        document.formCadastro.txtPostGrad.style.border='2px solid red';
        document.formCadastro.txtPostGrad.style.background='rgba(255,0,0,0.2)';
        document.formCadastro.txtPostGrad.focus();
        return false;
    }
    
    if(document.formCadastro.txtQasQms.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Qas/Qms.");
        document.formCadastro.txtQasQms.style.border='2px solid red';
        document.formCadastro.txtQasQms.style.background='rgba(255,0,0,0.2)';
        document.formCadastro.txtQasQms.focus();
        return false;
    }
    
    if(document.formCadastro.txtNomeComp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome Completo.");
        document.formCadastro.txtNomeComp.style.border='2px solid red';
        document.formCadastro.txtNomeComp.style.background='rgba(255,0,0,0.2)';
        document.formCadastro.txtNomeComp.focus();
        return false;
    }
    
    if(document.formCadastro.txtNomeGuerra.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome de Guerra.");
        document.formCadastro.txtNomeGuerra.style.border='1px solid red';
        document.formCadastro.txtNomeGuerra.focus();
        return false;
    }
    
    if((document.formCadastro.txtSexo[0].checked == false)&&(document.formCadastro.txtSexo[1].checked == false)){
        alert("Campo Obrigatório!\nInforme seu Sexo.");
        document.formCadastro.txtSexo[0].focus();
        return false;
    }
    
    if(document.formCadastro.txtNaturalidade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Naturalidade.");
        document.formCadastro.txtNaturalidade.style.border='1px solid red';
        document.formCadastro.txtNaturalidade.focus();
        return false;
    }
    
    if(document.formCadastro.txtEstCivil.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado Cívil.");
        document.formCadastro.txtEstCivil.style.border='1px solid red';
        document.formCadastro.txtEstCivil.focus();
        return false;
    }   
    
    if(document.formCadastro.txtDataPraca.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data Praça.");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }   
    
    var anoPraca = document.formCadastro.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formCadastro.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formCadastro.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
        
    if(document.formCadastro.txtDataPraca.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    if(document.formCadastro.txtDataPraca.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    if(document.formCadastro.txtDataPraca.value!="" && dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    
    if(document.formCadastro.txtIdentidade.value==""){
        alert("Campo Obrigatório!\nDigite a sua Identidade.");
        document.formCadastro.txtIdentidade.style.border='1px solid red';
        document.formCadastro.txtIdentidade.focus();
        return false;
    }
    var identidade = document.formCadastro.txtIdentidade.value.replace(".","").replace("-","");

    if(document.formCadastro.txtIdentidade.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        document.formCadastro.txtIdentidade.style.border='1px solid red';
        document.formCadastro.txtIdentidade.focus();
        return false;
    }
   
    
    if(document.formCadastro.txtCpf.value==""){
        alert("Campo Obrigatório!\nDigite o seu CPF.");
        document.formCadastro.txtCpf.style.border='1px solid red';
        document.formCadastro.txtCpf.focus();
        return false;
    }else{
        cpf = document.formCadastro.txtCpf.value.replace(/[^\d]+/g,'').replace(".","").replace("-","");	
	// Elimina CPFs invalidos conhecidos	
        
        if(cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" ||
            cpf == "33333333333" ||	cpf == "44444444444" || cpf == "55555555555" || 
            cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || 
            cpf == "99999999999"){
                alert("CPF Inválido!");
                document.formCadastro.txtCpf.style.border='1px solid red';
                document.formCadastro.txtCpf.focus();
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
                document.formCadastro.txtCpf.style.border='1px solid red';
                document.formCadastro.txtCpf.focus();
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
            document.formCadastro.txtCpf.style.border='1px solid red';
            document.formCadastro.txtCpf.focus();
            return false;
        }
    }
    
    if(document.formCadastro.txtPreccp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Preccp.");
        document.formCadastro.txtPreccp.style.border='1px solid red';
        document.formCadastro.txtPreccp.focus();
        return false;
    }
    var preccp = document.formCadastro.txtPreccp.value.replace(".","").replace("-","");

    if(document.formCadastro.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        document.formCadastro.txtPreccp.style.border='1px solid red';
        document.formCadastro.txtPreccp.focus();
        return false;
    }
    
    
    if(document.formCadastro.txtDataNasc.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data de Nascimento.");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
        return false;
    }
    var anoNasc = document.formCadastro.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formCadastro.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formCadastro.txtDataNasc.value.substring(8,10);
    var anoPraca = document.formCadastro.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formCadastro.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formCadastro.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
        
    if(document.formCadastro.txtDataNasc.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
        return false;
    }
    if(document.formCadastro.txtDataNasc.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
        return false;
    }
    if(document.formCadastro.txtDataNasc.value!="" && dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
        return false;
    }
    
    if(document.formCadastro.txtDataNasc.value!="" && anoNasc == anoPraca && mesNasc == mesPraca && diaNasc > diaPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    if(document.formCadastro.txtDataNasc.value!="" && anoNasc == anoPraca && mesNasc > mesPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    if(document.formCadastro.txtDataNasc.value!="" && anoNasc > anoPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
        return false;
    }
    
        
    if(document.formCadastro.txtEscolaridade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Escolaridade.");
        document.formCadastro.txtEscolaridade.style.border='1px solid red';
        document.formCadastro.txtEscolaridade.focus();
        return false;
    }
    
    //Dados de Endereço
    if(document.formCadastro.txtCep.value==""){
        alert("Campo Obrigatório!\nDigite o seu CEP.");
        document.formCadastro.txtCep.style.border='1px solid red';
        document.formCadastro.txtCep.focus();
        return false;
    }
    var cep = document.formCadastro.txtCep.value.replace(".","").replace("-","");

    if(document.formCadastro.txtCep.value!="" && cep == '00000000' || cep == '11111111' || 
       cep == '22222222' || cep == '33333333' || cep == '44444444' || cep == '55555555' ||
       cep == '66666666' || cep == '77777777' || cep == '88888888' || cep == '99999999'){
       
        alert("CEP Inválido!");
        document.formCadastro.txtCep.style.border='1px solid red';
        document.formCadastro.txtCep.focus();
        return false;
    }
    
    
    if(document.formCadastro.txtEstado.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado.");
        document.formCadastro.txtEstado.style.border='1px solid red';
        document.formCadastro.txtEstado.focus();
        return false;
    }
    
    if(document.formCadastro.txtCidade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Cidade.");
        document.formCadastro.txtCidade.style.border='1px solid red';
        document.formCadastro.txtCidade.focus();
        return false;
    }
    
    if(document.formCadastro.txtBairro.selectedIndex=="0"){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formCadastro.txtBairro.style.border='1px solid red';
        document.formCadastro.txtBairro.focus();
        return false;
    }
    
    if(document.formCadastro.txtLogradouro.value==""){
        alert("Campo Obrigatório!\nDigite o seu Endereço.");
        document.formCadastro.txtLogradouro.style.border='1px solid red';
        document.formCadastro.txtLogradouro.focus();
        return false;
    }
    if(document.formCadastro.txtNum.value==""){
        alert("Campo Obrigatório!\nDigite o número da sua residência.");
        document.formCadastro.txtNum.style.border='1px solid red';
        document.formCadastro.txtNum.focus();
        return false;
    }
    
    //Dados de Contato
    if(document.formCadastro.txtFone01.value==""){
        alert("Campo Obrigatório!\nDigite o número do Telefone 01.");
        document.formCadastro.txtFone01.style.border='1px solid red';
        document.formCadastro.txtFone01.focus();
        return false;
    }
    var fone1 = document.formCadastro.txtFone01.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formCadastro.txtFone01.value!="" && fone1 == '00000000000' || fone1 == '11111111111' ||
       fone1 == '22222222222' || fone1 == '33333333333' || fone1 == '44444444444' || fone1 == '55555555555' ||
       fone1 == '66666666666' || fone1 == '77777777777' || fone1 == '88888888888' || fone1 == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formCadastro.txtFone01.style.border='1px solid red';
        document.formCadastro.txtFone01.focus();
        return false;
    }
    
    var fone = document.formCadastro.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formCadastro.txtFone02.value!="" && fone == '00000000000' || fone == '11111111111' ||
       fone == '22222222222' || fone == '33333333333' || fone == '44444444444' || fone == '55555555555' ||
       fone == '66666666666' || fone == '77777777777' || fone == '88888888888' || fone == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        document.formCadastro.txtFone02.style.border='1px solid red';
        document.formCadastro.txtFone02.focus();
        return false;
    }
    
    if(document.formCadastro.txtEmail.value==""){
        alert("Campo Obrigatório!\nDigite o seu Email.");
        document.formCadastro.txtEmail.style.border='1px solid red';
        document.formCadastro.txtEmail.focus();
        return false;
    }
    
    if(document.formCadastro.txtFamiliar.value==""){
        alert("Campo Obrigatório!\nDgite o nome da sua referência.");
        document.formCadastro.txtFamiliar.style.border='1px solid red';
        document.formCadastro.txtFamiliar.focus();
        return false;
    }
    
    if(document.formCadastro.txtContFamiliar.value==""){
        alert("Campo Obrigatório!\nDigite o número de telefone da sua referência.");
        document.formCadastro.txtContFamiliar.style.border='1px solid red';
        document.formCadastro.txtContFamiliar.focus();
        return false;
    }
    var foneFam = document.formCadastro.txtContFamiliar.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formCadastro.txtContFamiliar.value!="" && foneFam == '00000000000' || foneFam == '11111111111' ||
       foneFam == '22222222222' || foneFam == '33333333333' || foneFam == '44444444444' || foneFam == '55555555555' ||
       foneFam == '66666666666' || foneFam == '77777777777' || foneFam == '88888888888' || foneFam == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formCadastro.txtContFamiliar.style.border='1px solid red';
        document.formCadastro.txtContFamiliar.focus();
        return false;
    }

    if(document.formCadastro.txtSenha.value==""){
        alert("Campo Obrigatório!\nDigite a sua Senha.");
        document.formCadastro.txtSenha.style.border='1px solid red';
        document.formCadastro.txtSenha.focus();
        return false;
    }
    
    if(document.formCadastro.txtSenha.value.length < 6){
        alert("A senha deve conter no mínimo 6 caracteres!");
        document.formCadastro.txtSenha.style.border='1px solid red';
        document.formCadastro.txtSenha.focus();
        return false;
    }
}