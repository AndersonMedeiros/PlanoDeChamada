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
        <script src="js/validacao_de_campos.js" type="text/javascript"></script>
        <title>Cadastro de Militares - Login</title>
    </head>
    
    <body class="tela col-md-12">
        
        <div class="form-login col-md-2">
                <%
                    if(request.getParameter("x")!=null){
                        String x = request.getParameter("x");
                        if(x.equals("erro-login")){
                            out.println("<div class=\"div-erro-login col-md-12\">"+
                                        "<center><p>Identidade Inválida!<br>Tente Novamente.</p></center>"+
                                        "</div>");
                        }
                        else if(x.equals("erro-senha")){
                            out.println("<div class=\"div-erro-login col-md-12\">"+
                                        "<center><p>Senha Inválida!<br>Tente Novamente.</p></center>"+
                                        "</div>");
                        }
                        else if(x.equals("erro-login-senha")){
                            out.println("<div class=\"div-erro-login col-md-12\">"+
                                        "<center><p>Identidade e Senha Inválida!<br>Tente Novamente.</p></center>"+
                                        "</div>");
                        }else if(x.equals("cadastro-sucesso")){
                            out.println("<div class=\"div-cad-sucesso col-md-12\">"+
                                        "<center><p>Cadastro realizado com sucesso.</p></center>"+
                                        "</div>");
                        }
                    }
                %>

                <h1 id="titulo">Cadastro de Militares</h1>
                
                <img id="icone" src="img/CigsFinal.gif" class="img-responsiva" width="100px" />
                <br>
                <form name="formLogin" id="formLogin" method="post" action="autenticador">
                    <div class="form-group">
                        <label id="lblIdentidade" name="lblIdentidade" for="lblIdentidade">Identidade: </label>
                        <input class="form-control identidade input" type="text" name="txtIdentidade" id="txtIdentidade" maxlength="10" onkeypress="return somenteNumero(event);" required/>
                    </div>
                    
                    <div class="form-group"
                        <label id="lblSenha" name="lblSenha" for="lblSenha">Senha: </label>
                        <input class="form-control input" type="password" name="txtSenha" id="txtSenha" maxlength="20" required/>
                    </div>
                    <br>
                    <button type="submit" id="btnEntrar" class="" value="Entrar"> Entrar</button>
                    
                    <button type="button" id="btnCadastro" class="" value="Cadastrar" onclick="location.href='Cadastro.jsp'"> Cadastrar</button>
                </form>
        </div>
    </body>
</html>
