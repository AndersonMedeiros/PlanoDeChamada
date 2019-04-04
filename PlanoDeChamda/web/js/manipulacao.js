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

