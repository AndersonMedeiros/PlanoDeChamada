<%-- 
    Document   : inicial
    Created on : 15/04/2019, 11:20:48
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        
        <link href="css/estilo_inicial.css" rel="stylesheet"/>
        <link href="css/estilo.css" rel="stylesheet"/>
        <link href="bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Cadastro de Militares - Página Inicial</title>
    </head>
    <body>
        <header class="header">
            <img src="img/cabeçalho.jpeg" class="img-responsive" width="100%"/>
        </header>
        
        <div class="container col-md-11">
            <center>
            <div class="row">
                <div id="carouselExampleIndicators" class="col-md-6 carousel slide" data-ride="carousel" width="100%">
                    <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner col" width="100%">
                        <div class="carousel-item active" data-interval="10000">
                            <img src="img/senha_banner.png" class="d-block w-100 img-responsive" alt="..." >
                        </div>
                        <div class="carousel-item" data-interval="10000">
                            <img src="img/Exercito.jpg" class="d-block w-100 img-responsive" alt="..." >
                        </div>
                        <div class="carousel-item" data-interval="10000">
                            <img src="img/BandeiraBrasil.jpg" class="d-block w-100 img-responsive" alt="..." >
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="col-md-6">
                    
                        <button type="button" class="btn btn-primary col-md-12" data-toggle="modal" data-target="#exampleModalCenter">Niveis de Acesso</button><br>
                        <a href="/PlanoDeChamda/militares.jsp" class="btn btn-primary col-md-12">Militares</a><br>
                        <a href="/PlanoDeChamda/restrito/EmitirRelatorio.jsp" class="btn btn-primary col-md-12">Emitir Relatório</a>
                    
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle"></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <b>Níveis de Acesso: </b><br>
                                                <b>Dados: </b>

                                            </div>
                                            <div class="col-md-6">
                                                
                                                <b>Níveis de Acesso: </b><br>
                                                <b>Dados: </b>

                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    
            </div>
            </center>
                
                <!-- Button trigger modal -->


                <!-- Modal -->
                
        </div>
        
        <footer class="rodape col-md-12">
            <p>Desenvolvido pela Seção de Tecnologia da Informação - 2019</p>
        </footer>
    </body>
    
    
</html>
