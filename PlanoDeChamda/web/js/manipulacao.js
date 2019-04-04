$(document).ready(function(){
    var options = ["<option value=0 select>Selecione o grau de Parentesco...</option>", 
                   "<option value=1>Conjuge</option>",
                   "<option value=2>Filho(a)</option>",
                   "<option value=3>Pai</option>",
                   "<option value=4>Mãe</option>"];
    
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
    var options = ["<option value=0 select>Selecione o grau de Parentesco...</option>", 
                   "<option value=Conjuge>Conjuge</option>",
                   "<option value=Filho(a)>Filho(a)</option>",
                   "<option value=Pai>Pai</option>",
                   "<option value=Mãe>Mãe</option>"];
    var i = (document.querySelectorAll('#fd_dados_dependente div').length - document.querySelectorAll('#fd_dados_dependente .qtd_div').length) + 1;
    
    $("#btnNovoDep").click(function(){
            $("#linha"+i).remove();
            $("#fd_dados_dependente").append('<div id=linha'+i+' class="col-md-12" style="padding-left: 0;"></div>')
            $("#linha"+i).append('<div id="div_nome_dependente" class="qtd_div form-group col-md-5"><label id="lblDependente">Dependente: </label><b class="obg"> *</b><input class="form-control" type="text" id="txtNomeDependente'+i+'" name="txtNomeDependente" onblur="borda_input_text(this.id)"/></div>');
            $("#linha"+i).append('<div id="div_data_nasc_dependente" class="qtd_div form-group col-md-3"><label id="lblDataNascDependente">Data de Nascimento: </label><b class="obg"> *</b><input class="form-control" type="date" id="txtDataNascDependente'+i+'" name="txtDataNascDependente" onblur="valida_dataNasc(this.id);" /></div>');
            $("#linha"+i).append('<div id="div_gr_parentesco_dependente" class="qtd_div form-group col-md-3"><label id="lblGrauParentescoDependente">Grau de Parentesco: </label><b class="obg"> *</b><select class=form-control id="txtGrauParentescoDependente'+i+'" name="txtGrauParentescoDependente" onblur="borda_input_select(this.id)">'+options+'</select></div>'); 
            $("#linha"+i).append('<div id='+i+' class="qtd_div form-group col-md-1"><span id='+i+' class="glyphicon-geral glyphicon-remove form-control-feedback-remove btn-remove" aria-hidden="true" onclick="getId(this.id)"></span></div>')
            
        i++;  
    });
});

function getId(id){
    var linha = document.getElementById(id).id;
    
    var pai = document.getElementById("fd_dados_dependente");
   
    var filho = document.getElementById("linha"+linha);
    
    pai.removeChild(filho);
}

function getElementos(){
    var qtde = document.querySelectorAll('#fd_dados_dependente div').length - document.querySelectorAll('#fd_dados_dependente .qtd_div').length;
   
    alert("<div> = "+qtde);
}





