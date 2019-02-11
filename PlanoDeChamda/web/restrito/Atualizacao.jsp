<%-- 
    Document   : Atualizacao
    Created on : 05/12/2018, 14:49:15
    Author     : ander
--%>
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
        <script src="../js/validacao_de_campos.js" type="text/javascript"></script>
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
        <title>Plano de Chamada - Atualização</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="../img/background-topo.png" class="img-responsive">
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
                        
   
                        out.println("<fieldset class=\"parte-form col-md-12\">"+
                                    "<legend>Dados Pessoais</legend>"+

                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblDivSec\" name=\"lblDivSec\" for=\"lblDivSec\">Divisão/Seção: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtDivSec\" id=\"divsec\" class=\"form-control\" onchange=\"borda_DivSec();\">");
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
                                    "<select name=\"txtPostGrad\" id=\"postgrad\" class=\"form-control\" onchange=\"borda_PostGrad();\">");
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
                                    "<select name=\"txtQasQms\" id=\"qasqms\" class=\"form-control\" onchange=\"borda_QasQms();\">");
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
                                    "<input type=\"radio\" name=\"txtSit\" id=\"divsec\" value=\"1\" checked>Ativo"+
                                    "</label>"+
                                    "</div>"+
                                                                   
                                    "<div class=\"form-group col-md-9\">"+
                                    "<label id=\"lblNomeComp\" name=\"lblNomeComp\" for=\"lblNomeComp\">Nome Completo: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" name=\"txtNomeComp\" value=\""+mil.getNome()+"\" onchange=\"borda_NomeComp()\"/>"+
                                    "</div>"+
                                   
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblNomeGuerra\" name=\"lblNomeGuerra\" for=\"lblNomeGuerra\">Nome de Guerra: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" name=\"txtNomeGuerra\" value=\""+mil.getNome_guerra()+"\" onchange=\"borda_NomeGuerra()\"/> "+
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
                                                "<label id=\"lblNaturalidade\" name=\"lblNaturalidade\" for=\"lblNaturalidade\">Naturalidade: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtNaturalidade\" id=\"naturalidade\" class=\"form-control\" onchange=\"borda_Naturalidade()\"> ");
                                    
                                    if(mil.getNaturalidade() != null && mil.getNaturalidade().equals("")){
                                        out.println("<option value=\"\" selected>Selecione a sua Naturalidade...</option>");
                                    }else{
                                        out.println("<option value=\"\">Selecione a sua Naturalidade...</option>");
                                    }
                                    int qtdNaturalidades = dcb.getNaturalidades().size();

                                        for(int i=0;i<qtdNaturalidades;i++){
                                            if(mil.getNaturalidade() != null && mil.getNaturalidade().equals(String.valueOf(dcb.getNaturalidades().get(i)))){
                                                out.println("<option value='"+String.valueOf(dcb.getNaturalidades().get(i))+"' selected>"+String.valueOf(dcb.getNaturalidades().get(i))+"</option>");
                                            }else{
                                                out.println("<option value='"+String.valueOf(dcb.getNaturalidades().get(i))+"'>"+String.valueOf(dcb.getNaturalidades().get(i))+"</option>");
                                            }
                                        }
                                    out.println("</select>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblEstCivil\" name=\"lblEstCivil\" for=\"lblEstCivil\">Estado Cívil: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEstCivil\" id=\"est_civil\" class=\"form-control\" onchange=\"borda_Est_Civil()\"> ");
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
                                    if(mil.getData_praca() != null){
                                        out.println(                                            
                                        "<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblDataPraca\" name=\"lblDataPraca\" for=\"lblDataPraca\">Data Praça: </label><b class=\"obg\"> *</b>"+
                                        "<input class=\"form-control data\" type=\"date\" name=\"txtDataPraca\" value=\""+mil.getData_praca().substring(0, 4)+"-"+mil.getData_praca().substring(4, 6)+"-"+mil.getData_praca().substring(6, 8)+"\" onblur=\"validarDataPraca_Att()\"/> "+
                                        "</div>");
                                    }
                                    out.println("<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblIdentidade\" name=\"lblIdentidade\" for=\"lblIdentidade\">Identidade: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control identidade\" type=\"text\" name=\"txtIdentidade\" value=\""+mil.getIdentidade()+"\" onblur=\"validarIDENTIDADE_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblCpf\" name=\"lblCpf\" for=\"lblCpf\">Cpf: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control cpf\" type=\"text\" name=\"txtCpf\" value=\""+mil.getCpf()+"\" onblur=\"return validarCPF_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                
                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblTeleitorRegistro\" name=\"lblTeleitorRegistro\" for=\"lblTeleitorRegistro\">Titulo Eleitor: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control titulo_eleitor\"  type=\"text\" name=\"txtTeleitorRegistro\" maxlength=\"12\" id=\"titulo_eleitor\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getRegistro()+"\" onblur=\"return validarTITULO();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                        
                                    "<div class=\"form-group col-md-2\">"+
                                    "<label id=\"lblTeleitorZona\" name=\"lblTeleitorZona\" for=\"lblTeleitorZona\">Zona: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\"  type=\"text\" name=\"txtTeleitorZona\" maxlength=\"3\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getZona()+"\" onblur=\"return validarZONA();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+
                                                        
                                    "<div class=\"form-group col-md-2\">"+
                                    "<label id=\"lblTeleitorSecao\" name=\"lblTeleitorSecao\" for=\"lblTeleitorSecao\">Seção: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\"  type=\"text\" name=\"txtTeleitorSecao\" maxlength=\"4\" value=\""+teleitorDAO.getTituloEleitor(mil.getId_teleitor()).getSecao()+"\" onblur=\"return validarSECAO();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblPreccp\" name=\"lblPreccp\" for=\"lblPreccp\">Preccp: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control\" type=\"text\" name=\"txtPreccp\" maxlength=\"9\" value=\""+mil.getPreccp()+"\" onblur=\"validarPRECCP_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>");

                                    if(mil.getData_nasc() != null){
                                        out.println("<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblDataNasc\" name=\"lblDataNasc\" for=\"lblDataNasc\">Data de Nascimento: </label>"+
                                                    "<input class=\"form-control data\" type=\"date\" name=\"txtDataNasc\" value=\""+mil.getData_nasc().substring(0, 4)+"-"+mil.getData_nasc().substring(4, 6)+"-"+mil.getData_nasc().substring(6, 8)+"\" onblur=\"validarDataNasc_Att();\"/>"+
                                                    "</div>");
                                    }
                                                
                                    if(mil.getId_cnh() == 0){
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" name=\"txtCnhNum\" maxlength=\"11\" value=\"\" onkeypress=\"return somenteNumero(event);\"/>"+
                                        "</div>");
                                    }else{
                                        out.println("<div class=\"form-group col-md-4\">"+
                                        "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                        "<input class=\"form-control\" type=\"text\" name=\"txtCnhNum\" maxlength=\"11\" value=\""+cnhDAO.getCNH(mil.getId_cnh()).getNum()+"\" onkeypress=\"return somenteNumero(event);\"/>"+
                                        "</div>");
                                    }

                                    out.println("<div class=\"form-group col-md-4\">"+
                                    "<label id=\"lblCnhCat\" name=\"lblCnhCat\" for=\"lblCnhCat\">CNH Categoria: </label>"+
                                    "<select name=\"txtCnhCat\" id=\"cnh_cat\" class=\"form-control\">");
                                    if(mil.getId_cnh()== 0){
                                    out.println("<option value=\"0\" selected>Selecione a Categoria...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a Categoria...</option>");
                                    }
                                    int qtdCnh = cnhDAO.getCNHS().size();

                                    for(int i=0;i<qtdCnh;i++){
                                        if(mil.getId_ec()==cnhDAO.getCNHS().get(i).getId()){
                                            out.println("<option value='"+cnhDAO.getCNHS().get(i).getCat()+"' selected>"+cnhDAO.getCNHS().get(i).getCat()+"</option>");
                                        }else{
                                            out.println("<option value='"+cnhDAO.getCNHS().get(i).getCat()+"'>"+cnhDAO.getCNHS().get(i).getCat()+"</option>");
                                        }
                                    }
                                    out.println("</select>"+
                                    "</div>"+
                                                            
                                    "<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblPai\" name=\"lblPai\" for=\"lbPai\">Pai: </label>"+
                                    "<input class=\"form-control\" type=\"text\" name=\"txtPai\" value=\""+mil.getPai()+"\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-6\">"+
                                    "<label id=\"lblMae\" name=\"lblMae\" for=\"lblMae\">Mãe: </label>"+
                                    "<input class=\"form-control\" type=\"text\" name=\"txtMae\" value=\""+mil.getMae()+"\"/>"+
                                    "</div>"+

                                   "<div class=\"form-group col-md-12\">"+
                                    "<label id=\"lblEscolaridade\" name=\"lblEscolaridade\" for=\"lblEscolaridade\">Escolaridade: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEscolaridade\" id=\"escolaridade\" class=\"form-control\" onchange=\"borda_Escolaridade();\">");
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
                                    out.println("</select>"+
                                    "</div>"+
                                    "</fieldset>"+

                                    "<fieldset class=\"parte-form col-md-12\">"+
                                    "<legend>Dados de Endereço</legend>"+
                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblCep\" name=\"lblCep\" for=\"lblCep\">Cep: </label><b class=\"obg\"> *</b>"+
                                    "<input class=\"form-control cep\" type=\"text\" name=\"txtCep\" id=\"cep\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getCep()+"\" onblur=\"validarCEP_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                    "</div>"+

                                    "<div class=\"form-group col-md-3\">"+
                                    "<label id=\"lblEstado\" name=\"lblEstado\" for=\"lblEstado\">Estado: </label><b class=\"obg\"> *</b>"+
                                    "<select name=\"txtEstado\" id=\"estado\" class=\"form-control\"> onchange=\"borda_Estado()\"");

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
                                                "<select name=\"txtCidade\" id=\"cidade\" class=\"form-control\" onchange=\"borda_Cidade()\"> ");
                                    
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
                                                out.println("<select name=\"txtpadrao\" id=\"padrao\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
                                                out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");  
                                                out.println("</select>");

                                                        /*
                                                        for(int i=1;i<=qtdCidades;i++){
                                                            if(id_cid==i){
                                                                String nome_cid = cDAO.getCidades().get(i).getNome().replace(" ", "");
                                                                out.println("<select name=txtBairro"+nome_cid+" id=bairros"+nome_cid+" class=form-control onchange=borda_Bairro()>");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                                int qtdBairros = bDAO.getBairrosByCidade(i).size();
                                                                for(int j=0;j<qtdBairros;j++){
                                                                    if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(i).get(j).getId()){
                                                                        out.println("<option value='"+bDAO.getBairrosByCidade(i).get(j).getId()+"' selected>"+bDAO.getBairrosByCidade(i).get(j).getNome()+"</option>");
                                                                    }else{
                                                                        out.println("<option value='"+bDAO.getBairrosByCidade(i).get(j).getId()+"'>"+bDAO.getBairrosByCidade(i).get(j).getNome()+"</option>");
                                                                    }
                                                                }
                                                            out.println("</select>"+
                                                            "</div>");
                                                            }else{
                                                                String nome_cid = cDAO.getCidades().get(i).getNome().replace(" ", "");
                                                                out.println("<select name=txtBairro"+nome_cid+" id=bairros"+nome_cid+" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\">");
                                                                if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                                }else{
                                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                                }
                                                                int qtdBairros = bDAO.getBairrosByCidade(i).size();
                                                                for(int j=0;j<qtdBairros;j++){
                                                                    if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(i).get(j).getId()){
                                                                        out.println("<option value='"+bDAO.getBairrosByCidade(i).get(j).getId()+"' selected>"+bDAO.getBairrosByCidade(i).get(j).getNome()+"</option>");
                                                                    }else{
                                                                        out.println("<option value='"+bDAO.getBairrosByCidade(i).get(j).getId()+"'>"+bDAO.getBairrosByCidade(i).get(j).getNome()+"</option>");
                                                                    }
                                                                }
                                                                out.println("</select>"+
                                                                "</div>");
                                                            }
                                                        }*/
                                                    switch(id_cid){
                                                        case 1:
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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
                                                            out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onchange=\"borda_Bairro()\" style=\"display: none;\"> ");
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

                                                            out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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
                                    
                                                     
                                                
                                                /*out.println("<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblBairro\" name=\"lblBairro\" for=\"lblBairro\">Bairro: </label><b class=\"obg\"> *</b>");
                                                switch(id_cid){
                                                    case 1:
                                                        out.println("<select name=\"txtBairroManaus\" id=\"bairrosManaus\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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
                                                        out.println("</select>"+
                                                        "</div>"); 
                                                        break;
                                                    case 2:
                                                        out.println("<select name=\"txtBairroRioPretoDaEva\" id=\"bairrosRioPretoDaEva\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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
                                                        out.println("</select>"+
                                                        "</div>"); 
                                                        break;
                                                    case 3:
                                                        out.println("<select name=\"txtBairroIranduba\" id=\"bairrosIranduba\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
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
                                                        out.println("</select>"+
                                                        "</div>"); 
                                                        break;
                                                    case 4:
                                                        out.println("<select name=\"txtBairroManacapuru\" id=\"bairrosManacapuru\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
                                                        if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro() == 0){
                                                            out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                        }else{
                                                            out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                        }
                                                        qtdBairros = bDAO.getBairrosByCidade(4).size();
                                                        for(int i=0;i<qtdBairros;i++){
                                                            if(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()==bDAO.getBairrosByCidade(4).get(i).getId()){
                                                                out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"' selected>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                            }else{
                                                                out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                                            }
                                                        }
                                                        out.println("</select>"+
                                                        "</div>"); 
                                                        break;
                                                }*/
                                                        
                                                
                                                //System.out.println("mil_id: "+mil.getId()+" end: "+endDAO.getEnderecoById(mil.getId_end()).getId_bairro());

                                                out.println("<div class=\"form-group col-md-10\">"+
                                                "<label id=\"lblLogradouro\" name=\"lblLogradouro\" for=\"lblLogradouro\">Rua/Av./Ala: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtLogradouro\"id=\"log\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getLogradouro()+"\" onchange=\"borda_Logradouro();\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-2\">"+
                                                "<label id=\"lblNum\" name=\"lblNum\" for=\"lblNum\">Número: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtNum\" value=\""+mil.getEnd_num()+"\" onchange=\"borda_Num();\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblComplemento\" name=\"lblComplemento\" for=\"lblComplemento\">Complemento: </label>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtComplemento\" value=\""+endDAO.getEnderecoById(mil.getId_end()).getComplemento()+"\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Contato</legend>");
                                                
                                               
                                                out.println("<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone01\" name=\"lblFone01\" for=\"lblFone01\">Telefone 01</label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtFone01\" value=\""+mil.getFone1()+"\" onblur=\"validarFONE01_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                
                                                
                                                
                                                out.println("<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone02\" name=\"lblFone02\" for=\"lblFone02\">Telefone 02</label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtFone02\" value=\""+mil.getFone2()+"\" onblur=\"validarFONE02_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                

                                                out.println("<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblEmail\" name=\"lblEmail\" for=\"lblEmail\">Email: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtEmail\" value=\""+mil.getEmail()+"\" onchange=\"borda_Email()\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblNomeReferencia\" name=\"lblNomeReferencia\" for=\"lblNomeReferencia\">Familiar de Contato: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtNomeReferencia\" value=\""+mil.getNome_referencia()+"\" onchange=\"borda_Familiar()\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFoneReferencia\" name=\"lblFoneReferencia\" for=\"lblFoneReferencia\">Contato do Familiar: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtFoneReferencia\" value=\""+mil.getFone_referencia()+"\" onblur=\"validarContFam_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Acesso</legend>"+
                                                

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblSenha\" name=\"lblSenha\" for=\"lblSenha\">Senha: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"password\" name=\"txtSenha\" maxlength=\"20\" value=\""+mil.getSenha()+"\" onblur=\"return validaSenha();\"/>"+
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
            <p>Desenvolvido pela Seção de Tecnologia da Informação - 2018</p>
        </footer>
         
                    
                    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
            
        <script src="bootstrap/js/bootstrap.js"></script>
        
        
        <script type="text/javascript" src="../js/mascaras.js"></script>
        <script type="text/javascript" src="../js/preenchimento-endereco.js"></script>
        <script type="text/javascript" src="../js/manipulacao.js"></script>
        
    </body>
</html>
