/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Conjuge;
import bean.Dependente;
import bean.Endereco;
import bean.Habilitacao;
import bean.Militar;
import bean.TituloEleitor;
import dao.ConjugeDAO;
import dao.DependenteDAO;
import dao.EnderecoDAO;
import dao.FoneDAO;
import dao.HabilitacaoDAO;
import dao.MilitarDAO;
import dao.ReligiaoDAO;
import dao.TituloEleitorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author de_paula
 */
public class cadastrar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cadastrar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cadastrar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MilitarDAO milDAO = new MilitarDAO();
        FoneDAO foneDAO = new FoneDAO();
        
        if(milDAO.validarIDENTIDADE(request.getParameter("txtIdentidade").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }else if(milDAO.validarCPF(request.getParameter("txtCpf").replace(".", "").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }else{
            //Endereço
            Endereco end = new Endereco();
            end.setCep(request.getParameter("txtCep").replace("-", ""));
           
            end.setLogradouro(request.getParameter("txtLogradouro"));
            String complemento = "";
            if(request.getParameter("txtComplemento") != null){complemento = request.getParameter("txtComplemento");}
            end.setComplemento(complemento);
            int id_cid = Integer.parseInt(request.getParameter("txtCidade"));
            switch (id_cid) {
                case 1:
                    end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroManaus")));
                    break;
                case 2:
                    end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroRioPretoDaEva")));
                    break;
                case 3:
                    end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroIranduba")));
                    break;
                case 4:
                    end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroManacapuru")));
                    break;
            }
            EnderecoDAO endDAO = new EnderecoDAO();
            if(endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), end.getComplemento(), end.getId_bairro())==0){endDAO.inserir(end);}

            //Titulo Eleitor
            TituloEleitor teleitor = new TituloEleitor();
            teleitor.setRegistro(request.getParameter("txtTeleitorRegistro").replace(" ", ""));
            teleitor.setSecao(request.getParameter("txtTeleitorSecao"));
            teleitor.setZona(request.getParameter("txtTeleitorZona"));
            TituloEleitorDAO teleitorDAO = new TituloEleitorDAO();
            if(!teleitor.getRegistro().equals("")){teleitorDAO.inserir(teleitor);}
            
            //Militar
            Militar mil = new Militar();
            mil.setId_div_sec(Integer.parseInt(request.getParameter("txtDivSec")));
            mil.setId_pg(Integer.parseInt(request.getParameter("txtPostGrad")));
            mil.setId_qq(Integer.parseInt(request.getParameter("txtQasQms")));
            mil.setId_sit(Integer.parseInt(request.getParameter("txtSit")));
            mil.setNome(request.getParameter("txtNomeComp"));
            mil.setNome_guerra(request.getParameter("txtNomeGuerra"));          
            mil.setSexo(request.getParameter("txtSexo"));
            mil.setNaturalidade(request.getParameter("txtNatMilitar"));
            mil.setId_ec(Integer.parseInt(request.getParameter("txtEstCivil")));   
            mil.setData_praca(request.getParameter("txtDataPraca").replace("/", "").replace("-", ""));
            mil.setIdentidade(request.getParameter("txtIdentidade").replace("-", ""));          
            mil.setCpf(request.getParameter("txtCpf").replace(".", "").replace("-", ""));
            mil.setId_teleitor(teleitorDAO.getIdTituloEleitor(teleitor.getRegistro(), teleitor.getZona(), teleitor.getSecao()));
            mil.setPreccp(request.getParameter("txtPreccp"));
            mil.setData_nasc(request.getParameter("txtDataNasc").replace("/", "").replace("-", ""));
            mil.setPai(request.getParameter("txtPai"));
            mil.setMae(request.getParameter("txtMae"));
            mil.setId_esc(Integer.parseInt(request.getParameter("txtEscolaridade")));
            System.out.println(end.getCep()+ " "+end.getLogradouro()+" "+end.getComplemento()+" " +end.getId_bairro()+"idend"+endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), "", end.getId_bairro()));
            mil.setId_end(endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), "", end.getId_bairro()));
            //Religião
            int id_religiao = Integer.parseInt(request.getParameter("txtReligiao"));
            ReligiaoDAO religiaoDAO = new ReligiaoDAO();
            if(id_religiao == 1000){
                String nova_religiao = request.getParameter("txtOutraReligiao");
                religiaoDAO.inserir(nova_religiao);
                int id_nova_religiao = religiaoDAO.getReligiaoByNome(nova_religiao).getId();
                mil.setId_religiao(id_nova_religiao);
            }else{
                mil.setId_religiao(id_religiao);
            }
            
            

            mil.setEmail(request.getParameter("txtEmail"));
            mil.setNome_referencia(request.getParameter("txtNomeReferencia"));
            mil.setFone_referencia(request.getParameter("txtFoneReferencia").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
            mil.setFone1(request.getParameter("txtFone01").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
            mil.setFone2(request.getParameter("txtFone02").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
            
            mil.setEnd_num(request.getParameter("txtNum"));
            mil.setSenha(request.getParameter("txtSenha"));

            
            
            milDAO.inserir(mil);
            
            //Habilitação
            Habilitacao cnh = new Habilitacao();
            cnh.setNum(request.getParameter("txtCnhNum"));
            cnh.setCat(request.getParameter("txtCnhCat"));
            cnh.setData_validade(request.getParameter("txtCnhDataVal").replace("/", "").replace("-", ""));
            cnh.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
            HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
            if(!cnh.getNum().equals("")){cnhDAO.inserir(cnh);}
            
            //Conjuge
            ConjugeDAO conjugeDAO = new ConjugeDAO();
            if(request.getParameter("checkboxConjuge") != null){
                Conjuge conjuge = new Conjuge();
                conjuge.setNome(request.getParameter("txtNomeConjuge"));
                conjuge.setFone(request.getParameter("txtFoneConjuge").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
                conjuge.setData_nasc(request.getParameter("txtDataNascConjuge").replace("/", "").replace("-", ""));
                conjuge.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
                conjugeDAO.inserir(conjuge);
            }
            
            //Dependentes
            DependenteDAO dependenteDAO = new DependenteDAO();
            if(request.getParameter("checkboxDependente") != null){
                int qtdeDependentes = Integer.parseInt(request.getParameter("txtQtdeDependente"));
                for(int i=0;i<qtdeDependentes;i++){
                    System.out.println("sdfsd "+request.getParameter("txtDataNascDependente"+(i+1)).replace("/", "").replace("-", ""));
                    Dependente dependente = new Dependente();
                    dependente.setNome(request.getParameter("txtNomeDependente"+(i+1)));
                    dependente.setData_nasc(request.getParameter("txtDataNascDependente"+(i+1)).replace("/", "").replace("-", ""));
                    dependente.setGrau_parentesco(request.getParameter("txtGrauParentescoDependente"+(i+1)));
                    dependente.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
                    dependenteDAO.inserir(dependente); 
                }
            }
            /*//Fones
            Fone fone1 = new Fone();
            fone1.setNum(request.getParameter("txtFone01").replace("(", "").replace(")", "").replace(" ", "").replace("-", "")); 
            fone1.setId_mil(milDAO.getIdMilitar(mil.getIdentidade()));
            if(!fone1.getNum().equals("")){foneDAO.inserir(fone1);}

            Fone fone2 = new Fone();
            fone2.setNum(request.getParameter("txtFone02").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
            fone2.setId_mil(milDAO.getIdMilitar(mil.getIdentidade()));
            if(!fone2.getNum().equals("")){foneDAO.inserir(fone2);}*/

            RequestDispatcher despachante = getServletContext().getRequestDispatcher("/index.jsp?x=cadastro-sucesso");
            despachante.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
