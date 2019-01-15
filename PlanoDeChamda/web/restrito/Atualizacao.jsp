<%-- 
    Document   : Atualizacao
    Created on : 05/12/2018, 14:49:15
    Author     : ander
--%>
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
        <link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="css/estilo.css" type="text/css" rel="stylesheet"/>
        <link href="css/estilo_cadastro.css" type="text/css" rel="stylesheet"/>
        <link href="css/estilo-att.css" type="text/css" rel="stylesheet"/>
        <script src="js/validacao_de_campos.js" type="text/javascript"></script>
        
        <title>Plano de Chamada - Atualização</title>
    </head>
    <body class="tela">
        <header class="header">
            <img src="img/background-topo2.png" class="img-responsive">
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
                                    <li class="active"><a href="Atualizacao.jsp">Atualizar Dados <span class="sr-only">(current)</span></a></li>                                 
                                    <% 
                                        HttpSession sessao = request.getSession();
                                       
                                        if(String.valueOf(sessao.getAttribute("tipo_acesso")).equals("admin")){
                                            out.println("<li><a href=\"EmitirRelatorio.jsp\">Emitir Relatório</a></li>");
                                        }
                                    %>                                   
                                  <!-- <li><a href="FaleConosco.jsp">Sair <span class="sr-only">(current)</span></a></li> -->
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><form name="formSair" method="get" action="autenticador"><button class="btn-sair" type="submit">Sair</button></form></li>
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
                        
                            MilitarDAO milDAO = new MilitarDAO();
                            Militar milAutenticado = (Militar) sessao.getAttribute("militarAutenticado");
                            Militar mil = milDAO.getMilitar(milAutenticado.getIdentidade(), milAutenticado.getSenha());
                           
                        
                        DadosCheckBox dcb = new DadosCheckBox();
                        

                        
                        BairroDAO bDAO = new BairroDAO();
                        CidadeDAO cDAO = new CidadeDAO();
                        DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();
                        PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
                        QasQmsDAO qasqmsDAO = new QasQmsDAO();
                        EscolaridadeDAO escDAO = new EscolaridadeDAO();
                        
                        

                        
                        

                            
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
                                    if(mil.getId_post_grad()== 0){
                                        out.println("<option value=\"0\" selected>Selecione o Posto/Graduação...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione o Posto/Graduação...</option>");
                                    }
                                    int qtdPostGrad = pgDAO.getPostGrads().size();

                                        for(int i=0;i<qtdPostGrad;i++){
                                            if(mil.getId_post_grad()==pgDAO.getPostGrads().get(i).getId()){
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
                                    if(mil.getId_qas_qms()== 0){
                                        out.println("<option value=\"0\" selected>Selecione a QAS/QMS...</option>");
                                    }else{
                                        out.println("<option value=\"0\">Selecione a QAS/QMS...</option>");
                                    }
                                    int qtdQasQms = qasqmsDAO.getArmas().size();

                                        for(int i=0;i<qtdQasQms;i++){
                                            if(mil.getId_qas_qms()==qasqmsDAO.getArmas().get(i).getId()){
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
                                    
                                                if(mil.getEst_civil() != null && mil.getEst_civil().equals("")){
                                                    out.println("<option value=\"\" selected>Selecione o seu Estado Cívil...</option>");
                                                }else{
                                                    out.println("<option value=\"\">Selecione o seu Estado Cívil...</option>");
                                                }
                                                int qtdEst_civis = dcb.getEstadosCivis().size();

                                                    for(int i=0;i<qtdEst_civis;i++){
                                                        if(mil.getEst_civil() != null && mil.getEst_civil().equals(String.valueOf(dcb.getEstadosCivis().get(i)))){
                                                            out.println("<option value='"+String.valueOf(dcb.getEstadosCivis().get(i))+"' selected>"+String.valueOf(dcb.getEstadosCivis().get(i))+"</option>");
                                                        }else{
                                                            out.println("<option value='"+String.valueOf(dcb.getEstadosCivis().get(i))+"'>"+String.valueOf(dcb.getEstadosCivis().get(i))+"</option>");
                                                        }
                                                    }
                                                    out.println("</select>"+"</div>");
                                                    
                                                if(mil.getDt_praca() != null){
                                                    out.println(                                            
                                                    "<div class=\"form-group col-md-4\">"+
                                                    "<label id=\"lblDataPraca\" name=\"lblDataPraca\" for=\"lblDataPraca\">Data Praça: </label><b class=\"obg\"> *</b>"+
                                                    "<input class=\"form-control data\" type=\"date\" name=\"txtDataPraca\" value=\""+mil.getDt_praca().substring(0, 4)+"-"+mil.getDt_praca().substring(4, 6)+"-"+mil.getDt_praca().substring(6, 8)+"\" onblur=\"validarDataPraca_Att()\"/> "+
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

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblPreccp\" name=\"lblPreccp\" for=\"lblPreccp\">Preccp: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtPreccp\" maxlength=\"9\" value=\""+mil.getPreccp()+"\" onblur=\"validarPRECCP_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>");
                                                
                                                if(mil.getData_nasc() != null){
                                                    out.println("<div class=\"form-group col-md-3\">"+
                                                                "<label id=\"lblDataNasc\" name=\"lblDataNasc\" for=\"lblDataNasc\">Data de Nascimento: </label>"+
                                                                "<input class=\"form-control data\" type=\"date\" name=\"txtDataNasc\" value=\""+mil.getData_nasc().substring(0, 4)+"-"+mil.getData_nasc().substring(4, 6)+"-"+mil.getData_nasc().substring(6, 8)+"\" onblur=\"validarDataNasc_Att();\"/>"+
                                                                "</div>");
                                                }

                                                out.println("<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCnhNum\" name=\"lblCnhNum\" for=\"lblCnhNum\">CNH Número: </label>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtCnhNum\" maxlength=\"11\" value=\""+mil.getCnh_num()+"\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCnhCat\" name=\"lblCnhCat\" for=\"lblCnhCat\">CNH Categoria: </label>"+
                                                "<select name=\"txtCnhCat\" id=\"cnh_cat\" class=\"form-control\">");

                                                if(mil.getCnh_cat() != null && mil.getCnh_cat().equals("")){
                                                    out.println("<option value=\"\" selected>Selecione a categoria...</option>");
                                                }else{
                                                    out.println("<option value=\"\">Selecione a categoria...</option>");
                                                }

                                                 int qtdCnh_cats = dcb.getCnhCat().size();

                                                    for(int i=0;i<qtdCnh_cats;i++){
                                                        if(mil.getCnh_cat() != null && mil.getCnh_cat().equals(String.valueOf(dcb.getCnhCat().get(i)))){
                                                            out.println("<option value='"+String.valueOf(dcb.getCnhCat().get(i))+"' selected>"+String.valueOf(dcb.getCnhCat().get(i))+"</option>");
                                                        }else{
                                                            out.println("<option value='"+String.valueOf(dcb.getCnhCat().get(i))+"'>"+String.valueOf(dcb.getCnhCat().get(i))+"</option>");
                                                        }
                                                    }

                                                out.println("</select>"+
                                                "</div>"+
                                                            
                                                "<div class=\"form-group col-md-5\">"+
                                                "<label id=\"lblPai\" name=\"lblPai\" for=\"lbPai\">Pai: </label>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtPai\" value=\""+mil.getPai()+"\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-4\">"+
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
                                                "<input class=\"form-control cep\" type=\"text\" name=\"txtCep\" id=\"cep\" value=\""+mil.getEnd_cep()+"\" onblur=\"validarCEP_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblEstado\" name=\"lblEstado\" for=\"lblEstado\">Estado: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtEstado\" id=\"estado\" class=\"form-control\"> onchange=\"borda_Estado()\"");
                                    
                                                if(mil.getEnd_estado() != null && mil.getEnd_estado().equals("")){
                                                    out.println("<option value=\"\" selected>Selecione o seu Estado...</option>");
                                                }else{
                                                    out.println("<option value=\"\">Selecione o seu Estado...</option>");
                                                }
                                                int qtdEstados = dcb.getEstados().size();

                                                    for(int i=0;i<qtdEstados;i++){
                                                        if(mil.getEnd_estado() != null && mil.getEnd_estado().equals(String.valueOf(dcb.getEstados().get(i)))){
                                                            out.println("<option value='"+String.valueOf(dcb.getEstados().get(i))+"' selected>"+String.valueOf(dcb.getEstados().get(i))+"</option>");
                                                        }else{
                                                            out.println("<option value='"+String.valueOf(dcb.getEstados().get(i))+"'>"+String.valueOf(dcb.getEstados().get(i))+"</option>");
                                                        }
                                                    }
                                                out.println("</select>"+
                                                "</div>"+
                                                        
                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblCidade\" name=\"lblCidade\" for=\"lblCidade\">Cidade: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtCidade\" id=\"cidade\" class=\"form-control\" onchange=\"borda_Cidade()\"> ");
                                                if(mil.getId_cid()== 0){
                                                    out.println("<option value=\"0\" selected>Selecione a sua Cidade..</option>");
                                                }else{
                                                    out.println("<option value=\"0\">Selecione a sua Cidade...</option>");
                                                }
                                                
                                                int qtdCidades = cDAO.getCidades().size();

                                                    for(int i=0;i<qtdCidades;i++){
                                                        if(mil.getId_cid()==cDAO.getCidades().get(i).getId()){
                                                            out.println("<option value='"+cDAO.getCidades().get(i).getId()+"' selected>"+cDAO.getCidades().get(i).getNome()+"</option>");
                                                        }else{
                                                            out.println("<option value='"+cDAO.getCidades().get(i).getId()+"'>"+cDAO.getCidades().get(i).getNome()+"</option>");
                                                        }
                                                    }
                                                out.println("</select>"+
                                                "</div>"+

                                                

                                                "<div class=\"form-group col-md-3\">"+
                                                "<label id=\"lblBairro\" name=\"lblBairro\" for=\"lblBairro\">Bairro: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtBairro\" id=\"bairro\" class=\"form-control\" onchange=\"borda_Bairro()\"> ");
                                                if(mil.getId_bairro()== 0){
                                                    out.println("<option value=\"0\" selected>Selecione o Bairro...</option>");
                                                }else{
                                                    out.println("<option value=\"0\">Selecione o Bairro...</option>");
                                                }
                                                int qtdBairros = bDAO.getBairros().size();

                                                    for(int i=0;i<qtdBairros;i++){
                                                        if(mil.getId_bairro()==bDAO.getBairros().get(i).getId()){
                                                            out.println("<option value='"+bDAO.getBairros().get(i).getId()+"' selected>"+bDAO.getBairros().get(i).getNome()+"</option>");
                                                        }else{
                                                            out.println("<option value='"+bDAO.getBairros().get(i).getId()+"'>"+bDAO.getBairros().get(i).getNome()+"</option>");
                                                        }
                                                    }
                                                out.println("</select>"+
                                                "</div>"+        
                                                
                                                "<div class=\"form-group col-md-10\">"+
                                                "<label id=\"lblLogradouro\" name=\"lblLogradouro\" for=\"lblLogradouro\">Rua/Av./Ala: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtLogradouro\"id=\"log\" value=\""+mil.getEnd_logradouro()+"\" onchange=\"borda_Logradouro();\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-2\">"+
                                                "<label id=\"lblNum\" name=\"lblNum\" for=\"lblNum\">Número: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtNum\" value=\""+mil.getEnd_numero()+"\" onchange=\"borda_Num();\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblComplemento\" name=\"lblComplemento\" for=\"lblComplemento\">Complemento: </label>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtComplemento\" value=\""+mil.getEnd_complemento()+"\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Contato</legend>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone01\" name=\"lblFone01\" for=\"lblFone01\">Telefone 01: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtFone01\" value=\""+mil.getFone1()+"\" onblur=\"validarFONE01_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFone02\" name=\"lblFone02\" for=\"lblFone02\">Telefone 02: </label>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtFone02\" value=\""+mil.getFone2()+"\" onblur=\"validarFONE02_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+    

                                                "<div class=\"form-group col-md-12\">"+
                                                "<label id=\"lblEmail\" name=\"lblEmail\" for=\"lblEmail\">Email: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtEmail\" value=\""+mil.getEmail()+"\" onchange=\"borda_Email()\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblFamiliar\" name=\"lblFamiliar\" for=\"lblFamiliar\">Familiar de Contato: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control\" type=\"text\" name=\"txtFamiliar\" value=\""+mil.getCont_referencia()+"\" onchange=\"borda_Familiar()\"/>"+
                                                "</div>"+

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblContFamiliar\" name=\"lblContFamiliar\" for=\"lblContFamiliar\">Contato do Familiar: </label><b class=\"obg\"> *</b>"+
                                                "<input class=\"form-control fone\" type=\"text\" name=\"txtContFamiliar\" value=\""+mil.getFone_referencia()+"\" onblur=\"validarContFam_Att();\" onkeypress=\"return somenteNumero(event);\"/>"+
                                                "</div>"+
                                                "</fieldset>"+

                                                "<fieldset class=\"parte-form col-md-12\">"+
                                                "<legend>Dados de Acesso</legend>"+
                                                

                                                "<div class=\"form-group col-md-6\">"+
                                                "<label id=\"lblSenha\" name=\"lblNomeComp\" for=\"lblSenha\">Senha: </label><b class=\"obg\"> *</b>"+
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
        
        
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script type="text/javascript" src="js/preenchimento-endereco.js"></script>
        <script type="text/javascript" src="js/manipulacao.js"></script>
        
    </body>
</html>
