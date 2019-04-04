<%-- 
    Document   : atualizacao
    Created on : 14/03/2019, 14:21:37
    Author     : root
--%>

<%@page import="dao.CidadeDAO"%>
<%@page import="dao.EnderecoDAO"%>
<%@page import="dao.FoneDAO"%>
<%@page import="dao.ConjugeDAO"%>
<%@page import="dao.DependenteDAO"%>
<%@page import="dao.ReligiaoDAO"%>
<%@page import="dao.HabilitacaoDAO"%>
<%@page import="dao.TituloEleitorDAO"%>
<%@page import="dao.BairroDAO"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="dao.EstadoCivilDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="bean.Militar"%>
<%@page import="dao.MilitarDAO"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="dao.DivisaoSecaoDAO"%>
<%@page import="bean.DadosCheckBox"%>
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
                        ReligiaoDAO relDAO = new ReligiaoDAO();
                        ConjugeDAO conDAO = new ConjugeDAO();
                        DependenteDAO depDAO = new DependenteDAO();
   
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
                                                "<label id=\"lblNatMilitar\" name=\"lblNatMilitar\" for=\"lblNatMilitar\">Naturalidade: </label><b class=\"obg\"> *</b>"+
                                                "<select name=\"txtNatMilitar\" id=\"txt_natmilitar\" class=\"form-control\" onblur=borda_input_select(this.id)>");
                                    
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
                                            
                                    
                                            
                                    out.println("</fieldset>");
                    %>
            </form>
        </section>
    </body>
</html>
