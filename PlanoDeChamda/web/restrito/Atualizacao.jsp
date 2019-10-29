<%-- 
    Document   : Atualizacao
    Created on : 05/12/2018, 14:49:15
    Author     : ander
--%>
<%@page import="bean.Dependente"%>
<%@page import="dao.DependenteDAO"%>
<%@page import="dao.ConjugeDAO"%>
<%@page import="dao.ReligiaoDAO"%>
<%@page import="dao.FoneDAO"%>
<%@page import="dao.EnderecoDAO"%>
<%@page import="dao.HabilitacaoDAO"%>
<%@page import="dao.TituloEleitorDAO"%>
<%@page import="dao.EstadoCivilDAO"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="dao.CidadeDAO"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="../bootstrap-4.3.1/css/bootstrap.css" type="text/css" rel="stylesheet"/>
        
        
        <link href="../css/estilo.css" type="text/css" rel="stylesheet"/>
        <link href="../css/estilo_cadastro.css" type="text/css" rel="stylesheet"/>
        <link href="../css/estilo-att.css" type="text/css" rel="stylesheet"/>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="../js/validacao_de_campos_atualizacao.js" type="text/javascript"></script>
        <script type="text/javascript">
            function id( el ){
                return document.getElementById( el );
            }
            
            window.onload = function()
            {
                id('cidade').onchange = function()
                {
                    id('padrao').style.display = this.value=="0" ? 'block' : 'none';
                    id('bairrosManaus').style.display = this.value=='1' ? 'block' : 'none';//1 - Manaus
                    id('bairrosRioPretoDaEva').style.display = this.value=='2' ? 'block' : 'none';//2 - Rio Preto da Eva
                    id('bairrosIranduba').style.display = this.value=='3' ? 'block' : 'none';//3 - Iranduba
                    id('bairrosManacapuru').style.display = this.value=='4' ? 'block' : 'none';//4 - Manacapuru
                }
                
                id('religiao').onchange = function(){
                    id("out_rel").style.display = this.value == "1000" ? 'block' : 'none';
                    
                    borda_input_select(this.id);
                }
            }
        </script>
        <title>Cadastro de Militares - Atualização</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="../img/cabeçalho.jpeg" class="img-responsive" width="100%">
            <div class="row">
                    <div class="col-md-12">
                        <% 
                            HttpSession sessao = request.getSession();
                            Militar mil_logado = null;
                            int grp_acesso = 0;
                            if(sessao.getAttribute("militarAutenticado").equals("sti")){
                                grp_acesso=1;
                            }else{
                                mil_logado = (Militar)sessao.getAttribute("militarAutenticado");
                            }                                        
                            MilitarDAO milDAO = new MilitarDAO();                                        
                            //Militar milAutenticado = (Militar) sessao.getAttribute("militarAutenticado");
                            //Militar mil = milDAO.getMilitar(milAutenticado.getIdentidade());                                        
                            Militar mil = milDAO.getMilitar(request.getParameter("idt"));
                            DependenteDAO depDAO = new DependenteDAO();                                        
                        %> 
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
                                                out.println("<li class='nav-item'>"+
                                                            "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                            "</li>");
                                            }else if(mil.getId_grp_acesso() == 1){
                                                out.println("<li class='nav-item active'>"+
                                                            "   <a class=nav-link href=Atualizacao.jsp?idt="+mil.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
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
                                                out.println("<li class='nav-item'>"+
                                                            "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                            "</li>");
                                            }else if(mil.getId_grp_acesso() == 2){
                                                out.println("<li class='nav-item active'>"+
                                                            "   <a class=nav-link href=Atualizacao.jsp?idt="+mil.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
                                                            "</li>");    
                                                out.println("<li class='nav-item'>"+
                                                            "   <a class='nav-link' href='EmitirRelatorio.jsp'>Emitir Relatório</a>"+
                                                            "</li>");
                                            }else if(mil.getId_grp_acesso() == 3){
                                                out.println("<li class='nav-item active'>"+
                                                            "   <a class=nav-link href=Atualizacao.jsp?idt="+mil.getIdentidade()+">Meus Dados <span class='sr-only'>(current)</span></a>"+
                                                            "</li>");
                                            }  
                                        %>

                                        <!--<li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              Dropdown
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </li>-->
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
        <section class="container area-form">
            <form name="formAtualizacao" method="post" action="atualizar" onsubmit="return validacao_att()">
                    <%
                        DadosCheckBox dcb = new DadosCheckBox();
                        
                        DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();
                        PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
                        QasQmsDAO qasqmsDAO = new QasQmsDAO();
                        EscolaridadeDAO escDAO = new EscolaridadeDAO();
                        EstadoCivilDAO ecDAO = new EstadoCivilDAO();
                        
                        EstadoDAO estDAO = new EstadoDAO();
                        CidadeDAO cDAO = new CidadeDAO();
                        BairroDAO bDAO = new BairroDAO();
                        
                        TituloEleitorDAO teleitorDAO = new TituloEleitorDAO();
                        HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
                        EnderecoDAO endDAO = new EnderecoDAO();
                        FoneDAO foneDAO = new FoneDAO();
                        ReligiaoDAO relDAO = new ReligiaoDAO();
                        ConjugeDAO conDAO = new ConjugeDAO();
                        
   
                        out.println("<br><fieldset class=\"parte-form col-md-12\">"+
                                    "<legend><span>Dados Pessoais</span></legend>"+
                                    "<div class=form-row>"+
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblDivSec\" name=\"lblDivSec\" for=\"lblDivSec\">Divisão/Seção: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtDivSec\" id=\"divsec\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    if(mil.getId_div_sec() == 0){
                                        out.println("<option value=\"0\" selected>Selecione a Divisão/Seção...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a Divisão/Seção...</option>");
                                    }
                                    int qtdDivSec = dsDAO.getDivSec().size();

                                        for(int i=0;i<qtdDivSec;i++){
                                            if(mil.getId_div_sec()==dsDAO.getDivSec().get(i).getId()){
                                                out.println("<option value='"+dsDAO.getDivSec().get(i).getId()+"' selected>"+dsDAO.getDivSec().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+dsDAO.getDivSec().get(i).getId()+"'>"+dsDAO.getDivSec().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+
                                    
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblPostGrad\" name=\"lblPostGrad\" for=\"lblPostGrad\">Posto/Graduação: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtPostGrad\" id=\"postgrad\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    if(mil.getId_pg() == 0){
                                        out.println("<option value=\"0\" selected>Selecione o Posto/Graduação...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione o Posto/Graduação...</option>");
                                    }
                                    int qtdPostGrad = pgDAO.getPostGrads().size();

                                        for(int i=0;i<qtdPostGrad;i++){
                                            if(mil.getId_pg()==pgDAO.getPostGrads().get(i).getId()){
                                                out.println("<option value='"+pgDAO.getPostGrads().get(i).getId()+"' selected>"+pgDAO.getPostGrads().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+pgDAO.getPostGrads().get(i).getId()+"'>"+pgDAO.getPostGrads().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+    
                                    
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblQasQms\" name=\"lblQasQms\" for=\"lblQasQms\">QAS/QMS: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtQasQms\" id=\"qasqms\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    if(mil.getId_qq()== 0){
                                        out.println("<option value=\"0\" selected>Selecione a QAS/QMS...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a QAS/QMS...</option>");
                                    }
                                    int qtdQasQms = qasqmsDAO.getArmas().size();

                                    for(int i=0;i<qtdQasQms;i++){
                                        if(mil.getId_qq()==qasqmsDAO.getArmas().get(i).getId()){
                                            out.println("<option value='"+qasqmsDAO.getArmas().get(i).getId()+"' selected>"+qasqmsDAO.getArmas().get(i).getNome()+"</option>");
                                        }else{
                                            out.println("<option value='"+qasqmsDAO.getArmas().get(i).getId()+"'>"+qasqmsDAO.getArmas().get(i).getNome()+"</option>");
                                        }
                                    }
                                    out.println("</select>"+
                                    "</div>"+
                                    
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblSit\" name=\"lblSit\" for=\"lblSit\">Situação: </label><b class=\"obg\"> *</b>"+
                                    "<br>"+
                                    "<label class=\"radio-inline tipo-relatorio\">"+
                                    "<input type=\"radio\" name=\"txtSit\" id=\"sit\" value=\"1\" checked>Ativo"+
                                    "</label>"+
                                    "</div>"+"</div>"+
                                     
                                    "<div class=form-row>"+
                                    "<div class=\"form-group col-md-9\">"+
                                    "<label id=\"lblNomeComp\" name=\"lblNomeComp\" for=\"lblNomeComp\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeComp\" name=\"txtNomeComp\" value=\""+mil.getNome()+"\" onblur=\"borda_input_text(this.id)\"/>"+
                                    "</div>"+
                                   
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblNomeGuerra\" name=\"lblNomeGuerra\" for=\"lblNomeGuerra\">Nome de Guerra: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeGuerra\" name=\"txtNomeGuerra\" value=\""+mil.getNome_guerra()+"\" onblur=\"borda_input_text(this.id)\"/> "+
                                    "</div>"+"</div>"+
                                    
                                    "<div class=form-row>"+
                                    "<div class=\"form-group col-md-3\">" +
                                    "<label for=\"lblSexo\">Sexo: </label><b class=\"obg\"> *</b>" +
                                    "<br>");
                                    
                                    if(mil.getSexo() != null && mil.getSexo().equals("M")){            
                                        out.println("<label class=\"radio-inline sexo\">" +
                                                    "<input type=\"radio\" name=\"txtSexo\" id=\"masculino\" value=\"M\" checked> Masculino" +
                                                    "</label>" +
                                                    "<label class=\"radio-inline sexo\">" +
                                                    "<input type=\"radio\" name=\"txtSexo\" id=\"feminino\" value=\"F\"> Feminino" +
                                                    "</label>" +
                                                    "</div>");
                                    }else if(mil.getSexo() != null && mil.getSexo().equals("F")){
                                        out.println("<label class=\"radio-inline sexo\">" +
                                                    "<input type=\"radio\" name=\"txtSexo\" id=\"masculino\" value=\"M\"> Masculino" +
                                                    "</label>" +
                                                    "<label class=\"radio-inline sexo\">" +
                                                    "<input type=\"radio\" name=\"txtSexo\" id=\"feminino\" value=\"F\" checked> Feminino" +
                                                    "</label>" +
                                                    "</div>");
                                    }
                                    
                                    out.println("<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblNatEstMilitar\" name=\"lblNatEstMilitar\" for=\"lblNatEstMilitar\">Naturalidade Estado: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtNatEstMilitar\" id=\"estados\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    System.out.println(mil.getId_nat_est());
                                    if(mil.getId_nat_est()==0){
                                        out.println("<option value=\"\" selected>Selecione a sua Naturalidade...</option>");
                                    }else{
                                        out.println("<option value=\"\">Selecione a sua Naturalidade...</option>");
                                    }
                                    int qtdNatsEst = estDAO.getEstados().size();

                                        for(int i=0;i<qtdNatsEst;i++){
                                            if(mil.getId_nat_est() == estDAO.getEstados().get(i).getId()){
                                                out.println("<option value='"+estDAO.getEstados().get(i).getId()+"' selected>"+estDAO.getEstados().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+estDAO.getEstados().get(i).getId()+"'>"+estDAO.getEstados().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+
                                    
                                    "<div class=\"form-group col-md-3\">"+
                                        "<label id=\"lblNatCid\" name=\"lblNatCidMilitar\" for=\"lblNatCidMilitar\">Naturalidade Cidade: </label><b class=\"obg\"> *</b>"+                        
                                        "<input class=\"form-control\" type=\"text\" id=\"txtNatCidMilitar\" name=\"txtNatCidMilitar\" onblur=\"borda_input_text(this.id)\" value=\""+mil.getNat_cid()+"\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblEstCivil\" name=\"lblEstCivil\" for=\"lblEstCivil\">Estado Cívil: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEstCivil\" id=\"est_civil\" class=\"form-control\" onblur=\"borda_input_select(this.id)\"/>");
                                    if(mil.getId_ec() == 0){
                                        out.println("<option value=\"0\" selected>Selecione o seu Estado Cívil...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione o seu Estado Cívil...</option>");
                                    }
                                    int qtdEstCivil = ecDAO.getEstadosCivis().size();

                                    for(int i=0;i<qtdEstCivil;i++){
                                        if(mil.getId_ec()==ecDAO.getEstadosCivis().get(i).getId()){
                                            out.println("<option value='"+ecDAO.getEstadosCivis().get(i).getId()+"' selected>"+ecDAO.getEstadosCivis().get(i).getNome()+"</option>");
                                        }else{
                                            out.println("<option value='"+ecDAO.getEstadosCivis().get(i).getId()+"'>"+ecDAO.getEstadosCivis().get(i).getNome()+"</option>");
                                        }
                                    }
                                    out.println("</select>"+"</div>"+"</div>"+
                                            "<div class=form-row>");
                                    
                                    
                                    if(mil.getData_nasc() != null){
                                        out.println("<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataNasc\" name=\"lblDataNasc\" for=\"lblDataNasc\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataNasc\" name=\"txtDataNasc\" value=\""+mil.getData_nasc().substring(0, 4)+"-"+mil.getData_nasc().substring(4, 6)+"-"+mil.getData_nasc().substring(6, 8)+"\" onblur=\"valida_dataNascMil(this.id)\"/>"+
                                                    "</div>");
                                    }
                                    
                                    if(mil.getData_praca() != null){
                                        out.println("<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataPraca\" name=\"lblDataPraca\" for=\"lblDataPraca\">Data Praça: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataPraca\" name=\"txtDataPraca\" value=\""+mil.getData_praca().substring(0, 4)+"-"+mil.getData_praca().substring(4, 6)+"-"+mil.getData_praca().substring(6, 8)+"\" onblur=\"valida_dataPraca(this.id)\"/> "+
                                                    "</div>");
                                    }
                                    
                                    
                                    
                                    out.println("<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblIdentidade\" name=\"lblIdentidade\" for=\"lblIdentidade\">Identidade: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control identidade\" type=\"text\" id=\"txtIdentidade\" name=\"txtIdentidade\" value=\""+mil.getIdentidade()+"\" onblur=\"valida_identidade(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblCpf\" name=\"lblCpf\" for=\"lblCpf\">Cpf: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control cpf\" type=\"text\" id=\"txtCpf\" name=\"txtCpf\" value=\""+mil.getCpf()+"\" onblur=\"return valida_cpf(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+"</div>"+
                                                
                                    "<div class=form-row>"+
                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblTeleitorRegistro\" name=\"lblTeleitorRegistro\" for=\"lblTeleitorRegistro\">Titulo Eleitor: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control titulo_eleitor\"  type=\"text\" id=\"txtTeleitorRegistro\" name=\"txtTeleitorRegistro\" maxlength=\"12\" id=\"titulo_eleitor\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getRegistro()+"\" onblur=\"valida_titulo(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                        
                                    "<div class=\"form-group col-md-2\">"+
                                    "<label id=\"lblTeleitorZona\" name=\"lblTeleitorZona\" for=\"lblTeleitorZona\">Zona: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\"  type=\"text\" id=\"txtTeleitorZona\" name=\"txtTeleitorZona\" maxlength=\"3\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getZona()+"\" onblur=\"valida_zona(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                        
                                    "<div class=\"form-group col-md-2\">"+
                                    "<label id=\"lblTeleitorSecao\" name=\"lblTeleitorSecao\" for=\"lblTeleitorSecao\">Seção: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\"  type=\"text\" id=\"txtTeleitorSecao\" name=\"txtTeleitorSecao\" maxlength=\"4\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getSecao()+"\" onblur=\"valida_secao(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblPreccp\" name=\"lblPreccp\" for=\"lblPreccp\">Preccp: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtPreccp\" name=\"txtPreccp\" maxlength=\"9\" value=\""+mil.getPreccp()+"\" onblur=\"valida_preccp(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+"</div>"+                                            
                                    "<div class=form-row>");                                    
                                    if(cnhDAO.getCNHByIdMil(mil.getId()).getId() == 0){
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" id=\"txtCnhNum\" name=\"txtCnhNum\" maxlength=\"11\" value=\"\" onblur=\"valida_cnh_num(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                        "</div>");
                                    }else{
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" id=\"txtCnhNum\" name=\"txtCnhNum\" maxlength=\"11\" value=\""+cnhDAO.getCNHByIdMil(mil.getId()).getNum()+"\" onblur=\"valida_cnh_num(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                        "</div>");
                                    }

                                    out.println("<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblCnhCat\" name=\"lblCnhCat\" for=\"lblCnhCat\">CNH Categoria: </label>"+
                                    "<select name=\"txtCnhCat\" id=\"cnh_cat\" class=\"form-control\" onblur=\"borda_input_select_nn(this.id)\">");
                                    if(cnhDAO.getCNHByIdMil(mil.getId()).getCat() != null && cnhDAO.getCNHByIdMil(mil.getId()).getCat().equals("")){
                                        out.println("<option value=\"\" selected>Selecione a categoria...</option>");
                                    }else{
                                        out.println("<option value=\"\">Selecione a categoria...</option>");
                                    }
                                    int qtdCnhCat = dcb.getCnhCat().size();

                                        for(int i=0;i<qtdCnhCat;i++){
                                            if(cnhDAO.getCNHByIdMil(mil.getId()).getCat() != null && cnhDAO.getCNHByIdMil(mil.getId()).getCat().equals(String.valueOf(dcb.getCnhCat().get(i)))){
                                                out.println("<option value='"+String.valueOf(dcb.getCnhCat().get(i))+"' selected>"+String.valueOf(dcb.getCnhCat().get(i))+"</option>");
                                            }else{
                                                out.println("<option value='"+String.valueOf(dcb.getCnhCat().get(i))+"'>"+String.valueOf(dcb.getCnhCat().get(i))+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>");
                                            
                                    
                                    String dataVal = cnhDAO.getCNHByIdMil(mil.getId()).getData_validade();
                                    if(dataVal != null){
                                        out.println("<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblCnhDataVal\" name=\"lblCnhDataVal\" for=\"lblCnhDataVal\">Data de Validade da CNH: </label>"+
                                                    "<input class=\"form-control\" type=\"date\" name=\"txtCnhDataVal\" value=\""+dataVal.substring(0, 4)+"-"+dataVal.substring(4, 6)+"-"+dataVal.substring(6, 8)+"\" onblur=\"valida_dataValidade(this.id)\"/>"+
                                                    "</div>");
                                    }else{
                                        out.println("<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblCnhDataVal\" name=\"lblCnhDataVal\" for=\"lblCnhDataVal\">Data de Validadde da CNH: </label>"+
                                                    "<input class=\"form-control\" type=\"date\" name=\"txtCnhDataVal\" value=\"\" onblur=\"valida_dataValidade(this.id)\"/>"+
                                                    "</div>");
                                    }
                                    out.println("</div>");
                                                            
                                    out.println("<div class=form-row>"+
                                            "<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblPai\" name=\"lblPai\" for=\"lbPai\">Pai: </label>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtPai\" name=\"txtPai\" value=\""+mil.getPai()+"\" onblur=\"borda_input_text_nn(this.id)\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblMae\" name=\"lblMae\" for=\"lblMae\">Mãe: </label>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtMae\" name=\"txtMae\" value=\""+mil.getMae()+"\" onblur=\"borda_input_text_nn(this.id)\"/>"+
                                    "</div>"+"</div>"+

                                    "<div class=form-row>"+
                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblEscolaridade\" name=\"lblEscolaridade\" for=\"lblEscolaridade\">Escolaridade: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEscolaridade\" id=\"esc\" class=\"form-control\" onblur=\"borda_input_select(this.id)\">");
                                    if(mil.getId_esc() == 0){
                                        out.println("<option value=\"0\" selected>Selecione a sua Escolaridade...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a sua Escolaridade...</option>");
                                    }
                                    int qtdEscolaridades = escDAO.getEscs().size();

                                        for(int i=0;i<qtdEscolaridades;i++){
                                            if(mil.getId_esc()==escDAO.getEscs().get(i).getId()){
                                                out.println("<option value='"+escDAO.getEscs().get(i).getId()+"' selected>"+escDAO.getEscs().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+escDAO.getEscs().get(i).getId()+"'>"+escDAO.getEscs().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("</select>"+"</div>");
                                     
                                    out.println("<div class=\"form-group col-md-4\">"+
                                                "<label id=\"lblReligiao\" name=\"lblReligiao\" for=\"lblReligiao\">Religião: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtReligiao\" id=\"religiao\" class=\"form-control\" onblur=\"borda_input_select(this.id);\">");
                                    if(mil.getId_religiao()== 0){
                                        out.println("<option value=\"0\" selected>Selecione a sua Religião...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a sua Religião...</option>");
                                    }
                                    int qtdReligioes = relDAO.getReligioes().size();

                                        for(int i=0;i<qtdReligioes;i++){
                                            if(mil.getId_religiao()==relDAO.getReligioes().get(i).getId()){
                                                out.println("<option value='"+relDAO.getReligioes().get(i).getId()+"' selected>"+relDAO.getReligioes().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+relDAO.getReligioes().get(i).getId()+"'>"+relDAO.getReligioes().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("<option value=\"1000\">Outro(a)</option>");
                                    out.println("</select>"+
                                    "</div>"+
                                
                                    "<div class=\"form-group col-md-4\" id=\"out_rel\" style=\"display: none;\">"+
                                    "<label id=\"lblOutraReligiao\" name=\"lblOutraReligiao\" for=\"lblOutraReligiao\">Religião: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtOutraReligiao\" name=\"txtOutraReligiao\" onblur=\"borda_input_text(this.id)\"/>"+
                                    "</div>"+"</div>"+
                                            
                                    "</fieldset>"+
                                    "<br>");
                                    if(conDAO.getConjugeByIDMil(mil.getId()).getId() == 0 && depDAO.getDependentesIdMil(mil.getId()).size() == 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend><span>Dados Familiares</span></legend>"+
                                                    "<center>"+
                                                    "<div class=\"checkbox col-md-12\">"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\">"+
                                                    "Possui Esposa(o)?"+
                                                    "</label>"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\">"+
                                                    "Possui Dependentes?"+
                                                    "</label>"+
                                                    "</div>"+
                                                    "</center>"+
                                                    "<div class=\"form-row\" id=\"div_dados_conjuge\" style=\"display: none;\">"+
                                                    "<fieldset class=\"parte-form col-md-12 dados-conjuge\">"+
                                                    "<legend><span>Dados do Cônjuge</span></legend>"+
                                                    "<div class=form-row>"+
                                                    "<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-2\">"+
                                                    "<label for=\"lblGravidez\">Esposa Grávida: </label><b class=\"obg\"> *</b>"+
                                                    "<br>"+
                                                    "<label class=\"radio-inline gravida\">"+
                                                    "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\"> Sim"+
                                                    "</label>"+
                                                    "<label class=\"radio-inline gravida\">"+
                                                    "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\"> Não"+
                                                    "</label>"+                         
                                                    "</div>"+
                                                    "</div>"+
                                                    "</fieldset>"+
                                                    "</div>"+           
                                                    "<div  id=\"div_dados_dependente\" class=\"form-row dados-dependente\" style=\"display: none;\">"+
                                                    "<div id=\"fd_dados_dependente\" class=\"form-row col-md-12\" style=\"display: none;\">"+
                                                    "<legend><span>Dados dos Dependentes</span></legend>"+
                                                    "</div>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: none;\">"+
                                                    "<div class=\"col-md-11\"></div>"+
                                                    "<span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "</div>"+
                                                    
                                                    "</fieldset>"+"</div>");
                                    }else if(conDAO.getConjugeByIDMil(mil.getId()).getId() != 0 && depDAO.getDependentesIdMil(mil.getId()).size() == 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend><span>Dados Familiares</span></legend>"+
                                                    "<center>"+
                                                    "<div class=\"checkbox col-md-12\">"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\" checked>"+
                                                    "Possui Esposa(o)?"+
                                                    "</label>"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\">"+
                                                    "Possui Dependentes?"+
                                                    "</label>"+
                                                    "</div>"+
                                                    "</center>"+
                                                    "<div class=\"form-row\" id=\"div_dados_conjuge\" style=\"display: block;\">"+
                                                    "<fieldset id=\"fd_dados_conjuge\" class=\"parte-form col-md-12 dados-conjuge\" style=\"display: block;\">"+
                                                    "<legend><span>Dados do Cônjuge</span></legend>"+
                                                    "<div class=form-row>"+
                                                    "<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\" value=\""+conDAO.getConjugeByIDMil(mil.getId()).getNome()+"\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\" value="+conDAO.getConjugeByIDMil(mil.getId()).getFone()+"/>"+
                                                    "</div>");
                                                    String dataNascCon = conDAO.getConjugeByIDMil(mil.getId()).getData_nasc();
                                                    if(dataNascCon != null){
                                                        out.println("<div class=\"form-group col-md-3\">"+
                                                        "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\" value=\""+dataNascCon.substring(0, 4)+"-"+dataNascCon.substring(4, 6)+"-"+dataNascCon.substring(6, 8)+"\"/>"+
                                                        "</div>");
                                                    }else{
                                                        out.println("<div class=\"form-group col-md-2\">"+
                                                        "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\"/>"+
                                                        "</div>");
                                                    }
                                                    out.println("<div class=\"form-group col-md-2\">"+
                                                    "<label for=\"lblGravidez\">Esposa Grávida: </label><b class=\"obg\"> *</b>"+
                                                    "<br>");
                                                    String gravidez = conDAO.getConjugeByIDMil(mil.getId()).getGravidez();
                                                    if(gravidez != null && gravidez.equals("S")){
                                                    out.println("<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\" checked> Sim"+
                                                                "</label>"+
                                                                "<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\"> Não"+
                                                                "</label>"+                      
                                                                "</div>");
                                                    }else if(gravidez != null && gravidez.equals("N")){
                                                    out.println("<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\"> Sim"+
                                                                "</label>"+
                                                                "<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\" checked> Não"+
                                                                "</label>"+                      
                                                                "</div>");
                                                    }
                                                    out.println("</div>"+"</fieldset>"+
                                                                "</div>");

                                                    out.println("<div id=\"div_dados_dependente\" class=\"form-row dados-dependente\" style=\"display: none;\">"+
                                                    "<div id=\"fd_dados_dependente\" class=\"form-row col-md-12\" style=\"display: none;\">"+
                                                    "<legend><span>Dados dos Dependentes</span></legend>"+
                                                    "</div>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: none;\">"+
                                                    "<div class=\"col-md-11\"></div>"+
                                                    "<span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "</div>"+
                                                    "</fieldset>");
                                    }else if(conDAO.getConjugeByIDMil(mil.getId()).getId() == 0 && depDAO.getDependentesIdMil(mil.getId()).size() != 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "   <legend><span>Dados Familiares</span></legend>"+
                                                    "   <center>"+
                                                    "       <div class=\"checkbox col-md-12\">"+
                                                    "           <label>"+
                                                    "           <input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\">"+
                                                    "           Possui Esposa(o)?"+
                                                    "           </label>"+
                                                    "           <label>"+
                                                    "           <input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\" checked>"+
                                                    "           Possui Dependentes?"+
                                                    "           </label>"+
                                                    "       </div>"+
                                                    "   </center>"+
                                                    "<div class=\"form-row\" id=\"div_dados_conjuge\" style=\"display: none;\">"+
                                                    "<fieldset class=\"parte-form col-md-12 dados-conjuge\">"+
                                                    "<legend><span>Dados do Cônjuge</span></legend>"+
                                                    "<div class=form-row>"+
                                                    "<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-2\">"+
                                                    "<label for=\"lblGravidez\">Esposa Grávida: </label><b class=\"obg\"> *</b>"+
                                                    "<br>"+
                                                    "<label class=\"radio-inline gravida\">"+
                                                    "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\"> Sim"+
                                                    "</label>"+
                                                    "<label class=\"radio-inline gravida\">"+
                                                    "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\"> Não"+
                                                    "</label>"+                         
                                                    "</div>"+
                                                    "</div>"+
                                                    "</fieldset>"+"</div");
                                        int qtdeDependentes = depDAO.getDependentesIdMil(mil.getId()).size();
                                        out.println("<div class=\"form-row dados-dependente\" id=\"div_dados_dependente\" style=\"display: block;\">"+
                                                "       <legend><span>Dados dos Dependentes</span></legend>"+
                                        "   <div id=\"fd_dados_dependente\" class=\"form-row col-md-12\" style=\"display: block;\">");

                                        for(int i=0;i<qtdeDependentes;i++){
                                            out.println();
                                            out.println("<div id=linha"+(i+1)+" class=\"form-row col-md-12\" style=\"padding-left: 0;\">"+
                                                        "   <div id=\"div_nome_dependente\" class=\"t form-group col-md-5\">"+
                                                        "       <label id=\"lblDependente\">Dependente: </label><b class=\"obg\"> *</b>"+
                                                        "       <input class=form-control type=text id=txtNomeDependente"+(i+1)+" name=\"txtNomeDependente\" onblur=\"borda_input_text(this.id)\" value=\""+depDAO.getDependentesIdMil(mil.getId()).get(i).getNome()+"\">"+
                                                        "   </div>");
                                            String dataNascDep = depDAO.getDependentesIdMil(mil.getId()).get(i).getData_nasc();
                                            if(dataNascDep != null){  
                                            out.println("   <div id=\"div_data_nasc_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                        "       <label id=\"lblDataNascDependente\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "       <input class=form-control type=date id=txtDataNascDependente"+(i+1)+" name=\"txtDataNascDependente\" onblur=\"valida_dataNasc(this.id);\" value=\""+dataNascDep.substring(0, 4)+"-"+dataNascDep.substring(4, 6)+"-"+dataNascDep.substring(6, 8)+"\"/>"+
                                                        "   </div>");
                                            }else{
                                            out.println("   <div id=\"div_data_nasc_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                        "       <label id=\"lblDataNascDependente\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "       <input class=form-control type=date id=txtDataNascDependente"+(i+1)+" name=\"txtDataNascDependente\" onblur=\"valida_dataNasc(this.id);\"/>"+
                                                        "   </div>");
                                            }
                                            out.println("<div id=\"div_gr_parentesco_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                        "   <label id=\"lblGrauParentescoDependente\">Grau de Parentesco: </label><b class=\"obg\"> *</b>"+
                                                        "   <select class=form-control id=txtGrauParentescoDependente"+(i+1)+" name=\"txtGrauParentescoDependente\" onblur=\"borda_input_select(this.id)\">"); 

                                                            if(depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco() != null && depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco().equals("")){
                                                                out.println("<option value=\"\" selected>Selecione o grau de Parentesco...</option>");
                                                            }else{
                                                                out.println("<option value=\"\">Selecione o grau de Parentesco...</option>");
                                                            }

                                                            int qtdGrauParentesco = dcb.getGrParentescos().size();
                                                            for(int j=0;j<qtdGrauParentesco;j++){
                                                                if(depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco() != null && depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco().equals(dcb.getGrParentescos().get(j).toUpperCase())){
                                                                    out.println("<option value='"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"' selected>"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"'>"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"</option>");
                                                                }
                                                            }

                                            out.println("   </select>"+"</div>"
                                                        );

                                            out.println("<div id="+(i+1)+" style=\"margin: auto auto;\">"+
                                                        "<button id="+(i+1)+" type=\"button\" class=\"btn btn-danger\" style=\"margin-right: 10px;\" onclick=\"removeLinha(this.id)\">"+
                                                        "<i class=\"glyphicon glyphicon-remove\"></i>"+
                                                        "</button>"+"</div>"+"</div>");
                                        }
                                        out.println("   </fieldset>"+               
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: block;\">"+
                                                    "   <div class=\"col-md-11\"></div>"+
                                                    "       <span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "   </div>"+
                                                    "</fieldset>");
        
                                    }else if(conDAO.getConjugeByIDMil(mil.getId()).getId() != 0 && depDAO.getDependentesIdMil(mil.getId()).size() != 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend><span>Dados Familiares</span></legend>"+
                                                    "<center>"+
                                                    "<div class=\"checkbox col-md-12\">"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\" checked>"+
                                                    "Possui Esposa(o)?"+
                                                    "</label>"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\" checked>"+
                                                    "Possui Dependentes?"+
                                                    "</label>"+
                                                    "</div>"+
                                                    "</center>"+
                                                    "<div class=\"form-row\" id=\"div_dados_conjuge\" style=\"display: block;\">"+
                                                    "<fieldset id=\"fd_dados_conjuge\" class=\"parte-form col-md-12 dados-conjuge\" style=\"display: block;\">"+
                                                    "<legend><span>Dados do Cônjuge</span></legend>"+
                                                    "<div class=form-row>"+
                                                    "<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\" value=\""+conDAO.getConjugeByIDMil(mil.getId()).getNome()+"\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\" value="+conDAO.getConjugeByIDMil(mil.getId()).getFone()+"/>"+
                                                    "</div>");
                                                    String dataNascCon = conDAO.getConjugeByIDMil(mil.getId()).getData_nasc();
                                                    if(dataNascCon != null){
                                                        out.println("<div class=\"form-group col-md-3\">"+
                                                        "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\" value=\""+dataNascCon.substring(0, 4)+"-"+dataNascCon.substring(4, 6)+"-"+dataNascCon.substring(6, 8)+"\"/>"+
                                                        "</div>");
                                                    }else{
                                                        out.println("<div class=\"form-group col-md-2\">"+
                                                        "<label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                        "<input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\"/>"+
                                                        "</div>");
                                                    }
                                                    out.println("<div class=\"form-group col-md-2\">"+
                                                    "<label for=\"lblGravidez\">Esposa Grávida: </label><b class=\"obg\"> *</b>"+
                                                    "<br>");
                                                    String gravidez = conDAO.getConjugeByIDMil(mil.getId()).getGravidez();
                                                    if(gravidez != null && gravidez.equals("S")){
                                                    out.println("<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\" checked> Sim"+
                                                                "</label>"+
                                                                "<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\"> Não"+
                                                                "</label>"+                      
                                                                "</div>");
                                                    }else if(gravidez != null && gravidez.equals("N")){
                                                    out.println("<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\"> Sim"+
                                                                "</label>"+
                                                                "<label class=\"radio-inline gravida\">"+
                                                                "<input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\" checked> Não"+
                                                                "</label>"+                      
                                                                "</div>");
                                                    }
                                                    out.println("</div>"+"</fieldset>"+
                                                                "</div>");
                                                    int qtdeDependentes = depDAO.getDependentesIdMil(mil.getId()).size();
                                                    out.println("<div class=\"form-row dados-dependente\" id=\"div_dados_dependente\" style=\"display: block;\">"+
                                                            "       <legend><span>Dados dos Dependentes</span></legend>"+
                                                    "   <div id=\"fd_dados_dependente\" class=\"form-row col-md-12\" style=\"display: block;\">");
                                                    
                                                    for(int i=0;i<qtdeDependentes;i++){
                                                        out.println();
                                                        out.println("<div id=linha"+(i+1)+" class=\"form-row col-md-12\" style=\"padding-left: 0;\">"+
                                                                    "   <div id=\"div_nome_dependente\" class=\"t form-group col-md-5\">"+
                                                                    "       <label id=\"lblDependente\">Dependente: </label><b class=\"obg\"> *</b>"+
                                                                    "       <input class=form-control type=text id=txtNomeDependente"+(i+1)+" name=\"txtNomeDependente\" onblur=\"borda_input_text(this.id)\" value=\""+depDAO.getDependentesIdMil(mil.getId()).get(i).getNome()+"\">"+
                                                                    "   </div>");
                                                        String dataNascDep = depDAO.getDependentesIdMil(mil.getId()).get(i).getData_nasc();
                                                        if(dataNascDep != null){  
                                                        out.println("   <div id=\"div_data_nasc_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                                    "       <label id=\"lblDataNascDependente\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                                    "       <input class=form-control type=date id=txtDataNascDependente"+(i+1)+" name=\"txtDataNascDependente\" onblur=\"valida_dataNasc(this.id);\" value=\""+dataNascDep.substring(0, 4)+"-"+dataNascDep.substring(4, 6)+"-"+dataNascDep.substring(6, 8)+"\"/>"+
                                                                    "   </div>");
                                                        }else{
                                                        out.println("   <div id=\"div_data_nasc_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                                    "       <label id=\"lblDataNascDependente\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                                    "       <input class=form-control type=date id=txtDataNascDependente"+(i+1)+" name=\"txtDataNascDependente\" onblur=\"valida_dataNasc(this.id);\"/>"+
                                                                    "   </div>");
                                                        }
                                                        out.println("<div id=\"div_gr_parentesco_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                                    "   <label id=\"lblGrauParentescoDependente\">Grau de Parentesco: </label><b class=\"obg\"> *</b>"+
                                                                    "   <select class=form-control id=txtGrauParentescoDependente"+(i+1)+" name=\"txtGrauParentescoDependente\" onblur=\"borda_input_select(this.id)\">"); 
                                                        
                                                                        if(depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco() != null && depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco().equals("")){
                                                                            out.println("<option value=\"\" selected>Selecione o grau de Parentesco...</option>");
                                                                        }else{
                                                                            out.println("<option value=\"\">Selecione o grau de Parentesco...</option>");
                                                                        }

                                                                        int qtdGrauParentesco = dcb.getGrParentescos().size();
                                                                        for(int j=0;j<qtdGrauParentesco;j++){
                                                                            if(depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco() != null && depDAO.getDependentesIdMil(mil.getId()).get(i).getGrau_parentesco().equals(dcb.getGrParentescos().get(j).toUpperCase())){
                                                                                out.println("<option value='"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"' selected>"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"</option>");
                                                                            }else{
                                                                                out.println("<option value='"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"'>"+String.valueOf(dcb.getGrParentescos().get(j).toUpperCase())+"</option>");
                                                                            }
                                                                        }
                                                    
                                                        out.println("   </select>"+"</div>"
                                                                    );
                                                    
                                                        out.println("<div id="+(i+1)+" style=\"margin: auto auto;\">"+
                                                                    "<button id="+(i+1)+" type=\"button\" class=\"btn btn-danger\" style=\"margin-right: 10px;\" onclick=\"removeLinha(this.id)\">"+
                                                                    "<i class=\"glyphicon glyphicon-remove\"></i>"+
                                                                    "</button>"+"</div>"+"</div>");
                                                    }
                                        out.println("</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: block;\">"+
                                                    "<div class=\"col-md-11\"></div>"+
                                                    "<span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "</div>"+
                                                    "</fieldset><br>");
                                    }

                                    out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend><span>Dados de Endereço</span></legend>"+
                                                "<div class=form-row>"+
                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCep\" name=\"lblCep\" for=\"lblCep\">Cep: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control cep\" type=\"text\" name=\"txtCep\" id=\"txtCep\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getCep()+"\" onblur=\"valida_cep(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblEstado\" name=\"lblEstado\" for=\"lblEstado\">Estado: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtEstado\" id=\"estado\" class=\"form-control\" onblur=\"borda_input_select(this.id)\">");

                                    if(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid()).getId_est()==0){
                                        out.println("<option value=\"0\" selected>Selecione o seu Estado...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione o seu Estado...</option>");
                                    }
                                    int qtdEstados = estDAO.getEstados().size();

                                        for(int i=0;i<qtdEstados;i++){
                                            if(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid()).getId_est()==estDAO.getEstados().get(i).getId()){
                                                out.println("<option value='"+estDAO.getEstados().get(i).getId()+"' selected>"+estDAO.getEstados().get(i).getNome()+"</option>");
                                            }else{
                                                out.println("<option value='"+estDAO.getEstados().get(i).getId()+"'>"+estDAO.getEstados().get(i).getNome()+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+
                                                        
                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCidade\" name=\"lblCidade\" for=\"lblCidade\">Cidade: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtCidade\" id=\"cidade\" class=\"form-control\" onblur=\"borda_input_select(this.id);\"> ");
                                    
                                                int id_cid = bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid();
                                                if(id_cid == 0){
                                                    out.println("<option value=\"0\" selected>Selecione a sua Cidade..</option>");
                                                }else{
                                                    out.println("<option value=\"0\">Selecione a sua Cidade...</option>");
                                                }
                                                
                                                int qtdCidades = cDAO.getCidades().size();

                                                    for(int i=0;i<qtdCidades;i++){
                                                        if(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid()==cDAO.getCidades().get(i).getId()){
                                                            out.println("<option value='"+cDAO.getCidades().get(i).getId()+"' selected>"+cDAO.getCidades().get(i).getNome()+"</option>");
                                                        }else{
                                                            out.println("<option value='"+cDAO.getCidades().get(i).getId()+"'>"+cDAO.getCidades().get(i).getNome()+"</option>");
                                                        }
                                                    }
                                                out.println("</select>"+
                                                "</div>");
                                                out.println("<div class=\"form-group col-md-3\">"+
                                                            "<label id=\"lblBairro\" name=\"lblBairro\" for=\"lblBairro\">Bairro: </label><b class=\"obg\"> *</b>");
                                                out.println("<select name=\"txtpadrao\" id=\"padrao\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");  
                                                out.println("</select>");
                                                    switch(id_cid){
                                                        case 1:
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onblur=\"borda_input_select(this.id);\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            int qtdBairros = bDAO.getBairrosByCidade(1).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(1).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"'>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                            qtdBairros = bDAO.getBairrosByCidade(2).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(2).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"'>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(3).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(3).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"'>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");
                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(4).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(4).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                //System.out.println("idb"+bDAO.getBairrosByCidade(4).size());
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                }   
                                                            }
                                                            out.println("</select>"+
                                                                    "</div>");
                                                            break;
                                                        case 2:
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(1).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(1).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"'>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onblur=\"borda_input_select(this.id);\"> ");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                            qtdBairros = bDAO.getBairrosByCidade(2).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(2).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"'>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(3).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(3).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"'>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(4).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(4).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                //System.out.println("idb"+bDAO.getBairrosByCidade(4).size());
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                }   
                                                            }
                                                            out.println("</select>"+
                                                                    "</div>");
                                                            break;
                                                        case 3:
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(1).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(1).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"'>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                            qtdBairros = bDAO.getBairrosByCidade(2).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(2).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"'>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onblur=\"borda_input_select(this.id);\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(3).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(3).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"'>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(4).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(4).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                //System.out.println("idb"+bDAO.getBairrosByCidade(4).size());
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                }   
                                                            }
                                                            out.println("</select>"+
                                                                    "</div>");
                                                            break;
                                                        case 4:
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(1).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(1).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"'>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                            qtdBairros = bDAO.getBairrosByCidade(2).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(2).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"'>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onblur=\"borda_input_select(this.id);\" style=\"display: none;\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(3).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(3).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"'>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                                                }
                                                            }
                                                            out.println("</select>");

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onblur=\"borda_input_select(this.id);\"> ");
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                            }else{
                                                                out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                            }
                                                            qtdBairros = bDAO.getBairrosByCidade(4).size();
                                                            for(int i=0;i<qtdBairros;i++){
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(4).get(i).getId()){
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                //System.out.println("idb"+bDAO.getBairrosByCidade(4).size());
                                                                }else{
                                                                    out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                                }   
                                                            }
                                                            out.println("</select>"+
                                                                    "</div>");
                                                            break;
                                                    }
                                                    out.println("</div>"+"</div>");

                                                out.println("<div class=form-row>"+"<div class=\"form-group col-md-10\">"+
                                                "<label id=\"lblLogradouro\" name=\"lblLogradouro\" for=\"lblLogradouro\">Rua/Av./Ala: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtLogradouro\" id=\"txtLogradouro\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getLogradouro()+"\" onblur=\"borda_input_text(this.id);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-2\">"+
                                                "<label id=\"lblNum\" name=\"lblNum\" for=\"lblNum\">Número: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtNum\" name=\"txtNum\" value=\""+mil.getEnd_num()+"\" onblur=\"borda_input_text(this.id);\"/>"+
                                                "</div>"+"</div>"+
                                                
                                                "<div class=form-row>"+
                                                "<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblComplemento\" name=\"lblComplemento\" for=\"lblComplemento\">Complemento: </label>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtComplemento\" name=\"txtComplemento\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getComplemento()+"\" onblur=\"borda_input_text_nn(this.id);\"/>"+
                                                "</div>"+"</div>"+
                                                "</fieldset>"+"<br>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend><span>Dados de Contato</span></legend>");
                                                
                                               
                                                out.println("<div class=form-row>"+
                                                        "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone01\" name=\"lblFone01\" for=\"lblFone01\">Telefone 01: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFone01\" name=\"txtFone01\" value=\""+mil.getFone1()+"\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                
                                                
                                                
                                                out.println("<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone02\" name=\"lblFone02\" for=\"lblFone02\">Telefone 02: </label>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFone02\" name=\"txtFone02\" value=\""+mil.getFone2()+"\" onblur=\"valida_fone_nn(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+"</div>");
                                                

                                                out.println("<div class=form-row>"+"<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblEmail\" name=\"lblEmail\" for=\"lblEmail\">Email: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtEmail\" name=\"txtEmail\" value=\""+mil.getEmail()+"\" onblur=\"borda_input_text(this.id)\"/>"+
                                                "</div>"+"</div>"+

                                                "<div class=form-row>"+
                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblNomeReferencia\" name=\"lblNomeReferencia\" for=\"lblNomeReferencia\">Familiar de Contato: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtNomeReferencia\" name=\"txtNomeReferencia\" value=\""+mil.getNome_referencia()+"\" onblur=\"borda_input_text(this.id)\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFoneReferencia\" name=\"lblFoneReferencia\" for=\"lblFoneReferencia\">Contato do Familiar: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneReferencia\" name=\"txtFoneReferencia\" value=\""+mil.getFone_referencia()+"\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+"<div>"+
                                                "</fieldset>"+"<br>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend><span>Dados de Acesso</span></legend>"+
                                                
                                                "<div class=form-row>"+
                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblSenha\" name=\"lblSenha\" for=\"lblSenha\">Senha: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"password\" id=\"txtSenha\" name=\"txtSenha\" maxlength=\"20\" value=\""+mil.getSenha()+"\" onblur=\"valida_senha(this.id);\"/>"+
                                                "<b class=\"obg\">*No mínimo 6 caracteres</b>"+
                                                "</div>"+"</div>"+
                                                "</fieldset>"
                                            );
                        %>
                    
                    
                    <div class="form-row justify-content-end">
                        <button type="subimit" class="btn btn-secondary">Atualizar</button>
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
        
        <script src="../js/manipulacao_campos.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/mascaras.js"></script>
        <script type="text/javascript" src="../js/preenchimento-endereco.js"></script>
        <script src="../js/manipulacao_form_familiares.js" type="text/javascript"></script>
        
    </body>
</html>
