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
        <link href="../css/estilo_emitir_relatorio.css" rel="stylesheet"/>
        
        
        
        <link href="../bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet"/>
        
        <script type="text/javascript" src="../js/comportamento_pagina.js"></script>
        <script src="../js/manipulacao.js" type="text/javascript"></script>
        <script src="../js/validacao_de_campos.js" type="text/javascript"></script>
        <title>Cadastro de Militares - Emissão de Relatório</title>
    </head>
    <body class="tela">
        <% 
            HttpSession sessao = request.getSession();
            Militar mil_logado = null;
            int grp_acesso = 0;
            if(sessao.getAttribute("militarAutenticado").equals("sti")){
                grp_acesso=1;
            }else{
                mil_logado = (Militar)sessao.getAttribute("militarAutenticado");
            }
        %>
        <header class="header">
            <img src="../img/cabeçalho.jpeg" class="img-responsive" width="100%">
            <div class="row">
                    <div class="col-md-12">                        
                        <nav class="navbar navbar-dark navbar-expand-lg navbar-expand-md" style="background-color: #3D660E;">
                            <!--<a class="navbar-brand" href="#">Navbar</a>-->
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav mr-auto">
                                    <%
                                        if(grp_acesso == 1){
                                            
                                            out.println("<li class='nav-item dropdown'>"+
                                                        "   <a class='nav-link dropdown-toggle' href='militares.jsp?id_sit=1' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
                                                        "       Militares"+
                                                        "   </a>"+
                                                        "   <div class='dropdown-menu' aria-labelledby='navbarDropdown'>"+
                                                        "       <a class='dropdown-item' href='militares.jsp?id_sit=1'>Ativos</a>"+
                                                        "       <a class='dropdown-item' href='militares.jsp?id_sit=2'>Inativos</a>"+                                
                                                        "   </div>"+
                                                        "</li>");

                                            out.println("<li class='nav-item active'>"+
                                                        "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                        "</li>");
                                        }else if(mil_logado.getId_grp_acesso() == 1){
                                                out.println("<li class='nav-item'>"+
                                                            "   <a class=nav-link href=Atualizacao.jsp?idt="+mil_logado.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
                                                            "</li>");
                                                out.println("<li class='nav-item dropdown'>"+
                                                            "   <a class='nav-link dropdown-toggle' href='militares.jsp?id_sit=1' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+
                                                            "       Militares"+
                                                            "   </a>"+
                                                            "   <div class='dropdown-menu' aria-labelledby='navbarDropdown'>"+
                                                            "       <a class='dropdown-item' href='militares.jsp?id_sit=1'>Ativos</a>"+
                                                            "       <a class='dropdown-item' href='militares.jsp?id_sit=2'>Inativos</a>"+                                
                                                            "   </div>"+
                                                            "</li>");
                                                out.println("<li class='nav-item active'>"+
                                                            "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                            "</li>");
                                        }else if(mil_logado.getId_grp_acesso() == 2){
                                            out.println("<li class='nav-item'>"+
                                                        "   <a class=nav-link href=Atualizacao.jsp?idt="+mil_logado.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
                                                        "</li>");                                          

                                            out.println("<li class='nav-item active'>"+
                                                        "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                        "</li>");
                                        }else if(mil_logado.getId_grp_acesso() == 3){
                                            out.println("<li class='nav-item'>"+
                                                        "   <a class=nav-link href=Atualizacao.jsp?idt="+mil_logado.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
                                                        "</li>");
                                        }

                                    %>

                                    
                                    <!--<li class="nav-item">
                                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                                    </li>-->
                                </ul>
                                <form class="form-inline my-2 my-lg-0" name="formSair" method="post" action="sair">
                                    <!--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
                                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: white; border-color: white;">Sair</button>
                                    <!--<li><form name="formSair" method="post" action="sair"><button class="btn-sair" type="submit">Sair</button></form></li>-->
                                </form>
                            </div>
                        </nav>
                    </div>
                </div>
            
        </header>
        
        <section class="container">
            
            
            <label style="font-size: 18px;">Selecione as opções desejadas: </label><b class="obg"> *</b>
            <form name="formRelatorio" method="post" onsubmit="return validacao_emitir_relatorio();">
                <%
                    DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();
                    PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
                    QasQmsDAO qasqmsDAO = new QasQmsDAO();  
                %>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label id="lblDivSec" name="lblDivSec" for="lblDivSec">Divisão/Seção: </label><b class="obg"> *</b>
                        <%
                            int qtdeDivSec = dsDAO.getDivSec().size();

                            for(int i=0;i<qtdeDivSec;i++){
                                out.println("<div class=\"custom-control custom-radio\">"+                                        
                                            "<input type=radio name=txtDivSec id=divsec"+i+1+" class=custom-control-input value='"+dsDAO.getDivSec().get(i).getId()+"' required>"+
                                            "<label class=custom-control-label tipo-relatorio for=divsec"+i+1+">"+dsDAO.getDivSec().get(i).getNome()+  
                                            "</label>"+
                                            "</div>");
                            } 
                        %>
                        <div class="custom-control custom-radio">
                            <input type="radio" name="txtDivSec" id="divsec" value="0" class="custom-control-input"> 
                            <label class="custom-control-label tipo-relatorio" for="divsec"><b>TODOS</b></label>
                        </div>
                    </div>
                    


                    <div class="form-group col-md-4">
                        <label id="lblPostGrad" name="lblPostGrad" for="lblPostGrad">Posto/Graduação: </label><b class="obg"> * </b>

                            <%
                                int qtdePGS = pgDAO.getPostGrads().size();

                                for(int i=0;i<qtdePGS;i++){
                                    out.println("<div class=\"custom-control custom-radio\">"+
                                                "<input type=radio name=txtPostGrad id=postgrad"+i+1+" class=\"custom-control-input\" value='"+pgDAO.getPostGrads().get(i).getId()+"' required>"+
                                                "<label class=custom-control-label tipo-relatorio for=postgrad"+i+1+">"+pgDAO.getPostGrads().get(i).getNome()+
                                                "</label>"+
                                                "</div>");

                                } 
                            %>

                            <div class="custom-control custom-radio">
                                <input type="radio" name="txtPostGrad" id="postgrad" value="0" class="custom-control-input"> 
                                <label class="custom-control-label tipo-relatorio" for="postgrad"><b>TODOS</b></label>
                            </div>
                    </div>

                    <div class="form-group col">
                        <label id="lblQasQms" name="lblQasQms" for="lblQasQms">QAS/QMS: </label><b class="obg"> *</b>
                            <%
                                int qtdeArmas = qasqmsDAO.getArmas().size();

                                for(int i=0;i<qtdeArmas;i++){
                                    out.println("<div class=\"custom-control custom-radio\">"+                                            
                                                "<input type=radio name=txtQasQms id=qasqms"+i+1+" class=custom-control-input value='"+qasqmsDAO.getArmas().get(i).getId()+"' required>"+
                                                "<label class=custom-control-label tipo-relatorio for=qasqms"+i+1+">"+qasqmsDAO.getArmas().get(i).getDesc()+    
                                                "</label>"+
                                                "</div>");
                                } 
                            %>
                            <div class="custom-control custom-radio">
                                <input type="radio" name="txtQasQms" id="qasqms" value="0" class="custom-control-input"> 
                                <label class="custom-control-label tipo-relatorio" for="qasqms"><b>TODOS</b></label>
                            </div>.
                    </div>
                </div>
                <div class="linha-botoes col-md-12">
                <!--<button type="submit" class="btn-cent" formaction="EmitirRelatorio">Gerar Relatório na Tela</button>-->
                <button type="submit" class="btn-cent" formaction="gerarRelatorio">Gerar Relatório em PDF</button>
                </div>
            </form>
            </div>
        </section>
           
        <footer class="rodape col-md-12">
            <p>Desenvolvido pela Seção de Tecnologia da Informação - 2019</p>
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
