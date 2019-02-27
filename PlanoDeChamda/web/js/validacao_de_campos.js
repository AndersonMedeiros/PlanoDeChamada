
function validaSenha(){
    if(document.formCadastro.txtSenha.value.length < 6){
        alert("A senha deve conter no mínimo 6 caracteres!");
        document.formCadastro.txtSenha.style.border='1px solid red';
        document.formCadastro.txtSenha.focus();
        return false;
    }else{
        document.formCadastro.txtSenha.style.border='1px solid green';
    }
}

function validarDataNasc(){
    var anoNasc = document.formCadastro.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formCadastro.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formCadastro.txtDataNasc.value.substring(8,10);
    var anoPraca = document.formCadastro.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formCadastro.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formCadastro.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formCadastro.txtDataNasc.value == ""){
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual == mesNasc && dataAtual.getDate() < diaNasc){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual < mesNasc){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() < anoNasc){
        alert("Data Inválida!");
        document.formCadastro.txtDataNasc.style.border='1px solid red';
        document.formCadastro.txtDataNasc.focus();
    }

    else if(anoNasc == anoPraca && mesNasc == mesPraca && diaNasc > diaPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else if(anoNasc == anoPraca && mesNasc > mesPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else if(anoNasc > anoPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else{
        document.formCadastro.txtDataNasc.style.border='1px solid green';
    }
}

function validarDataNasc_Att(){
    var anoNasc = document.formAtualizacao.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formAtualizacao.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formAtualizacao.txtDataNasc.value.substring(8,10);
    var anoPraca = document.formAtualizacao.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formAtualizacao.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formAtualizacao.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formAtualizacao.txtDataNasc.value == ""){
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual == mesNasc && dataAtual.getDate() < diaNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() == anoNasc && mesAtual < mesNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
    }
    else if(dataAtual.getFullYear() < anoNasc){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
    }

    else if(anoNasc == anoPraca && mesNasc == mesPraca && diaNasc > diaPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(anoNasc == anoPraca && mesNasc > mesPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(anoNasc > anoPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else{
        document.formAtualizacao.txtDataNasc.style.border='1px solid green';
    }
}

function validarDataPraca(){
    var anoPraca = document.formCadastro.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formCadastro.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formCadastro.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formCadastro.txtDataPraca.value == ""){
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formCadastro.txtDataPraca.style.border='1px solid red';
        document.formCadastro.txtDataPraca.focus();
    }
    else{
        document.formCadastro.txtDataPraca.style.border='1px solid green';
    }
}

function validarDataPraca_Att(){
    var anoPraca = document.formAtualizacao.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formAtualizacao.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formAtualizacao.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
    if(document.formAtualizacao.txtDataPraca.value == ""){
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else if(dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
    }
    else{
        document.formAtualizacao.txtDataPraca.style.border='1px solid green';
    }
}

function validarCPF() {	

    cpf = document.formCadastro.txtCpf.value.replace(/[^\d]+/g,'').replace(".","").replace("-","");	
	// Elimina CPFs invalidos conhecidos	
        if(cpf == ''){
            document.formCadastro.txtCpf.style.border='1px solid red';
            document.formCadastro.txtCpf.focus();
            return false;
        }
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
        document.formCadastro.txtCpf.style.border='1px solid green';
        return true;
}

function validarCPF_Att() {	

    cpf = document.formAtualizacao.txtCpf.value.replace(/[^\d]+/g,'').replace(".","").replace("-","");	
	// Elimina CPFs invalidos conhecidos	
        if(cpf == ''){
            document.formAtualizacao.txtCpf.style.border='1px solid red';
            document.formAtualizacao.txtCpf.focus();
            return false;
        }
        if(cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" ||
            cpf == "33333333333" ||	cpf == "44444444444" || cpf == "55555555555" || 
            cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || 
            cpf == "99999999999"){
                alert("CPF Inválido!");
                document.formAtualizacao.txtCpf.style.border='1px solid red';
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
                document.formAtualizacao.txtCpf.style.border='1px solid red';
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
            document.formAtualizacao.txtCpf.style.border='1px solid red';
            document.formAtualizacao.txtCpf.focus();
            return false;
        }
        document.formAtualizacao.txtCpf.style.border='1px solid green';
        return true;
}

function validarIDENTIDADE_Att(){
    var identidade = document.formAtualizacao.txtIdentidade.value.replace(".","").replace("-","");
    if(identidade == ''){
        document.formAtualizacao.txtIdentidade.style.border='1px solid red';
        document.formAtualizacao.txtIdentidade.focus();
    }
    else if(document.formAtualizacao.txtIdentidade.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        document.formAtualizacao.txtIdentidade.style.border='1px solid red';
        document.formAtualizacao.txtIdentidade.focus();
        return false;
    }else{
        document.formAtualizacao.txtIdentidade.style.border='1px solid green';
        return true;
    }
}

function validarIDENTIDADE(){
    var identidade = document.formCadastro.txtIdentidade.value.replace(".","").replace("-","");
    if(identidade == ''){
        document.formCadastro.txtIdentidade.style.border='1px solid red';
        document.formCadastro.txtIdentidade.focus();
        return false;
    }
    else if(document.formCadastro.txtIdentidade.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        document.formCadastro.txtIdentidade.style.border='1px solid red';
        document.formCadastro.txtIdentidade.focus();
        
    }else{
        document.formCadastro.txtIdentidade.style.border='1px solid green';
    }
}

function validarTITULO(){
    var titulo = document.formCadastro.txtTituloEleitor.value.replace(" ","");
    if(titulo == ''){
        document.formCadastro.txtTituloEleitor.style.border='1px solid red';
        document.formCadastro.txtTituloEleitor.focus();
    }
    else if(document.formCadastro.txtTituloEleitor.value!="" && titulo == '000000000000' ||titulo == '111111111111' || 
       titulo == '222222222222' || titulo == '333333333333' || titulo == '444444444444' || titulo == '555555555555' ||
       titulo == '666666666666' || titulo == '777777777777' || titulo == '888888888888' || titulo == '999999999999'){
       
        alert("Número de Titulo Eleitoral Inválido!");
        document.formCadastro.txtTituloEleitor.style.border='1px solid red';
        document.formCadastro.txtTituloEleitor.focus();
        
    }else{
        document.formCadastro.txtTituloEleitor.style.border='1px solid green';
    }
}

function validarTITULO_Att(){
    var titulo = document.formAtualizacao.txtTituloEleitor.value.replace(" ","");
    if(titulo == ''){
        document.formAtualizacao.txtTituloEleitor.style.border='1px solid red';
        document.formAtualizacao.txtTituloEleitor.focus();
    }
    else if(document.formAtualizacao.txtTituloEleitor.value!="" && titulo == '000000000000' ||titulo == '111111111111' || 
       titulo == '222222222222' || titulo == '333333333333' || titulo == '444444444444' || titulo == '555555555555' ||
       titulo == '666666666666' || titulo == '777777777777' || titulo == '888888888888' || titulo == '999999999999'){
       
        alert("Número de Titulo Eleitoral Inválido!");
        document.formAtualizacao.txtTituloEleitor.style.border='1px solid red';
        document.formAtualizacao.txtTituloEleitor.focus();
        
    }else{
        document.formAtualizacao.txtTituloEleitor.style.border='1px solid green';
    }
}

function validarPRECCP(){
    var preccp = document.formCadastro.txtPreccp.value.replace(".","").replace("-","");
    if(preccp == ''){
        document.formCadastro.txtPreccp.style.border='1px solid red';
        document.formCadastro.txtPreccp.focus();
    }
    else if(document.formCadastro.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        document.formCadastro.txtPreccp.style.border='1px solid red';
        document.formCadastro.txtPreccp.focus();
        
    }
    else{
        document.formCadastro.txtPreccp.style.border='1px solid green';
        
    }
}

function validarPRECCP_Att(){
    var preccp = document.formAtualizacao.txtPreccp.value.replace(".","").replace("-","");
    if(preccp == ''){
        document.formAtualizacao.txtPreccp.style.border='1px solid red';
        document.formAtualizacao.txtPreccp.focus();
    }
    else if(document.formAtualizacao.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        document.formAtualizacao.txtPreccp.style.border='1px solid red';
        document.formAtualizacao.txtPreccp.focus();
        
    }
    else{
        document.formAtualizacao.txtPreccp.style.border='1px solid green';
        
    }
}

function validarCEP(){
    var cep = document.formCadastro.txtCep.value.replace(".","").replace("-","");
    if(cep == ''){
        document.formCadastro.txtCep.style.border='1px solid red';
        document.formCadastro.txtCep.focus();
        
    }
    else if(cep == '00000000' || cep == '11111111' || cep == '22222222' ||
       cep == '33333333' || cep == '44444444' || cep == '55555555' ||
       cep == '66666666' || cep == '77777777' || cep == '88888888' ||
       cep == '99999999'){
            alert("CEP Inválido!");
            document.formCadastro.txtCep.style.border='1px solid red';
            document.formCadastro.txtCep.focus();
            
    }
    else{
        document.formCadastro.txtCep.style.border='1px solid green';
        
    }
}

function validarCEP_Att(){
    var cep = document.formAtualizacao.txtCep.value.replace(".","").replace("-","");
    if(cep == ''){
        document.formAtualizacao.txtCep.style.border='1px solid red';
        document.formAtualizacao.txtCep.focus();
        
    }
    else if(cep == '00000000' || cep == '11111111' || cep == '22222222' ||
       cep == '33333333' || cep == '44444444' || cep == '55555555' ||
       cep == '66666666' || cep == '77777777' || cep == '88888888' ||
       cep == '99999999'){
            alert("CEP Inválido!");
            document.formAtualizacao.txtCep.style.border='1px solid red';
            document.formAtualizacao.txtCep.focus();
            
    }
    else{
        document.formAtualizacao.txtCep.style.border='1px solid green';
        
    }
}

function validarFONE01(){
    var fone1 = document.formCadastro.txtFone01.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    
    if(fone1 == ''){
        document.formCadastro.txtFone01.style.border='1px solid red';
        document.formCadastro.txtFone01.focus();
    }
    else if(document.formCadastro.txtFone01.value!="" && fone1 == '00000000000' || fone1 == '11111111111' ||
       fone1 == '22222222222' || fone1 == '33333333333' || fone1 == '44444444444' || fone1 == '55555555555' ||
       fone1 == '66666666666' || fone1 == '77777777777' || fone1 == '88888888888' || fone1 == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formCadastro.txtFone01.style.border='1px solid red';
        document.formCadastro.txtFone01.focus();
        
    }else{
        document.formCadastro.txtFone01.style.border='1px solid green';
        
    }
       
}

function validarFONE01_Att(){
    var fone1 = document.formAtualizacao.txtFone01.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    
    if(fone1 == ''){
        document.formAtualizacao.txtFone01.style.border='1px solid red';
        document.formAtualizacao.txtFone01.focus();
    }
    else if(document.formAtualizacao.txtFone01.value!="" && fone1 == '00000000000' || fone1 == '11111111111' ||
       fone1 == '22222222222' || fone1 == '33333333333' || fone1 == '44444444444' || fone1 == '55555555555' ||
       fone1 == '66666666666' || fone1 == '77777777777' || fone1 == '88888888888' || fone1 == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtFone01.style.border='1px solid red';
        document.formAtualizacao.txtFone01.focus();
        
    }else{
        document.formAtualizacao.txtFone01.style.border='1px solid green';
        
    }
       
}

function validarFONE02(){
    var fone2 = document.formCadastro.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(fone2 == ''){
        document.formCadastro.txtFone02.style.border='1px solid red';
        document.formCadastro.txtFone02.focus();
    }
    else if(document.formCadastro.txtFone02.value!="" && fone2 == '00000000000' || fone2 == '11111111111' ||
       fone2 == '22222222222' || fone2 == '33333333333' || fone2 == '44444444444' || fone2 == '55555555555' ||
       fone2 == '66666666666' || fone2 == '77777777777' || fone2 == '88888888888' || fone2 == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        document.formCadastro.txtFone02.style.border='1px solid red';
        document.formCadastro.txtFone02.focus();
        
    }else{
        document.formCadastro.txtFone02.style.border='1px solid green';
        
    }
}

function validarFONE02_Att(){
    var fone2 = document.formAtualizacao.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    if(fone2 == ''){
        document.formAtualizacao.txtFone02.style.border='1px solid red';
        document.formAtualizacao.txtFone02.focus();
    }
    else if(document.formAtualizacao.txtFone02.value!="" && fone2 == '00000000000' || fone2 == '11111111111' ||
       fone2 == '22222222222' || fone2 == '33333333333' || fone2 == '44444444444' || fone2 == '55555555555' ||
       fone2 == '66666666666' || fone2 == '77777777777' || fone2 == '88888888888' || fone2 == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        document.formAtualizacao.txtFone02.style.border='1px solid red';
        document.formAtualizacao.txtFone02.focus();
        
    }else{
        document.formAtualizacao.txtFone02.style.border='1px solid green';
        
    }
}

function validarContFam(){
    var foneFam = document.formCadastro.txtContFamiliar.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    
    if(foneFam == ''){
        document.formCadastro.txtContFamiliar.style.border='1px solid red';
        document.formCadastro.txtContFamiliar.focus();
    }
    else if(document.formCadastro.txtContFamiliar.value!="" && foneFam == '00000000000' || foneFam == '11111111111' ||
       foneFam == '22222222222' || foneFam == '33333333333' || foneFam == '44444444444' || foneFam == '55555555555' ||
       foneFam == '66666666666' || foneFam == '77777777777' || foneFam == '88888888888' || foneFam == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formCadastro.txtContFamiliar.style.border='1px solid red';
        document.formCadastro.txtContFamiliar.focus();
        
    }else{
        document.formCadastro.txtContFamiliar.style.border='1px solid green';
        
    }
}

function validarContFam_Att(){
    var foneFam = document.formAtualizacao.txtContFamiliar.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");
    
    if(foneFam == ''){
        document.formAtualizacao.txtContFamiliar.style.border='1px solid red';
        document.formAtualizacao.txtContFamiliar.focus();
    }
    else if(document.formAtualizacao.txtContFamiliar.value!="" && foneFam == '00000000000' || foneFam == '11111111111' ||
       foneFam == '22222222222' || foneFam == '33333333333' || foneFam == '44444444444' || foneFam == '55555555555' ||
       foneFam == '66666666666' || foneFam == '77777777777' || foneFam == '88888888888' || foneFam == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtContFamiliar.style.border='1px solid red';
        document.formAtualizacao.txtContFamiliar.focus();
        
    }else{
        document.formAtualizacao.txtContFamiliar.style.border='1px solid green';
        
    }
}

function somenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if((tecla>47) && (tecla<58)) return true;
    else{
        if((tecla==8) || (tecla==0)) return true;
        else return false;
    }
}

function validacaoLogin(){
    if(document.formLogin.txtIdentidade.value==""){
        alert("Informe seu Identidade!");
        document.formLogin.txtIdentidade.focus();
        return false;
    }
    
    if(document.formLogin.txtSenha.value==""){
        alert("Informe sua Senha!");
        document.formLogin.txtsenha.focus();
        return false;
    }
    
    if(document.formLogin.txtSenha.value.length < 6){
        alert("A senha deve ter no mínimo 6 digitos!");
        document.formLogin.txtSenha.focus();
        return false;
    }
}

function validacao_cad(){
    //Dados Pessoais
    if(document.formCadastro.txtDivSec.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Divisão/Seção.");
        document.formCadastro.txtDivSec.style.border='1px solid red';
        document.formCadastro.txtDivSec.focus();
        return false;
    }
    
    if(document.formCadastro.txtPostGrad.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Posto/Graduação.");
        document.formCadastro.txtPostGrad.style.border='1px solid red';
        document.formCadastro.txtPostGrad.focus();
        return false;
    }
    
    if(document.formCadastro.txtQasQms.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Qas/Qms.");
        document.formCadastro.txtQasQms.style.border='1px solid red';
        document.formCadastro.txtQasQms.focus();
        return false;
    }
    
    if(document.formCadastro.txtNomeComp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome Completo.");
        document.formCadastro.txtNomeComp.style.border='1px solid red';
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
    
    var fone2 = document.formCadastro.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formCadastro.txtFone02.value!="" && fone2 == '00000000000' || fone2 == '11111111111' ||
       fone2 == '22222222222' || fone2 == '33333333333' || fone2 == '44444444444' || fone2 == '55555555555' ||
       fone2 == '66666666666' || fone2 == '77777777777' || fone2 == '88888888888' || fone2 == '99999999999'){
       
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

function validacao_att(){
    //Dados Pessoais
    if(document.formAtualizacao.txtDivSec.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Divisão/Seção.");
        document.formAtualizacao.txtDivSec.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtPostGrad.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Posto/Graduação.");
        document.formAtualizacao.txtPostGrad.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtQasQms.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Qas/Qms.");
        document.formAtualizacao.txtQasQms.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtNomeComp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome Completo.");
        document.formAtualizacao.txtNomeComp.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtNomeGuerra.value==""){
        alert("Campo Obrigatório!\nDigite o seu Nome de Guerra.");
        document.formAtualizacao.txtNomeGuerra.focus();
        return false;
    }
    
    if((document.formAtualizacao.txtSexo[0].checked == false)&&(document.formAtualizacao.txtSexo[1].checked == false)){
        alert("Campo Obrigatório!\nInforme seu Sexo.");
        document.formAtualizacao.txtSexo[0].focus();
        return false;
    }
    
    if(document.formAtualizacao.txtNaturalidade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Naturalidade.");
        document.formAtualizacaoo.txtNaturalidade.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtEstCivil.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado Cívil.");
        document.formAtualizacao.txtEstCivil.focus();
        return false;
    }   
    
    if(document.formAtualizacao.txtDataPraca.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data Praça.");
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    
    var anoPraca = document.formAtualizacao.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formAtualizacao.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formAtualizacao.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
        
    if(document.formAtualizacao.txtDataPraca.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    if(document.formAtualizacao.txtDataPraca.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    if(document.formAtualizacao.txtDataPraca.value!="" && dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtIdentidade.value==""){
        alert("Campo Obrigatório!\nDigite a sua Identidade.");
        document.formAtualizacao.txtIdentidade.focus();
        return false;
    }
    var identidade = document.formAtualizacao.txtIdentidade.value.replace(".","").replace("","");

    if(document.formAtualizacao.txtIdentidade.value!="" && identidade == '0000000000' || identidade == '1111111111' || 
       identidade == '2222222222' || identidade == '3333333333' || identidade == '4444444444' || identidade == '5555555555' ||
       identidade == '6666666666' || identidade == '7777777777' || identidade == '8888888888' || identidade == '9999999999'){
       
        alert("Número de Identidade Inválido!");
        document.formAtualizacao.txtIdentidade.style.border='1px solid red';
        document.formAtualizacao.txtIdentidade.focus();
        return false;
   }
    
    if(document.formAtualizacao.txtCpf.value==""){
        alert("Campo Obrigatório!\nDigite o seu CPF.");
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
                document.formAtualizacao.txtCpf.style.border='1px solid red';
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
                document.formAtualizacao.txtCpf.style.border='1px solid red';
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
           document.formAtualizacao.txtCpf.style.border='1px solid red';
            document.formAtualizacao.txtCpf.focus();
            return false;
        }
    }
    
    if(document.formAtualizacao.txtPreccp.value==""){
        alert("Campo Obrigatório!\nDigite o seu Preccp.");
       document.formAtualizacao.txtPreccp.focus();
        return false;
    }
    var preccp = document.formAtualizacao.txtPreccp.value.replace(".","").replace("-","");

    if(document.formAtualizacao.txtPreccp.value!="" && preccp == '000000000' || preccp == '111111111' || 
       preccp == '222222222' || preccp == '333333333' || preccp == '444444444' || preccp == '555555555' ||
       preccp == '666666666' || preccp == '777777777' || preccp == '888888888' || preccp == '999999999'){
       
        alert("Preccp Inválido!");
        document.formAtualizacao.txtPreccp.style.border='1px solid red';
        document.formAtualizacao.txtPreccp.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtDataNasc.value==""){
        alert("Campo Obrigatório!\nDigite a sua Data de Nascimento.");
        document.formAtualizacao.txtDataNasc.focus();
        return false;
    }
    var anoNasc = document.formAtualizacao.txtDataNasc.value.substring(0,4);
    var mesNasc = document.formAtualizacao.txtDataNasc.value.substring(5,7);
    var diaNasc = document.formAtualizacao.txtDataNasc.value.substring(8,10);
    var anoPraca = document.formAtualizacao.txtDataPraca.value.substring(0,4);
    var mesPraca = document.formAtualizacao.txtDataPraca.value.substring(5,7);
    var diaPraca = document.formAtualizacao.txtDataPraca.value.substring(8,10);
    var dataAtual = new Date();
    var mesAtual = dataAtual.getMonth()+1;
        
   if(document.formAtualizacao.txtDataNasc.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual == mesPraca && dataAtual.getDate() < diaPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
        return false;
    }
    if(document.formAtualizacao.txtDataNasc.value!="" && dataAtual.getFullYear() == anoPraca && mesAtual < mesPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
        return false;
    }
    if(document.formAtualizacao.txtDataNasc.value!="" && dataAtual.getFullYear() < anoPraca){
        alert("Data Inválida!");
        document.formAtualizacao.txtDataNasc.style.border='1px solid red';
        document.formAtualizacao.txtDataNasc.focus();
        return false;
    }
    
    if(anoNasc == anoPraca && mesNasc == mesPraca && diaNasc > diaPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    else if(anoNasc == anoPraca && mesNasc > mesPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    if(anoNasc > anoPraca){
        alert("Data Inválida!\n A data de Praça não pode ser menor que a data de Nascimento!");
        document.formAtualizacao.txtDataPraca.style.border='1px solid red';
        document.formAtualizacao.txtDataPraca.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtEscolaridade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Escolaridade.");
        document.formAtualizacao.txtEscolaridade.focus();
        return false;
    }
    
    //Dados de Endereço
    if(document.formAtualizacao.txtCep.value==""){
        alert("Campo Obrigatório!\nDigite o seu CEP.");
        document.formAtualizacao.txtCep.focus();
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
   
    if(document.formAtualizacao.txtEstado.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Estado.");
        document.formAtualizacao.txtEstado.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtCidade.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione a sua Cidade.");
        document.formAtualizacao.txtCidade.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtBairro.selectedIndex==0){
        alert("Campo Obrigatório!\nSelecione o seu Bairro.");
        document.formAtualizacao.txtBairro.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtLogradouro.value==""){
        alert("Campo Obrigatório!\nDigite o seu Endereço.");
        document.formAtualizacao.txtLogradouro.focus();
        return false;
    }
   if(document.formAtualizacao.txtNum.value==""){
        alert("Campo Obrigatório!\nDigite o número da sua residência.");
        document.formAtualizacao.txtNum.focus();
        return false;
    }
    
    //Dados de Contato
    if(document.formAtualizacao.txtFone01.value==""){
        alert("Campo Obrigatório!\nDigite o número do Telefone 01.");
        document.formAtualizacao.txtFone01.focus();
        return false;
    }
    
    var fone1 = document.formAtualizacao.txtFone01.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formAtualizacao.txtFone01.value!="" && fone1 == '00000000000' || fone1 == '11111111111' ||
       fone1 == '22222222222' || fone1 == '33333333333' || fone1 == '44444444444' || fone1 == '55555555555' ||
       fone1 == '66666666666' || fone1 == '77777777777' || fone1 == '88888888888' || fone1 == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtFone01.style.border='1px solid red';
        document.formAtualizacao.txtFone01.focus();
        return false;
    }
    
    var fone2 = document.formAtualizacao.txtFone02.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formAtualizacao.txtFone02.value!="" && fone2 == '00000000000' || fone2 == '11111111111' ||
       fone2 == '22222222222' || fone2 == '33333333333' || fone2 == '44444444444' || fone2 == '55555555555' ||
       fone2 == '66666666666' || fone2 == '77777777777' || fone2 == '88888888888' || fone2 == '99999999999'){
       
        alert("Número de Telefoone Inválido!");
        document.formAtualizacao.txtFone02.style.border='1px solid red';
        document.formAtualizacao.txtFone02.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtEmail.value==""){
        alert("Campo Obrigatório!\nDigite o seu Email.");
        document.formAtualizacao.txtEmail.focus();
        return false;
    }
   
    if(document.formAtualizacao.txtFamiliar.value==""){
        alert("Campo Obrigatório!\nDgite o nome da sua referência.");
        document.formAtualizacao.txtFamiliar.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtContFamiliar.value==""){
        alert("Campo Obrigatório!\nDigite o número de telefone da sua referência.");
        document.formAtualizacao.txtContFamiliar.focus();
       return false;
    }
    var foneFam = document.formAtualizacao.txtContFamiliar.value.replace(".","").replace("-","").replace("(","").replace(")","").replace(" ","");

    if(document.formAtualizacao.txtContFamiliar.value!="" && foneFam == '00000000000' || foneFam == '11111111111' ||
       foneFam == '22222222222' || foneFam == '33333333333' || foneFam == '44444444444' || foneFam == '55555555555' ||
       foneFam == '66666666666' || foneFam == '77777777777' || foneFam == '88888888888' || foneFam == '99999999999'){
       
        alert("Número de Telefone Inválido!");
        document.formAtualizacao.txtContFamiliar.style.border='1px solid red';
        document.formAtualizacao.txtContFamiliar.focus();
        return false;
    }
    
    //Dados de Acesso
    if(document.formAtualizacao.txtLogin.value==""){
        alert("Campo Obrigatório!\nDigite o seu Login.");
        document.formAtualizacao.txtLogin.focus();
        return false;
    }
    
    if(document.formAtualizacao.txtSenha.value==""){
        alert("Campo Obrigatório!\nDigite a sua Senha.");
        document.formAtualizacao.txtSenha.focus();
        return false;
    }
    
   if(document.formAtualizacao.txtSenha.value.length < 6){
        alert("A senha deve conter no mínimo 6 caracteres!");
        document.formAtualizacao.txtSenha.focus();
        return false;
   }
    
}

/*
unction bordas_campos(){
    //Divisao/Secao
    if(document.formCadastro.txtDivSec.selectedIndex!=0){
        document.formCadastro.txtDivSec.style.border='1px solid green';
    }else{
        document.formCadastro.txtDivSec.style.border='1px solid red'; 
    }
    //Posto/Graduacao
    if(document.formCadastro.txtPostGrad.selectedIndex!=0){
        document.formCadastro.txtPostGrad.style.border='1px solid green';
    }else{
        document.formCadastro.txtPostGrad.style.border='1px solid red'; 
    }
    //Qas/Qms
    if(document.formCadastro.txtQasQms.selectedIndex!=0){
        document.formCadastro.txtQasQms.style.border='1px solid green';
    }else{
        document.formCadastro.txtQasQms.style.border='1px solid red'; 
    }
   //Nome Completo
    if(document.formCadastro.txtNomeComp.value!=""){document.formCadastro.txtNomeComp.style.border='1px solid green'}
    else{document.formCadastro.txtNomeComp.style.border='1px solid red'}
    //Nome Guerra
    if(document.formCadastro.txtNomeGuerra.value!=""){document.formCadastro.txtNomeGuerra.style.border='1px solid green'}
else{document.formCadastro.txtNomeGuerra.style.border='1px solid red'}
    //Sexo
    //Naturalidade
    if(document.formCadastro.txtNaturalidade.selectedIndex!=0){
       document.formCadastro.txtNaturalidade.style.border='1px solid green';
    }else{
        document.formCadastro.txtNaturalidade.style.border='1px solid red'; 
    }
    //Estado Civil
    if(document.formCadastro.txtEstCivil.selectedIndex!=0){
        document.formCadastro.txtEstCivil.style.border='1px solid green';
    }else{
        document.formCadastro.txtEstCivil.style.border='1px solid red'; 
   }
    //Data Praça
    if(document.formCadastro.txtDataPraca.value!=""){document.formCadastro.txtDataPraca.style.border='1px solid green'}
    else{document.formCadastro.txtDataPraca.style.border='1px solid red'}
    //Identidade
    if(document.formCadastro.txtIdentidade.value!=""){document.formCadastro.txtIdentidade.style.border='1px solid green'}
    else{document.formCadastro.txtIdentidade.style.border='1px solid red'}
    //Cpf
    if(document.formCadastro.txtCpf.value!=""){document.formCadastro.txtCpf.style.border='1px solid green'}
    else{document.formCadastro.txtCpf.style.border='1px solid red'}
    //Preccp
    if(document.formCadastro.txtPreccp.value!=""){document.formCadastro.txtPreccp.style.border='1px solid green'}
    else{document.formCadastro.txtPreccp.style.border='1px solid red'}
    //Data de Nascimento
    if(document.formCadastro.txtDataNasc.value!=""){document.formCadastro.txtDataNasc.style.border='1px solid green'}
    else{document.formCadastro.txtDataNasc.style.border='1px solid red'}
    //Escolaridade
    if(document.formCadastro.txtEscolaridade.selectedIndex!=0){
        document.formCadastro.txtEscolaridade.style.border='1px solid green';
    }else{
        document.formCadastro.txtEscolaridade.style.border='1px solid red'; 
    }
    
    //Dados de Endereço
    //Cep
    if(document.formCadastro.txtCep.value!=""){document.formCadastro.txtCep.style.border='1px solid green'}
    else{document.formCadastro.txtCep.style.border='1px solid red'}
    //Estado
    if(document.formCadastro.txtEstado.selectedIndex!=0){
        document.formCadastro.txtEstado.style.border='1px solid green';
    }else{
        document.formCadastro.txtEstado.style.border='1px solid red'; 
    }
    //Cidade
   if(document.formCadastro.txtCidade.selectedIndex!=0){
        document.formCadastro.txtCidade.style.border='1px solid green';
    }else{
        document.formCadastro.txtCidade.style.border='1px solid red'; 
    }
    //Bairro
    if(document.formCadastro.txtBairro.selectedIndex!=0){
        document.formCadastro.txtBairro.style.border='1px solid green';
    }else{
        document.formCadastro.txtBairro.style.border='1px solid red'; 
    }
    //Logradouro
    if(document.formCadastro.txtLogradouro.value!=""){document.formCadastro.txtLogradouro.style.border='1px solid green'}
    else{document.formCadastro.txtLogradouro.style.border='1px solid red'}
    //Número
    if(document.formCadastro.txtNum.value!=""){document.formCadastro.txtNum.style.border='1px solid green'}
    else{document.formCadastro.txtNum.style.border='1px solid red'}
    
    //Dados de Contato
    //Fone 01
    if(document.formCadastro.txtFone01.value!=""){document.formCadastro.txtFone01.style.border='1px solid green'}
    else{document.formCadastro.txtFone01.style.border='1px solid red'}
    //Email
    if(document.formCadastro.txtEmail.value!=""){document.formCadastro.txtEmail.style.border='1px solid green'}
    else{document.formCadastro.txtEmail.style.border='1px solid red'}
    //Familiar
    if(document.formCadastro.txtFamiliar.value!=""){document.formCadastro.txtFamiliar.style.border='1px solid green'}
    else{document.formCadastro.txtFamiliar.style.border='1px solid red'}
    //Contato do Familiar
    if(document.formCadastro.txtContFamiliar.value!=""){document.formCadastro.txtContFamiliar.style.border='1px solid green'}
    else{document.formCadastro.txtContFamiliar.style.border='1px solid red'}
}*/

function borda_DivSec(){
    if(document.formCadastro.txtDivSec.selectedIndex!=0){
        document.formCadastro.txtDivSec.style.border='1px solid green';
    }else{
        document.formCadastro.txtDivSec.style.border='1px solid red'; 
    }
}
function borda_PostGrad(){
    if(document.formCadastro.txtPostGrad.selectedIndex!=0){
        document.formCadastro.txtPostGrad.style.border='1px solid green';
    }else{
        document.formCadastro.txtPostGrad.style.border='1px solid red'; 
    }
}
function borda_QasQms(){
    if(document.formCadastro.txtQasQms.selectedIndex!=0){
        document.formCadastro.txtQasQms.style.border='1px solid green';
    }else{
        document.formCadastro.txtQasQms.style.border='1px solid red'; 
    }
}
function borda_NomeComp(){
    if(document.formCadastro.txtNomeComp.value!=""){document.formCadastro.txtNomeComp.style.border='1px solid green'}
    else{document.formCadastro.txtNomeComp.style.border='1px solid red'}
}
function borda_NomeGuerra(){
    if(document.formCadastro.txtNomeGuerra.value!=""){document.formCadastro.txtNomeGuerra.style.border='1px solid green'}
    else{document.formCadastro.txtNomeGuerra.style.border='1px solid red'}
}
function borda_Naturalidade(){
    if(document.formCadastro.txtNaturalidade.selectedIndex!=0){
        document.formCadastro.txtNaturalidade.style.border='1px solid green';
    }else{
        document.formCadastro.txtNaturalidade.style.border='1px solid red'; 
    }
}
function borda_Est_Civil(){
    if(document.formCadastro.txtEstCivil.selectedIndex!=0){
        document.formCadastro.txtEstCivil.style.border='1px solid green';
    }else{
        document.formCadastro.txtEstCivil.style.border='1px solid red'; 
    }
}
function borda_DataPraca(){
    if(document.formCadastro.txtDataPraca.value!=""){document.formCadastro.txtDataPraca.style.border='1px solid green'}
    else{document.formCadastro.txtDataPraca.style.border='1px solid red'}
}
function borda_Identidade(){
    if(document.formCadastro.txtIdentidade.value!=""){document.formCadastro.txtIdentidade.style.border='1px solid green'}
    else{document.formCadastro.txtIdentidade.style.border='1px solid red'}
}
function borda_Cpf(){
    if(document.formCadastro.txtCpf.value!=""){document.formCadastro.txtCpf.style.border='1px solid green'}
    else{document.formCadastro.txtCpf.style.border='1px solid red'}
}
function borda_Preccp(){
    if(document.formCadastro.txtPreccp.value!=""){document.formCadastro.txtPreccp.style.border='1px solid green'}
    else{document.formCadastro.txtPreccp.style.border='1px solid red'}
}
function borda_DataNasc(){
    if(document.formCadastro.txtDataNasc.value!=""){document.formCadastro.txtDataNasc.style.border='1px solid green'}
    else{document.formCadastro.txtDataNasc.style.border='1px solid red'}
}
function borda_Escolaridade(){
    if(document.formCadastro.txtEscolaridade.selectedIndex!=0){
        document.formCadastro.txtEscolaridade.style.border='1px solid green';
    }else{
        document.formCadastro.txtEscolaridade.style.border='1px solid red'; 
    }
}
function borda_Cep(){
    if(document.formCadastro.txtCep.value!=""){document.formCadastro.txtCep.style.border='1px solid green'}
    else{document.formCadastro.txtCep.style.border='1px solid red'}
}
function borda_Estado(){
    if(document.formCadastro.txtEstado.selectedIndex!=0){
        document.formCadastro.txtEstado.style.border='1px solid green';
    }else{
        document.formCadastro.txtEstado.style.border='1px solid red'; 
    }
}
function borda_Cidade(){
    if(document.formCadastro.txtCidade.selectedIndex!=0){
        document.formCadastro.txtCidade.style.border='1px solid green';
    }else{
       document.formCadastro.txtCidade.style.border='1px solid red'; 
    }
}
function borda_Bairro(){
    if(document.formCadastro.txtBairro.selectedIndex!=0){
       document.formCadastro.txtBairro.style.border='1px solid green';
    }else{
        document.formCadastro.txtBairro.style.border='1px solid red'; 
    }
}
function borda_Logradouro(){
    if(document.formCadastro.txtLogradouro.value!=""){document.formCadastro.txtLogradouro.style.border='1px solid green'}
    else{document.formCadastro.txtLogradouro.style.border='1px solid red'}
}
function borda_Num(){
    if(document.formCadastro.txtNum.value!=""){document.formCadastro.txtNum.style.border='1px solid green'}
    else{document.formCadastro.txtNum.style.border='1px solid red'}
}
function borda_Fone01(){
    if(document.formCadastro.txtFone01.value!=""){document.formCadastro.txtFone01.style.border='1px solid green'}
    else{document.formCadastro.txtFone01.style.border='1px solid red'}
}
function borda_Email(){
    if(document.formCadastro.txtEmail.value!=""){document.formCadastro.txtEmail.style.border='1px solid green'}
    else{document.formCadastro.txtEmail.style.border='1px solid red'}
}
function borda_Familiar(){
    if(document.formCadastro.txtFamiliar.value!=""){document.formCadastro.txtFamiliar.style.border='1px solid green'}
    else{document.formCadastro.txtFamiliar.style.border='1px solid red'}
}
function borda_ContFamiliar(){
    if(document.formCadastro.txtContFamiliar.value!=""){document.formCadastro.txtContFamiliar.style.border='1px solid green'}
    else{document.formCadastro.txtContFamiliar.style.border='1px solid red'}
}
