$(document).ready(function () {
  
    $.getJSON('json/estados_cidades.json', function (data) {
        var items = [];
        var id_est = 1;
        var options = '<option value="0">Selecione o seu estado de nacionalidade...</option>';	
        $.each(data, function (key, val) {
            options += '<option value="' + id_est + '">' + val.nome + '</option>';
            id_est++;
        });					
        $("#estados").html(options);				

        $("#estados").change(function () {				
            var options_cidades = '';
            var id_cid = 1;
            var str = "";					

            $("#estados option:selected").each(function () {
                str += $(this).text();
            });

            $.each(data, function (key, val) {
                if(val.nome == str) {							
                    $.each(val.cidades, function (key_city, val_city) {
                        options_cidades += '<option value="' + id_cid + '">' + val_city + '</option>';
                        id_cid++;
                    });							
                }
            });
            $("#cidades").html(options_cidades);

        }).change();		
    });
});