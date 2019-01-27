/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Endereco;
import bean.Fone;
import bean.Habilitacao;
import bean.Militar;
import bean.TituloEleitor;
import dao.EnderecoDAO;
import dao.FoneDAO;
import dao.HabilitacaoDAO;
import dao.MilitarDAO;
import dao.TituloEleitorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        //Endereço
        Endereco end = new Endereco();
        end.setCep(request.getParameter("txtCep").replace("-", ""));
        end.setLogradouro(request.getParameter("txtLogradouro"));
        end.setComplemento(request.getParameter("txtComplemento"));
        end.setId_bairro(Integer.parseInt(request.getParameter("txtBairro")));
        EnderecoDAO endDAO = new EnderecoDAO();
        endDAO.inserir(end);
        
        //Titulo Eleitor
        TituloEleitor teleitor = new TituloEleitor();
        teleitor.setRegistro(request.getParameter("txtTeleitorRegistro").replace(" ", ""));
        teleitor.setSecao(request.getParameter("txtTeleitorSecao"));
        teleitor.setZona(request.getParameter("txtTeleitorZona"));
        TituloEleitorDAO teleitorDAO = new TituloEleitorDAO();
        teleitorDAO.inserir(teleitor);
        
        //Habilitação
        Habilitacao cnh = new Habilitacao();
        cnh.setNum(request.getParameter("txtCnhNum"));
        cnh.setCat(request.getParameter("txtCnhCat"));
        HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
        cnhDAO.inserir(cnh);
        
        //Fones
        Fone fone1 = new Fone();
        FoneDAO foneDAO = new FoneDAO();
        fone1.setNum(request.getParameter("txtFone01").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
        fone1.setIdentidade_mil(request.getParameter("txtIdentidade").replace("-", ""));
        foneDAO.inserir(fone1);
        Fone fone2 = new Fone();
        fone2.setNum(request.getParameter("txtFone02").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
        fone2.setIdentidade_mil(request.getParameter("txtIdentidade").replace("-", ""));
        foneDAO.inserir(fone2);

        //Militar
        Militar mil = new Militar();
        mil.setIdentidade(request.getParameter("txtIdentidade").replace("-", ""));
        mil.setNome(request.getParameter("txtNomeComp"));
        mil.setNome_guerra(request.getParameter("txtNomeGuerra"));
        mil.setCpf(request.getParameter("txtCpf").replace(".", "").replace("-", ""));
        mil.setPreccp(request.getParameter("txtPreccp"));
        mil.setSexo(request.getParameter("txtSexo"));
        mil.setData_nasc(request.getParameter("txtDataNasc").replace("/", "").replace("-", ""));
        mil.setData_praca(request.getParameter("txtDataPraca").replace("/", "").replace("-", ""));
        mil.setPai(request.getParameter("txtPai"));
        mil.setMae(request.getParameter("txtMae"));
        mil.setEmail(request.getParameter("txtEmail"));
        mil.setNome_referencia(request.getParameter("txtNomeReferencia"));
        mil.setFone_referencia(request.getParameter("txtFoneReferencia").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
        mil.setNaturalidade(request.getParameter("txtNaturalidade"));
        mil.setEnd_num(request.getParameter("txtNum"));
        mil.setSenha(request.getParameter("txtSenha"));
        
        mil.setId_end(endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), end.getComplemento(), end.getId_bairro()));
        mil.setId_div_sec(Integer.parseInt(request.getParameter("txtDivSec")));
        mil.setId_pg(Integer.parseInt(request.getParameter("txtPostGrad")));
        mil.setId_qq(Integer.parseInt(request.getParameter("txtQasQms")));
        mil.setId_ec(Integer.parseInt(request.getParameter("EstCivil")));
        mil.setId_esc(Integer.parseInt(request.getParameter("txtEscolaridade")));
        mil.setId_sit(Integer.parseInt(request.getParameter("txtSit")));
        mil.setId_cnh(cnhDAO.getIdCnh(cnh.getNum(), cnh.getCat()));
        mil.setId_teleitor(teleitorDAO.getIdTituloEleitor(teleitor.getRegistro(), teleitor.getZona(), teleitor.getSecao()));
        MilitarDAO milDAO = new MilitarDAO();
        
        if(milDAO.validarCPF(request.getParameter("txtCpf").replace(".", "").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }
        else if(milDAO.validarIDENTIDADE(request.getParameter("txtIdentidade").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }
        else{
            milDAO.inserir(mil);
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
