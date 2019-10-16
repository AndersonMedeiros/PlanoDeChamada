$(document).ready(function(){
    var options = ["<option value=\"\" select>Selecione o grau de Parentesco...</option>", 
                   "<option value=CONJUGE>CONJUGE</option>",
                   "<option value=FILHO(A)>FILHO(A)</option>",
                   "<option value=PAI>PAI</option>",
                   "<option value=MÃE>MÃE</option>",
                   "<option value=ENTEADO>ENTEADO</option>",
                   "<option value=TUTELADO>TUTELADO</option>"];
    
    $("#txtQtdeDependente").change(function(){
        $("#div_dados_dependente").empty();
        var qtde_dependentes = $("#txtQtdeDependente").val();
        for(var i=0;i<qtde_dependentes;i++){
            $("#div_dados_dependente").append('<div id="div_nome_dependente" class="form-group col-md-6"><label id="lblDependente">Dependente '+(i+1)+'</label><b class="obg"> *</b><input class="form-control" type="text" id="txtNomeDependente'+(i+1)+'" name="txtNomeDependente'+(i+1)+'" onblur="borda_input_text(this.id)"/></div>');
            $("#div_dados_dependente").append('<div id="div_data_nasc_dependente" class="form-group col-md-3"><label id="lblDataNascDependente">Data de Nascimento: '+(i+1)+'</label><b class="obg"> *</b><input class="form-control" type="date" id="txtDataNascDependente'+(i+1)+'" name="txtDataNascDependente'+(i+1)+'" onblur="valida_dataNasc(this.id);" /></div>');
            $("#div_dados_dependente").append('<div id="div_gr_parentesco_dependente" class="form-group col-md-3"><label id="lblGrauParentescoDependente">Grau de Parentesco: '+(i+1)+'</label><b class="obg"> *</b><select class=form-control id="txtGrauParentescoDependente'+(i+1)+'" name="txtGrauParentescoDependente'+(i+1)+'" onblur="borda_input_select(this.id)">'+options+'</select>'); 
        }
    });
   
    
});


function id_input(id){
    return document.getElementById(id);
}



$(document).ready(function(){
    var options = ["<option value=\"\" select>Selecione o grau de Parentesco...</option>", 
                   "<option value=CONJUGE>CONJUGE</option>",
                   "<option value=FILHO(A)>FILHO(A)</option>",
                   "<option value=PAI>PAI</option>",
                   "<option value=MÃE>MÃE</option>",
                   "<option value=ENTEADO>ENTEADO</option>",
                   "<option value=TUTELADO>TUTELADO</option>"];
    var i = (document.querySelectorAll('#fd_dados_dependente div').length - document.querySelectorAll('#fd_dados_dependente .qtd_div').length) + 1;
    
    $("#btnNovoDep").click(function(){
            $("#linha"+i).remove();
            $("#fd_dados_dependente").append('<div id=linha'+i+' class="form-row col-md-12"></div>')
            $("#linha"+i).append('<div id="div_nome_dependente" class="qtd_div form-group col-md-11"><label id="lblDependente">Dependente: </label><b class="obg"> *</b><input class="form-control" type="text" id="txtNomeDependente'+i+'" name="txtNomeDependente" onblur="borda_input_text(this.id)"/></div>');
            $("#linha"+i).append('<div id="div_data_nasc_dependente" class="qtd_div form-group col-md-4"><label id="lblDataNascDependente">Data de Nascimento: </label><b class="obg"> *</b><input class="form-control" type="date" id="txtDataNascDependente'+i+'" name="txtDataNascDependente" onblur="valida_dataNasc(this.id);" /></div>');
            $("#linha"+i).append('<div id="div_cpf_dependente" class="qtd_div form-group col-md-3"><label id="lblCpfDependente">CPF: </label><b class="obg"> *</b><input class="form-control cpf"  type="text" id="txtCpfDependente'+i+'" name="txtCpfDependente" id="cpf" placeholder="Ex.: 000.000.000-00" onblur="return valida_cpf(this.id);" onkeypress="return somenteNumero(event);"/> </div>');
            $("#linha"+i).append('<div id="div_gr_parentesco_dependente" class="qtd_div form-group col-md-4"><label id="lblGrauParentescoDependente">Grau de Parentesco: </label><b class="obg"> *</b><select class=form-control id="txtGrauParentescoDependente'+i+'" name="txtGrauParentescoDependente" onblur="borda_input_select(this.id)">'+options+'</select></div>'); 
            $("#linha"+i).append('<div id='+i+' style="margin: auto auto;">'+"<button id="+i+" type=\"button\" class=\"btn btn-danger\" style=\"margin-right: 10px;\" onclick=\"removeLinha(this.id)\">"+
                                                    "<i class=\"glyphicon glyphicon-remove\"></i>"+
                                                    "</button>"+'</div>');
                                                
        i++;  
    });    
});

function removeLinha(id){
    var linha = document.getElementById(id).id;
    
    var pai = document.getElementById("fd_dados_dependente");
   
    var filho = document.getElementById("linha"+linha);
    
    pai.removeChild(filho);
}

function getElementos(){
    var qtde = document.querySelectorAll('#linha_dados_dependente div').length - document.querySelectorAll('#linha_dados_dependente .qtd_div').length;
   
    alert("<div> = "+qtde);
}





