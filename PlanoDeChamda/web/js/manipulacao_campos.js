function checkedDependente(){
    var checkBox = document.getElementById("checkboxDependente");

    if(checkBox.checked == true){
        document.getElementById("div_qtde_dependente").style.display = "block";
        document.getElementById("div_dados_dependente").style.display = "block";
    }else{
        document.getElementById("div_qtde_dependente").style.display = "none";
        document.getElementById("div_dados_dependente").style.display = "none";
    }
}

function checkedConjuge(){
    var checkBox = document.getElementById("checkboxConjuge");

    if(checkBox.checked == true){
        document.getElementById("div_dados_conjuge").style.display = "block";
    }else{
        document.getElementById("div_dados_conjuge").style.display = "none";
    }
}
                            
function limpa_div_dados_dependente(){
    document.getElementById("div_dados_dependente").innerHTML="";
}

function qtdeDependente_cad(){                               
    var div_dados_dependente = document.getElementById("div_dados_dependente");

    var qtdeDependente = document.formCadastro.txtQtdeDependente.value;

    for(var i=0;i<qtdeDependente;i++){
        //Nome Dependente
        var div_nome_dependente = document.createElement("div");
        div_nome_dependente.id = "div_nome_dependente";
        div_nome_dependente.className = "form-group col-md-6";

        var label_nome_dependente = document.createElement("label");
        label_nome_dependente.id = "lblDependente";
        label_nome_dependente.for = "lblDependente"
        label_nome_dependente.innerHTML = "Dependente "+(i+1)+": ";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_nome_dependente = document.createElement("input");
        input_nome_dependente.className = "form-control";
        input_nome_dependente.type = "text";
        input_nome_dependente.name = "txtNomeDependente"+(i+1);

        div_nome_dependente.appendChild(label_nome_dependente);
        div_nome_dependente.appendChild(obg);
        div_nome_dependente.appendChild(input_nome_dependente);
        
        //Data de Nascimento Dependente
        var div_data_nasc_dependente = document.createElement("div");
        div_data_nasc_dependente.id="div_data_nasc_dependente";
        div_data_nasc_dependente.className = "form-group col-md-3";

        var label_data_nasc_dependente = document.createElement("label");
        label_data_nasc_dependente.id="lblDataNascDependente";
        label_data_nasc_dependente.innerHTML = "Data de Nascimento:";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_data_nasc_dependente = document.createElement("input");
        input_data_nasc_dependente.type = "date";
        input_data_nasc_dependente.className = "form-control";
        input_data_nasc_dependente.name = "txtDataNascDependente"+(i+1);

        div_data_nasc_dependente.appendChild(label_data_nasc_dependente);
        div_data_nasc_dependente.appendChild(obg);
        div_data_nasc_dependente.appendChild(input_data_nasc_dependente);
        
        //Grau de Parentesco Dependente
        var div_gr_parentesco_dependente = document.createElement("div");
        div_gr_parentesco_dependente.id="div_gr_parentesco_dependente";
        div_gr_parentesco_dependente.className = "form-group col-md-3";

        var label_gr_parentesco_dependente = document.createElement("label");
        label_gr_parentesco_dependente.id="lblGrauParentescoDependente";
        label_gr_parentesco_dependente.innerHTML = "Grau de Parentesco:";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_gr_parentesco_dependente = document.createElement("input");
        input_gr_parentesco_dependente.type = "text";
        input_gr_parentesco_dependente.className = "form-control";
        input_gr_parentesco_dependente.name = "txtGrauParentescoDependente"+(i+1);
       

        div_gr_parentesco_dependente.appendChild(label_gr_parentesco_dependente);
        div_gr_parentesco_dependente.appendChild(obg);
        div_gr_parentesco_dependente.appendChild(input_gr_parentesco_dependente);
        
        div_dados_dependente.appendChild(div_nome_dependente);
        div_dados_dependente.appendChild(div_data_nasc_dependente);
        div_dados_dependente.appendChild(div_gr_parentesco_dependente);
    }
    
    function qtdeDependente_att(){                               
        var div_dados_dependente = document.getElementById("div_dados_dependente");

        var qtdeDependente = document.formAtualizacao.txtQtdeDependente.value;

        for(var i=0;i<qtdeDependente;i++){
            //Nome Dependente
            var div_nome_dependente = document.createElement("div");
            div_nome_dependente.id = "div_nome_dependente";
            div_nome_dependente.className = "form-group col-md-6";

            var label_nome_dependente = document.createElement("label");
            label_nome_dependente.id = "lblDependente";
            label_nome_dependente.for = "lblDependente"
            label_nome_dependente.innerHTML = "Dependente "+(i+1)+": ";

            var obg = document.createElement("b");
            obg.className = "obg";
            obg.innerHTML = " *";

            var input_nome_dependente = document.createElement("input");
            input_nome_dependente.className = "form-control";
            input_nome_dependente.type = "text";
            input_nome_dependente.name = "txtNomeDependente"+(i+1);

            div_nome_dependente.appendChild(label_nome_dependente);
            div_nome_dependente.appendChild(obg);
            div_nome_dependente.appendChild(input_nome_dependente);

            //Data de Nascimento Dependente
            var div_data_nasc_dependente = document.createElement("div");
            div_data_nasc_dependente.id="div_data_nasc_dependente";
            div_data_nasc_dependente.className = "form-group col-md-3";

            var label_data_nasc_dependente = document.createElement("label");
            label_data_nasc_dependente.id="lblDataNascDependente";
            label_data_nasc_dependente.innerHTML = "Data de Nascimento:";

            var obg = document.createElement("b");
            obg.className = "obg";
            obg.innerHTML = " *";

            var input_data_nasc_dependente = document.createElement("input");
            input_data_nasc_dependente.type = "date";
            input_data_nasc_dependente.className = "form-control";
            input_data_nasc_dependente.name = "txtDataNascDependente"+(i+1);

            div_data_nasc_dependente.appendChild(label_data_nasc_dependente);
            div_data_nasc_dependente.appendChild(obg);
            div_data_nasc_dependente.appendChild(input_data_nasc_dependente);

            //Grau de Parentesco Dependente
            var div_gr_parentesco_dependente = document.createElement("div");
            div_gr_parentesco_dependente.id="div_gr_parentesco_dependente";
            div_gr_parentesco_dependente.className = "form-group col-md-3";

            var label_gr_parentesco_dependente = document.createElement("label");
            label_gr_parentesco_dependente.id="lblGrauParentescoDependente";
            label_gr_parentesco_dependente.innerHTML = "Grau de Parentesco:";

            var obg = document.createElement("b");
            obg.className = "obg";
            obg.innerHTML = " *";

            var input_gr_parentesco_dependente = document.createElement("input");
            input_gr_parentesco_dependente.type = "text";
            input_gr_parentesco_dependente.className = "form-control";
            input_gr_parentesco_dependente.name = "txtGrauParentescoDependente"+(i+1);


            div_gr_parentesco_dependente.appendChild(label_gr_parentesco_dependente);
            div_gr_parentesco_dependente.appendChild(obg);
            div_gr_parentesco_dependente.appendChild(input_gr_parentesco_dependente);

            div_dados_dependente.appendChild(div_nome_dependente);
            div_dados_dependente.appendChild(div_data_nasc_dependente);
            div_dados_dependente.appendChild(div_gr_parentesco_dependente);
        }
    }
}