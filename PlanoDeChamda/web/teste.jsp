<%-- 
    Document   : teste
    Created on : 26/02/2019, 10:51:24
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/manipulacao_campos.js" type="text/javascript"></script>
        <title>vai</title>
    </head>
    <body>
        <form name="formAtualizacao" method="post" action="atualizar" onsubmit="return validacao_att()">
         <input class="form-control" type="number" name="txtQtdeDependente" min="0" max="50" onchange="limpa_div_dados_dependente(); qtdeDependente_att();" onkeypress="return somenteNumero(event);"/>
        <div class="form-group col-md-12" id="div_qtde_dependente" style="display: none;">
                                                <center>
                                                <label id="lblNumDependente" name="lblQtdeDependente" for="lblQtdeDependente">Quantidade de Dependente: </label><b class="obg"> *</b>
                                                <input class="form-control" type="number" name="txtQtdeDependente" min="0" max="50" onchange="limpa_div_dados_dependente(); qtdeDependente_att();" onkeypress="return somenteNumero(event);"/>
                                                </center>
                                                </div>
                                    
                                                
                                    
                                    
                                                <div id="div_dados_dependente" style="display: block;"> ccc</div>
        </form>
    </body>
</html>
