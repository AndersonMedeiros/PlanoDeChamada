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
        <link href="../bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="../css/estilo.css" type="text/css" rel="stylesheet"/>
        <link href="../css/estilo_cadastro.css" type="text/css" rel="stylesheet"/>
        <link href="../css/estilo-att.css" type="text/css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../js/manipulacao.js" type="text/javascript"></script>
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
            }
        </script>
        <title>Cadastro de Militares - Atualização</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="../img/cabeçalho.jpeg" class="img-responsive" width="100%">
            <div class="row">
                    <div class="col-md-12">
                        <nav class="barra-navegacao navbar navbar-default" style="margin-top: 0; margin-bottom: 15px;">
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
                                    <li class="active"><a href="Atualizacao.jsp">Atualizar Dados <span class="sr-only">(current)</span></a></li>                                 
                                    <% 
                                        HttpSession sessao = request.getSession();
                                        
                                        MilitarDAO milDAO = new MilitarDAO();
                                        Militar milAutenticado = (Militar) sessao.getAttribute("militarAutenticado");
                                        Militar mil = milDAO.getMilitar(milAutenticado.getIdentidade());
                                        DependenteDAO depDAO = new DependenteDAO();
                                        Dependente dep = depDAO.getDependenteByIDMil(mil.getId());
                                        if(String.valueOf(mil.getTipo_acesso()).equals("admin")){
                                            out.println("<li><a href=\"EmitirRelatorio.jsp\">Emitir Relatório</a></li>");
                                        }
                                    %>                                   
                                  <!-- <li><a href="FaleConosco.jsp">Sair <span class="sr-only">(current)</span></a></li> -->
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
                        
   
                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                    "<legend>Dados Pessoais</legend>"+

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
                                            out.println("<option value='"+qasqmsDAO.getArmas().get(i).getId()+"' selected>"+qasqmsDAO.getArmas().get(i).getDesc()+"</option>");
                                        }else{
                                            out.println("<option value='"+qasqmsDAO.getArmas().get(i).getId()+"'>"+qasqmsDAO.getArmas().get(i).getDesc()+"</option>");
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
                                    "</div>"+
                                                                   
                                    "<div class=\"form-group col-md-9\">"+
                                    "<label id=\"lblNomeComp\" name=\"lblNomeComp\" for=\"lblNomeComp\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeComp\" name=\"txtNomeComp\" value=\""+mil.getNome()+"\" onblur=borda_input_text(this.id)/>"+
                                    "</div>"+
                                   
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblNomeGuerra\" name=\"lblNomeGuerra\" for=\"lblNomeGuerra\">Nome de Guerra: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeGuerra\" name=\"txtNomeGuerra\" value=\""+mil.getNome_guerra()+"\" onblur=borda_input_text(this.id)/> "+
                                    "</div>"+
                                            
                                    "<div class=\"form-group col-md-4\">" +
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
                                    
                                    out.println("<div class=\"form-group col-md-4\">"+
                                                "<label id=\"lblNatEstMilitar\" name=\"lblNatEstMilitar\" for=\"lblNatEstMilitar\">Naturalidade Estado: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtNatEstMilitar\" id=\"estados\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    
                                    if(mil.getNat_est()!= null && mil.getNat_est().equals("")){
                                        out.println("<option value=\"\" selected>Selecione a sua Naturalidade...</option>");
                                    }else{
                                        out.println("<option value=\"\">Selecione a sua Naturalidade...</option>");
                                    }
                                    int qtdNaturalidades = dcb.getNaturalidades().size();

                                        for(int i=0;i<qtdNaturalidades;i++){
                                            if(mil.getNat_est()!= null && mil.getNat_est().equals(String.valueOf(dcb.getNaturalidades().get(i)))){
                                                out.println("<option value='"+String.valueOf(dcb.getNaturalidades().get(i))+"' selected>"+String.valueOf(dcb.getNaturalidades().get(i))+"</option>");
                                            }else{
                                                out.println("<option value='"+String.valueOf(dcb.getNaturalidades().get(i))+"'>"+String.valueOf(dcb.getNaturalidades().get(i))+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblEstCivil\" name=\"lblEstCivil\" for=\"lblEstCivil\">Estado Cívil: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEstCivil\" id=\"est_civil\" class=\"form-control\" onblur=borda_input_select(this.id)>");
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
                                    out.println("</select>"+"</div>");
                                    
                                    if(mil.getData_nasc() != null){
                                        out.println("<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataNasc\" name=\"lblDataNasc\" for=\"lblDataNasc\">Data de Nascimento: </label>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataNasc\" name=\"txtDataNasc\" value=\""+mil.getData_nasc().substring(0, 4)+"-"+mil.getData_nasc().substring(4, 6)+"-"+mil.getData_nasc().substring(6, 8)+"\" onblur=\"validar_dataNasc(this.id)\"/>"+
                                                    "</div>");
                                    }
                                    
                                    if(mil.getData_praca() != null){
                                        out.println("<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblDataPraca\" name=\"lblDataPraca\" for=\"lblDataPraca\">Data Praça: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" id=\"txtDataPraca\" name=\"txtDataPraca\" value=\""+mil.getData_praca().substring(0, 4)+"-"+mil.getData_praca().substring(4, 6)+"-"+mil.getData_praca().substring(6, 8)+"\" onblur=\"validar_dataPraca(this.id)\"/> "+
                                                    "</div>");
                                    }
                                    
                                    
                                    
                                    out.println("<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblIdentidade\" name=\"lblIdentidade\" for=\"lblIdentidade\">Identidade: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control identidade\" type=\"text\" id=\"txtIdentidade\" name=\"txtIdentidade\" value=\""+mil.getIdentidade()+"\" onblur=\"valida_identidade(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblCpf\" name=\"lblCpf\" for=\"lblCpf\">Cpf: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control cpf\" type=\"text\" id=\"txtCpf\" name=\"txtCpf\" value=\""+mil.getCpf()+"\" onblur=\"return valida_cpf(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                
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
                                    "</div>");
                                    
                                    if(cnhDAO.getCNHByIdMil(mil.getId()).getId() == 0){
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" id=\"txtCnhNum\" name=\"txtCnhNum\" maxlength=\"11\" value=\"\" onblur=\"borda_input_text(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                        "</div>");
                                    }else{
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" id=\"txtCnhNum\" name=\"txtCnhNum\" maxlength=\"11\" value=\""+cnhDAO.getCNHByIdMil(mil.getId()).getNum()+"\" onblur=\"borda_input_text_nn(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
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
                                                    "<input class=\"form-control\" type=\"date\" name=\"txtCnhDataVal\" value=\""+dataVal.substring(0, 4)+"-"+dataVal.substring(4, 6)+"-"+dataVal.substring(6, 8)+"\" onblur=\"valida_dataValidade(this.id);\"/>"+
                                                    "</div>");
                                    }else{
                                        out.println("<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblCnhDataVal\" name=\"lblCnhDataVal\" for=\"lblCnhDataVal\">Data de Validadde da CNH: </label>"+
                                                    "<input class=\"form-control\" type=\"date\" name=\"txtCnhDataVal\" value=\"\" onblur=\"valida_dataValidade(this.id);\"/>"+
                                                    "</div>");
                                    }
                                                            
                                    out.println("<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblPai\" name=\"lblPai\" for=\"lbPai\">Pai: </label>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtPai\" name=\"txtPai\" value=\""+mil.getPai()+"\" onblur=\"borda_input_text_nn(this.id)\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblMae\" name=\"lblMae\" for=\"lblMae\">Mãe: </label>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtMae\" name=\"txtMae\" value=\""+mil.getMae()+"\" onblur=\"borda_input_text_nn(this.id)\"/>"+
                                    "</div>"+

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
                                    out.println("</select>"+
                                    "</div>"+
                                
                                    "<div class=\"form-group col-md-4\" id=\"out_rel\" style=\"display: none;\">"+
                                    "<label id=\"lblOutraReligiao\" name=\"lblOutraReligiao\" for=\"lblOutraReligiao\">Religião: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" id=\"txtOutraReligiao\" name=\"txtOutraReligiao\" onblur=\"borda_input_text(this.id)\"/>"+
                                    "</div>"+
                                            
                                    "</fieldset>"+
                                    "<br>");
                                    if(conDAO.getConjugeByIDMil(mil.getId()).getId() == 0 && depDAO.getDependentesIdMil(mil.getId()).size() == 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend>Dados Familiares</legend>"+
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
                                                    "<div id=\"div_dados_conjuge\" style=\"display: none;\">"+
                                                    "<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend>Dados do Conjuge</legend>"+
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
                                                    "</fieldset>"+
                                                    "</div>"+           
                                                    "<div  id=\"div_dados_dependente\" style=\"display: none;\">"+
                                                    "<fieldset id=\"fd_dados_dependente\" class=\"parte-form col-md-12\" style=\"display: none;\">"+
                                                    "<legend>Dados dos Dependentes</legend>"+
                                                    "</fieldset>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: none;\">"+
                                                    "<div class=\"col-md-11\"></div>"+
                                                    "<span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "</div>"+
                                                    "</fieldset>");
                                    }else if(conDAO.getConjugeByIDMil(mil.getId()).getId() != 0 && depDAO.getDependentesIdMil(mil.getId()).size() == 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend>Dados Familiares</legend>"+
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
                                                    "<div id=\"div_dados_conjuge\" style=\"display: block;\">"+
                                                    "<div class=\"form-group col-md-5\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\" value=\""+conDAO.getConjugeByIDMil(mil.getId()).getNome()+"\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\" value="+conDAO.getConjugeByIDMil(mil.getId()).getFone()+"/>"+
                                                    "</div>");
                                                    String dataNascCon = conDAO.getConjugeByIDMil(mil.getId()).getData_nasc();
                                                    if(dataNascCon != null){
                                                        out.println("<div class=\"form-group col-md-2\">"+
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

                                                    out.println("<div  id=\"div_dados_dependente\" style=\"display: none;\">"+
                                                    "<fieldset id=\"fd_dados_dependente\" class=\"parte-form col-md-12\" style=\"display: none;\">"+
                                                    "<legend>Dados dos Dependentes</legend>"+
                                                    "</fieldset>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: none;\">"+
                                                    "<div class=\"col-md-11\"></div>"+
                                                    "<span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "</div>"+
                                                    "</fieldset>");
                                    }else if(conDAO.getConjugeByIDMil(mil.getId()).getId() == 0 && depDAO.getDependentesIdMil(mil.getId()).size() != 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend>Dados Familiares</legend>"+
                                                    "<center>"+
                                                    "<div class=\"checkbox col-md-12\">"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\">"+
                                                    "Possui Esposa(o)?"+
                                                    "</label>"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\" checked>"+
                                                    "Possui Dependentes?"+
                                                    "</label>"+
                                                    "</div>"+
                                                    "</center>"+
                                                    "<div id=\"div_dados_conjuge\" style=\"display: none;\">"+
                                                    "   <div class=\"form-group col-md-5\">"+
                                                    "       <label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "       <input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\"/>"+
                                                    "   </div>"+
                                                    "   <div class=\"form-group col-md-3\">"+
                                                    "       <label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "       <input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                    "   </div>"+                                                    
                                                    "   <div class=\"form-group col-md-2\">"+
                                                    "       <label id=\"lblDataNascConjuge\" name=\"lblDataNascConjuge\" for=\"lblDataNascConjuge\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                    "       <input class=\"form-control data\" type=\"date\" id=\"txtDataNascConjuge\" name=\"txtDataNascConjuge\" onblur=\"valida_dataNasc(this.id)\"/>"+
                                                    "   </div>"+                                                    
                                                    "   <div class=\"form-group col-md-2\">"+
                                                    "       <label for=\"lblGravidez\">Esposa Grávida: </label><b class=\"obg\"> *</b>"+
                                                    "       <br>"+
                                                    "       <label class=\"radio-inline gravida\">"+
                                                    "           <input type=\"radio\" name=\"txtGravidez\" id=\"sim\" value=\"S\"> Sim"+
                                                    "       </label>"+
                                                    "       <label class=\"radio-inline gravida\">"+
                                                    "           <input type=\"radio\" name=\"txtGravidez\" id=\"nao\" value=\"N\"> Não"+
                                                    "       </label>"+                      
                                                    "   </div>"+
                                                    "</div>");
                                        int qtdeDependentes = depDAO.getDependentesIdMil(mil.getId()).size();
                                        out.println("<div  id=\"div_dados_dependente\" style=\"display: none;\">"+
                                                    "   <fieldset id=\"fd_dados_dependente\" class=\"parte-form col-md-12\" style=\"display: none;\">"+
                                                    "       <legend>Dados dos Dependentes</legend>");
                                                    for(int i=0;i<qtdeDependentes;i++){
                                                        out.println("<div id=linha"+(i+1)+" class=\"col-md-12\" style=\"padding-left: 0;\">"+
                                                                    "   <div id=\"div_nome_dependente\" class=\"t form-group col-md-5\">"+
                                                                    "   <label id=\"lblDependente\">Dependente: </label><b class=\"obg\"> *</b>"+
                                                                    "   <input class=form-control type=text id=txtNomeDependente"+(i+1)+" name=\"txtNomeDependente\" onblur=\"borda_input_text(this.id)\">"+
                                                                    "</div>"+
                                                                    "<div id=\"div_data_nasc_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                                    "   <label id=\"lblDataNascDependente\">Data de Nascimento: </label><b class=\"obg\"> *</b>"+
                                                                    "   <input class=form-control type=date id=txtDataNascDependente"+(i+1)+" name=\"txtDataNascDependente\" onblur=\"valida_dataNasc(this.id);\">"+
                                                                    "</div>"+
                                                                    "<div id=\"div_gr_parentesco_dependente\" class=\"qtd_div form-group col-md-3\">"+
                                                                    "   <label id=\"lblGrauParentescoDependente\">Grau de Parentesco: </label><b class=\"obg\"> *</b>"+
                                                                    "   <select class=form-control id=txtGrauParentescoDependente"+(i+1)+" name=\"txtGrauParentescoDependente\" onblur=\"borda_input_select(this.id)\">"); 
                                                        
                                                        if(dep.getGrau_parentesco() == 0){
                                                            out.println("<option value=\"0\" selected>Selecione o grau de Parentesco...</option>");
                                                        }else{
                                                            out.println("<option value=\"0\">Selecione o grau de Parentesco...</option>");
                                                        }
                                                        
                                                        int qtdGrauParentesco = dcb.getGrauParentesco().size();
                                                        for(int j=0;j<qtdGrauParentesco;j++){
                                                            if(dep.getGrau_parentesco() != 0 && ){
                                                                out.println("<option value='"+dep.getGrau_parentesco());
                                                            }
                                                        }
                                                        
                                                        
                                                    }

                                                    
                                                    "                   <option value="0" select="">Selecione o grau de Parentesco...</option>"
                                                    "                   <option value=\"1\">Conjuge</option>"+
                                                    "                   <option value="2">Filho(a)</option>"+
                                                    "                   <option value="3">Pai</option>"+
                                                    "                   <option value="4">Mãe</option>"+
                                                    "               </select>"+
                                                    "           </div>"+
                                                    "           <div id=\"3\" class=\"qtd_div form-group col-md-1\">"+
                                                    "               <span id=\"3\" class=\"glyphicon-geral glyphicon-remove form-control-feedback-remove btn-remove\" aria-hidden=\"true\" onclick=\"getId(this.id)\"></span>"+
                                                    "           </div>"+
                                                    "       </div>"+
                                                    "   </fieldset>"+
                                                    "   </div>"+
                                                    "   <div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: none;\">"+
                                                    "       <div class=\"col-md-11\"></div>"+
                                                    "       <span id=\"btnNovoDep\" alt=\"Clique aqui e adicione um novo dependente.\" class=\"glyphicon glyphicon-plus btn-add col-md-1\" aria-hidden=\"true\"></span>"+
                                                    "   </div>"+
                                                    "</fieldset>");
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: block;\">"+
                                                    "<center>"+
                                                    "<label id=\"lblNumDependente\" name=\"lblQtdeDependente\" for=\"lblQtdeDependente\">Quantidade de Dependente: </label><b class=\"obg\"> *</b>");
                                                    
                                                    
                                                    out.println("<input class=\"form-control\" type=\"number\" id=\"txtQtdeDependente\" name=\"txtQtdeDependente\" min=\"0\" max=\"50\" onblur=\"borda_input_text(this.id)\" onchange=\"limpa_div_dados_dependente();\" onkeypress=\"return somenteNumero(event);\" placeholder=\"Digite o número de dependentes.\" value=\""+qtdeDependentes+"\"/>"+
                                                    "</center>"+
                                                    "</div>"+

                                                    "<div id=\"div_dados_dependente\" style=\"display: block;\">");
                                                    
                                                
                                                    for(int i=0;i<qtdeDependentes;i++){
                                                        out.println("<div id=\"div_nome_dependente\" class=\"form-group col-md-6\">"+
                                                                    "<label id=lblDependente>Dependente"+(i+1)+"</label><b class=\"obg\"> *</b>"+
                                                                    "<input class=form-control type=text id=txtNomeDependente"+(i+1)+ "name=txtNomeDependente"+(i+1)+ "onblur=\"borda_input_text(this.id)\" style=\"border: 2px solid red; background: rgba(255, 0, 0, 0.2) none repeat scroll 0% 0%;\" value=\""+depDAO.getDependentesIdMil(mil.getId()).get(i).getNome()+"\">"+
                                                                    "</div>");
                                                    }
                                                    out.println("</div>"+
                                                    "</fieldset>");
                                    }
                                    /*else if(conDAO.getConjugeByIDMil(mil.getId()).getId() == 0 && depDAO.getDependentesIdMil(mil.getId()).size() != 0){
                                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                    "<legend>Dados Familiares</legend>"+
                                                    "<center>"+
                                                    "<div class=\"checkbox col-md-12\">"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxConjuge\" name=\"checkboxConjuge\" value=\"checkConjuge\" onclick=\"checkedConjuge()\">"+
                                                    "Possui Esposa(o)?"+
                                                    "</label>"+
                                                    "<label>"+
                                                    "<input type=\"checkbox\" id=\"checkboxDependente\" name=\"checkboxDependente\" value=\"checkDependente\" onclick=\"checkedDependente()\" checked>"+
                                                    "Possui Dependentes?"+
                                                    "</label>"+
                                                    "</div>"+
                                                    "</center>"+
                                                    "<div id=\"div_dados_conjuge\" style=\"display: none;\">"+
                                                    "<div class=\"form-group col-md-5\">"+
                                                    "<label id=\"lblNomeConjuge\" name=\"lblNomeConjuge\" for=\"lblNomeConjuge\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control\" type=\"text\" id=\"txtNomeConjuge\" name=\"txtNomeConjuge\" onblur=\"borda_input_text(this.id)\"/>"+
                                                    "</div>"+
                                                    "<div class=\"form-group col-md-3\">"+
                                                    "<label id=\"lblFoneConjuge\" name=\"lblFoneConjuge\" for=\"lblFoneConjuge\">Telefone: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneConjuge\" name=\"txtFoneConjuge\" placeholder=\"Ex.: (00) 00000-0000\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                    "</div>"+
                                                    
                                                       "<div class=\"form-group col-md-2\">"+
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

                                                    "</div>"+       
                                                    "<div class=\"form-group col-md-12\" id=\"div_qtde_dependente\" style=\"display: block;\">"+
                                                    "<center>"+
                                                    "<label id=\"lblNumDependente\" name=\"lblQtdeDependente\" for=\"lblQtdeDependente\">Quantidade de Dependente: </label><b class=\"obg\"> *</b>");
                                                    int qtdeDependentes = depDAO.getDependentesIdMil(mil.getId()).size();
                                                    
                                                    out.println("<input class=\"form-control\" type=\"number\" id=\"txtQtdeDependente\" name=\"txtQtdeDependente\" min=\"0\" max=\"50\" onblur=\"borda_input_text(this.id)\" onchange=\"limpa_div_dados_dependente();\" onkeypress=\"return somenteNumero(event);\" placeholder=\"Digite o número de dependentes.\" value=\""+qtdeDependentes+"\"/>"+
                                                    "</center>"+
                                                    "</div>"+

                                                    "<div id=\"div_dados_dependente\" style=\"display: block;\">");
                                                    
                                                
                                                    for(int i=0;i<qtdeDependentes;i++){
                                                        out.println("<div id=\"div_nome_dependente\" class=\"form-group col-md-6\">"+
                                                                    "<label id=lblDependente>Dependente"+(i+1)+"</label><b class=\"obg\"> *</b>"+
                                                                    "<input class=form-control type=text id=txtNomeDependente"+(i+1)+ "name=txtNomeDependente"+(i+1)+ "onblur=\"borda_input_text(this.id)\" style=\"border: 2px solid red; background: rgba(255, 0, 0, 0.2) none repeat scroll 0% 0%;\" value=\""+depDAO.getDependentesIdMil(mil.getId()).get(i).getNome()+"\">"+
                                                                    "</div>");
                                                    }
                                                    out.println("</div>"+
                                                    "</fieldset>");
                                    }*/
                                    
                                   

                                    out.println("<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Endereço</legend>"+
                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCep\" name=\"lblCep\" for=\"lblCep\">Cep: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control cep\" type=\"text\" name=\"txtCep\" id=\"txtCep\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getCep()+"\" onblur=\"valida_cep(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblEstado\" name=\"lblEstado\" for=\"lblEstado\">Estado: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtEstado\" id=\"estado\" class=\"form-control\" onblur=\"borda_input_select(this.id)\">");

                                    if(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId()).getId_bairro()).getId_cid()).getId_est()==0){
                                        out.println("<option value=\"0\" selected>Selecione o seu Estado...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione o seu Estado...</option>");
                                    }
                                    int qtdEstados = estDAO.getEstados().size();

                                        for(int i=0;i<qtdEstados;i++){
                                            if(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId()).getId_bairro()).getId_cid()).getId_est()==estDAO.getEstados().get(i).getId()){
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
                                    
                                                int id_cid = bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId()).getId_bairro()).getId_cid();
                                                if(id_cid == 0){
                                                    out.println("<option value=\"0\" selected>Selecione a sua Cidade..</option>");
                                                }else{
                                                    out.println("<option value=\"0\">Selecione a sua Cidade...</option>");
                                                }
                                                
                                                int qtdCidades = cDAO.getCidades().size();

                                                    for(int i=0;i<qtdCidades;i++){
                                                        if(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId()).getId_bairro()).getId_cid()==cDAO.getCidades().get(i).getId()){
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

                                                out.println("<div class=\"form-group col-md-10\">"+
                                                "<label id=\"lblLogradouro\" name=\"lblLogradouro\" for=\"lblLogradouro\">Rua/Av./Ala: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtLogradouro\" id=\"txtLogradouro\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getLogradouro()+"\" onblur=\"borda_input_text(this.id);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-2\">"+
                                                "<label id=\"lblNum\" name=\"lblNum\" for=\"lblNum\">Número: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtNum\" name=\"txtNum\" value=\""+mil.getEnd_num()+"\" onblur=\"borda_input_text(this.id);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblComplemento\" name=\"lblComplemento\" for=\"lblComplemento\">Complemento: </label>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtComplemento\" name=\"txtComplemento\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getComplemento()+"\" onblur=\"borda_input_text(this.id);\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Contato</legend>");
                                                
                                               
                                                out.println("<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone01\" name=\"lblFone01\" for=\"lblFone01\">Telefone 01</label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFone01\" name=\"txtFone01\" value=\""+mil.getFone1()+"\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                
                                                
                                                
                                                out.println("<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone02\" name=\"lblFone02\" for=\"lblFone02\">Telefone 02</label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFone02\" name=\"txtFone02\" value=\""+mil.getFone2()+"\" onblur=\"valida_fone_nn(this.id)\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                

                                                out.println("<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblEmail\" name=\"lblEmail\" for=\"lblEmail\">Email: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtEmail\" name=\"txtEmail\" value=\""+mil.getEmail()+"\" onblur=\"borda_input_text(this.id)\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblNomeReferencia\" name=\"lblNomeReferencia\" for=\"lblNomeReferencia\">Familiar de Contato: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" id=\"txtNomeReferencia\" name=\"txtNomeReferencia\" value=\""+mil.getNome_referencia()+"\" onblur=\"borda_input_text(this.id)\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFoneReferencia\" name=\"lblFoneReferencia\" for=\"lblFoneReferencia\">Contato do Familiar: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" id=\"txtFoneReferencia\" name=\"txtFoneReferencia\" value=\""+mil.getFone_referencia()+"\" onblur=\"valida_fone(this.id);\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Acesso</legend>"+
                                                

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblSenha\" name=\"lblSenha\" for=\"lblSenha\">Senha: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"password\" id=\"txtSenha\" name=\"txtSenha\" maxlength=\"20\" value=\""+mil.getSenha()+"\" onblur=\"valida_senha(this.id);\"/>"+
                                                "<b class=\"obg\">*No mínimo 6 caracteres</b>"+
                                                "</div>"+
                                                "</fieldset>"
                                            );
                        %>
                    <div class="linha-botoes col-md-12">
                        <button type="submit" id="btnCad" class="btn-padrao" value="Salvar">Salvar</button> 
                        
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
        <script type="text/javascript" src="../js/manipulacao.js"></script>
        
    </body>
</html>
