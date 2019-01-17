<%-- 
    Document   : index
    Created on : 05/12/2018, 14:26:48
    Author     : ander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" type="text/css" rel="stylesheet"/>
        <link href="css/estilo_login.css" type="text/css" rel="stylesheet"/>
        <title>Plano de Chamada - Login</title>
    </head>
    
    <body class="tela col-12">
        <div class="form-login col-2">
                <h1 id="titulo">Plano de Chamada</h1>
                
                <img id="icone" src="img/telefone.png" class="img-responsiva" width="100px" height="100px"/>
                
                <form name="formLogin" id="formLogin" method="post" action="autenticador">
                    <div class="form-group">
                        <label id="lblIdentidade" name="lblIdentidade" for="lblIdentidade">Identidade: </label>
                        <input class="form-control identidade input" type="text" name="txtIdentidade" id="txtIdentidade" maxlength="30" onkeypress="return somenteNumero(event);" required/>
                    </div>
                    <div class="form-group"
                        <label id="lblSenha" name="lblSenha" for="lblSenha">Senha: </label>
                        <input class="form-control input" type="password" name="txtSenha" id="txtSenha" maxlength="20" required/>
                    </div>
                        
                    <div class="linha-botoes col-12">
                        <a href="Cadastro.jsp" type="submit" id="btnCad" class="btn" value="Cadastrar"></a> 
                        <button type="submit" id="btnEnt" class="btn" value="Entrar"></button>    
                    </div>
                </form>
        </div>
    </body>
</html>
