function checkedFilho(){
    var checkBox = document.getElementById("checkboxFilho");

    if(checkBox.checked == true){
        document.getElementById("div_qtde_filho").style.display = "block";
        document.getElementById("div_dados_filho").style.display = "block";
    }else{
        document.getElementById("div_qtde_filho").style.display = "none";
        document.getElementById("div_dados_filho").style.display = "none";
    }
}

function checkedEsposa(){
    var checkBox = document.getElementById("checkboxEsposa");

    if(checkBox.checked == true){
        document.getElementById("div_dados_esposa").style.display = "block";
    }else{
        document.getElementById("div_dados_esposa").style.display = "none";
    }
}
                            
function limpa_div_dados_filho(){
    document.getElementById("div_dados_filho").innerHTML="";
}

function qtdeFilho(){                               
    var div_dados_filho = document.getElementById("div_dados_filho");

    var qtdeFilho = document.formCadastro.txtNumFilho.value;

    for(var i=0;i<qtdeFilho;i++){

        var div_nome_filho = document.createElement("div");
        div_nome_filho.id = "div_nome_filho";
        div_nome_filho.className = "form-group col-md-9";

        var label_nome_filho = document.createElement("label");
        label_nome_filho.id = "lblFilho";
        label_nome_filho.for = "lblFilho";
        label_nome_filho.innerHTML = "Filho "+(i+1)+": ";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_nome_filho = document.createElement("input");
        input_nome_filho.className = "form-control";
        input_nome_filho.type = "text";
        input_nome_filho.name = "txtFilho";

        div_nome_filho.appendChild(label_nome_filho);
        div_nome_filho.appendChild(obg);
        div_nome_filho.appendChild(input_nome_filho);

        var div_data_nasc_filho = document.createElement("div");
        div_data_nasc_filho.id="div_data_nasc_filho";
        div_data_nasc_filho.className = "form-group col-md-3";

        var label_data_nasc_filho = document.createElement("label");
        label_data_nasc_filho.id="lblDataNascFilho";
        label_data_nasc_filho.innerHTML = "Data de Nascimento:";

        var obg = document.createElement("b");
        obg.className = "obg";
        obg.innerHTML = " *";

        var input_data_nasc_filho = document.createElement("input");
        input_data_nasc_filho.type = "date";
        input_data_nasc_filho.className = "form-control";
        input_data_nasc_filho.name = "txtDataNascFilho";

        div_data_nasc_filho.appendChild(label_data_nasc_filho);
        div_data_nasc_filho.appendChild(obg);
        div_data_nasc_filho.appendChild(input_data_nasc_filho);

        div_dados_filho.appendChild(div_nome_filho);
        div_dados_filho.appendChild(div_data_nasc_filho);
    }
}