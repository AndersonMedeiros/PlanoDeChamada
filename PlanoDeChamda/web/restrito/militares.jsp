<%-- 
    Document   : militares
    Created on : 15/04/2019, 12:31:10
    Author     : root
--%>

<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="bean.PostoGraduacao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MilitarDAO"%>
<%@page import="bean.Militar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet"/>
        <link href="css/estilo_militares.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="js/teste.js" type="text/javascript"></script>
        <title>Cadastro de Militares - Militares</title>
    </head>
    <body>
        <header class="header">
            <img src="img/cabeçalho.jpeg" class="img-responsive" width="100%"/>

            <nav class="navbar navbar-dark navbar-expand-lg navbar-expand-md" style="background-color: #3D660E;">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Militares <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Dropdown
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" name="formSair" method="post" action="sair">
                        <!--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">-->
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="color: white; border-color: white;">Sair</button>
                        <!--<li><form name="formSair" method="post" action="sair"><button class="btn-sair" type="submit">Sair</button></form></li>-->
                    </form>
                </div>
            </nav>
        </header>
        
    </body>
    <section class="container col-md-12">
        <label for="nomeMilitar">Nome do Militar</label>

       <center>
            <div class="table-responsive-xl table-responsive-lg table-responsive-md col-md-10">
                <div class="row justify-content-end">
                    <div class="input-group col-md-6">
                        <div class="input-group-prepend">
                           <span class="input-group-text"><i class="glyphicon glyphicon-search"></i></span>
                        </div>
                        <input name="consulta" id="txt_consulta" type="text" class="form-control" placeholder="Nome do Militar" required="">
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>
                <br>
                <table id="tabela" class="table table-responsive-xl table-responsive-lg table-responsive-md table-striped">
                    <thead class="thead-dark" >
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Identidade</th>
                            <th scope="col">Posto/Graduação</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Militar mil = new Militar();
                            MilitarDAO milDAO = new MilitarDAO();
                            PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
                            ArrayList<Militar> militares = milDAO.getMilitares();
                            int qtdeMil = milDAO.getMilitares().size();
                            String identidade = "N/A";
                            for(int i=0;i<qtdeMil;i++){
                                out.println("<tr>");
                                out.println("<th scope=\"row\">"+(i+1)+"</th>");
                                if(!militares.get(i).getIdentidade().equals("")){identidade = militares.get(i).getIdentidade();}else{identidade="N/A";}
                                out.println("<td>"+identidade+"</td>");
                                out.println("<td>"+pgDAO.getPostGradByID(militares.get(i).getId_pg()).getSigla()+"</td>");
                                out.println("<td>"+militares.get(i).getNome()+"</td>");
                                out.println("<td>"+
                                            "<div class=\"btn-group\">"+
                                                "<button id="+identidade+" type=\"button\" class=\"btn btn-danger\" style=\"margin-right: 10px;\" onclick=\"test("+identidade+","+"'"+militares.get(i).getNome()+"'"+");\">"+
                                                "<i class=\"glyphicon glyphicon-remove\"></i>"+
                                                "</button>"+

                                            "</div>"+
                                            "<div class=\"btn-group\">"+
                                                "<button type=\"button\" class=\"btn btn-warning dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"+
                                                "<i class=\"glyphicon glyphicon-pencil\"></i>"+
                                                "</button>"+
                                                "<div class=\"dropdown-menu\">"+
                                                "  <a id="+identidade+" class=\"dropdown-item\" style=\"cursor: pointer;\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\" onclick=\"identidade_do_registro("+identidade+","+"'"+militares.get(i).getNome()+"'"+");\">Nível de Acesso</a>"+
                                                "  <div class=\"dropdown-divider\"></div>"+
                                                "  <a id="+identidade+" class=\"dropdown-item\" href=/PlanoDeChamda/restrito/Atualizacao.jsp?idt="+identidade+">Informações do Militar</a>"+
                                                "</div>"+
                                            "</div>"+
                                            "</td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
       </center>
                <button type="button" class="btn btn-primary col-md-12" data-toggle="modal" data-target="#exampleModalCenter">Niveis de Acesso</button><br>
                        <a href="/PlanoDeChamda/militares.jsp" class="btn btn-primary col-md-12">Militares</a><br>
                        <a href="/PlanoDeChamda/restrito/EmitirRelatorio.jsp" class="btn btn-primary col-md-12">Emitir Relatório</a>
                    
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle" style="font-weight: bold;">Níveis de Acesso: </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <form>
                                            <div class="form-row">         
                                                <div class="form-group col-md-4">
                                                    <label for="identidade"> Identidade: </label>
                                                    <input type="text" class="form-control" name="identidade" id="identidade" disabled/>
                                                </div>
                                                <div class="form-group col-md-8">
                                                    <label for="nome"> Nome: </label>
                                                    <input type="text" class="form-control" name="nome" id="nome" disabled/>
                                                </div>
                                               
                                                <div class="row justify-content-center">
                                                    <label  for="nmm">Nível de Acesso: </label>
                                                </div>
                                                    
                                                <div class="row form-group col-md-12 justify-content-center">
                                                    
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                                                        <label class="custom-control-label" for="customRadioInline1">Administrador</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                                                        <label class="custom-control-label" for="customRadioInline2">Visualizador</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
                                                        <label class="custom-control-label" for="customRadioInline3">Comum</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <center>
                                                <button type="subimit" class="btn btn-secondary">Alterar Nível de Acesso</button>
                                            </center>
                                        </form>
                                        
                                    </div>
                                    
                                    
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
             
              
    </section>
    <footer class="rodape col-md-12">
        <p>Desenvolvido pela Seção de Tecnologia da Informação - 2019</p>
    </footer>
</html>
