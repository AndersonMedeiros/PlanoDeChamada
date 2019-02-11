<%-- 
    Document   : EmitirRelatorio
    Created on : 21/01/2019, 14:39:26
    Author     : ander
--%>

<%@page import="bean.DadosCheckBox"%>
<%@page import="bean.QasQms"%>
<%@page import="bean.PostoGraduacao"%>
<%@page import="bean.DivisaoSecao"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="dao.DivisaoSecaoDAO"%>
<%@page import="dao.BairroDAO"%>
<%@page import="dao.MilitarDAO"%>
<%@page import="bean.Militar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilo.css" rel="stylesheet"/>
        <link href="../css/estilo_cadastro.css" rel="stylesheet"/>
        
        
        
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"/>
        <script type="text/javascript" src="../js/comportamento_pagina.js"></script>
        <script src="../js/manipulacao.js" type="text/javascript"></script>
        <script src="../js/validacao_de_campos.js" type="text/javascript"></script>
        <title>Plano de Chamada - Emissão de Relatório</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="../img/background-topo.png" class="img-responsive">
            <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-default" style="margin-top: 0; margin-bottom: 15px;">
                            <div class="container-fluid">
                              <!-- Brand and toggle get grouped for better mobile display -->
                              <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                  <span class="sr-only">Toggle navigation</span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                  <span class="icon-bar"></span>
                                </button>
                              </div>

                              <!-- Collect the nav links, forms, and other content for toggling -->
                              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin-bottom: 0px;">
                                <ul class="nav navbar-nav">
                                    <li class=""><a href="Atualizacao.jsp">Atualizar Dados <span class="sr-only">(current)</span></a></li>
                                    <li class="active"><a href="EmitirRelatorio.jsp">Emitir Relatório <span class="sr-only">(current)</span></a></li>
                                    
                                  
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                 
                                    <li><form name="formSair" method="post" action="sair"><button class="btn-sair" type="submit">Sair</button></form></li>
                                </ul>
                              </div><!-- /.navbar-collapse -->
                            </div><!-- /.container-fluid -->
                          </nav>
                    </div>
                </div>
            
        </header>
        
        <section class="container area-form">
            
            <label style="font-size: 18px;">Selecione as opções desejadas: </label><b class="obg"> *</b>
            <form name="formRelatorio" method="post" onsubmit="return validacao_emitir_relatorio();">
                <%
                    DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();
                    PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
                    QasQmsDAO qasqmsDAO = new QasQmsDAO();  
                %>
                <div class="form-group col-md-4">
                    <label id="lblDivSec" name="lblDivSec" for="lblDivSec">Divisão/Seção: </label><b class="obg"> *</b>
                    <%
                        int qtdeDivSec = dsDAO.getDivSec().size();

                        for(int i=0;i<qtdeDivSec;i++){
                            out.println("<br>"+
                                        "<label class=\"radio-inline tipo-relatorio\">"+
                                        "<input type=\"radio\" name=\"txtDivSec\" id=\"divsec\" value='"+dsDAO.getDivSec().get(i).getId()+"' required>"+dsDAO.getDivSec().get(i).getNome()+
                                        "</label>");
                        } 
                    %>
            </div>

            <div class="form-group col-md-4">
                <label id="lblPostGrad" name="lblPostGrad" for="lblPostGrad">Posto/Graduação: </label><b class="obg"> *</b>

                    <%
                        int qtdePGS = pgDAO.getPostGrads().size();

                        for(int i=0;i<qtdePGS;i++){
                            out.println("<br>"+
                                        "<label class=\"radio-inline tipo-relatorio\">"+
                                        "<input type=\"radio\" name=\"txtPostGrad\" id=\"divsec\" value='"+pgDAO.getPostGrads().get(i).getId()+"' required>"+pgDAO.getPostGrads().get(i).getNome()+
                                        "</label>");
                        } 
                    %>
                    <br>
                    <label class="radio-inline tipo-relatorio">
                        <input type="radio" name="txtPostGrad" id="postgrad" value="0"> <b>Todos</b>
                    </label>
            </div>

            <div class="form-group col-md-4">
                <label id="lblQasQms" name="lblQasQms" for="lblQasQms">QAS/QMS: </label><b class="obg"> *</b>
                    <%
                        int qtdeArmas = qasqmsDAO.getArmas().size();

                        for(int i=0;i<qtdeArmas;i++){
                            out.println("<br>"+
                                        "<label class=\"radio-inline tipo-relatorio\">"+
                                        "<input type=\"radio\" name=\"txtQasQms\" id=\"divsec\" value='"+qasqmsDAO.getArmas().get(i).getId()+"' required>"+qasqmsDAO.getArmas().get(i).getDesc()+
                                        "</label>");
                        } 
                    %>
                    <br>
                    <label class="radio-inline tipo-relatorio">
                        <input type="radio" name="txtQasQms" id="qasqms" value="0"> <b>Todos</b>
                    </label>
                </div>
                    <div class="linha-botoes col-md-12">
                    <!--<button type="submit" class="btn-cent" formaction="EmitirRelatorio">Gerar Relatório na Tela</button>-->
                    <button type="submit" class="btn-cent" formaction="gerarRelatorio">Gerar Relatório em PDF</button>
                </div>
            </form>
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
        <script type="text/javascript" src="js/preenchimento-endereco.js"></script>
        <script type="text/javascript" src="js/manipulacao.js"></script>  
    </body>
</html>
