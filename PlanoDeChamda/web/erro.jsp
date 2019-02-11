<%-- 
    Document   : erro
    Created on : 16/01/2019, 21:35:17
    Author     : de_paula
--%>

<%@page import="bean.Cidade"%>
<%@page import="dao.BairroDAO"%>
<%@page import="bean.Bairro"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="bean.Escolaridade"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="bean.QasQms"%>
<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="bean.PostoGraduacao"%>
<%@page import="dao.DivisaoSecaoDAO"%>
<%@page import="bean.DivisaoSecao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
        <link href="css/estilo_erro.css" rel="stylesheet"/>
        <link href="css/estilo.css" rel="stylesheet"/>
        
        <script type="text/javascript" src="js/validacao_de_campos.js"></script>
        <title>Plano de Chamada - Página de Erro</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="img/background-topo.png" class="img-responsive"/>

        </header>
        <section class="area-erro">
        <%
            if(request.getParameter("x") != null){
                String erro = request.getParameter("x");
                if(erro.equals("sessao-encerrada")){
                    out.println("<center>"+
                                "<h1 class=\"titulo-erro\">Erro de Sessão: </h1>"+
                                "<p class=\"descricao-erro\">Sessão encerrada!</p>"+
                                "<b class=\"solucao-erro\"><a href=\"index.jsp\" class=\"solucao-erro\">Realize o login novamente aqui.</a></b>"+
                                "</center>");
                }
                else if(erro.equals("cadastro-duplicado")){
                    out.println("<center>"+
                                "<h1 class=\"titulo-erro\">Cadastro Duplicado: </h1>"+
                                "<p class=\"descricao-erro\">Olá, você já tem seus dados cadastrados em nossa base de dados, se precisar atualizar alguma informação faça login e realize as mesmas.</p>"+
                                "<b class=\"solucao-erro\"><a href=\"index.jsp\" class=\"solucao-erro\">Realize o login aqui.</a></b>"+
                                "</center>");
                }
            }
            
        %>
        
        
        </section>
        <footer class="rodape col-md-12">
            <p>Desenvolvido pela Seção de Tecnologia da Informação - 2018</p>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
            
        <script src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="js/mascaras.js"></script>
        
    </body>
</html>
