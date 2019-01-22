/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Militar;
import dao.MilitarDAO;
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
        Militar mil = new Militar();
        
        //Dados Pessoais
        mil.setId_div_sec(Integer.parseInt(request.getParameter("txtDivSec")));
        mil.setId_post_grad(Integer.parseInt(request.getParameter("txtPostGrad")));
        mil.setId_qas_qms(Integer.parseInt(request.getParameter("txtQasQms")));
        mil.setId_sit(Integer.parseInt(request.getParameter("txtSit")));
        mil.setNome(request.getParameter("txtNomeComp"));
        mil.setNome_guerra(request.getParameter("txtNomeGuerra"));
        mil.setSexo(request.getParameter("txtSexo"));
        mil.setNaturalidade(request.getParameter("txtNaturalidade"));
        mil.setEst_civil(request.getParameter("txtEstCivil"));
        mil.setDt_praca(request.getParameter("txtDataPraca").replace("/", "").replace("-", ""));
        mil.setIdentidade(request.getParameter("txtIdentidade").replace("-", ""));
        mil.setCpf(request.getParameter("txtCpf").replace(".", "").replace("-", ""));
        mil.setPreccp(request.getParameter("txtPreccp"));
        mil.setTitulo_num(request.getParameter("txtTituloEleitor").replace(" ", ""));
        mil.setTitulo_zona(request.getParameter("txtZona"));
        mil.setTitulo_secao(request.getParameter("txtSecao"));
        mil.setData_nasc(request.getParameter("txtDataNasc").replace("/", "").replace("-", ""));
        mil.setCnh_num(request.getParameter("txtCnhNum"));
        mil.setCnh_cat(request.getParameter("txtCnhCat"));
        mil.setPai(request.getParameter("txtPai"));
        mil.setMae(request.getParameter("txtMae"));
        mil.setId_esc(Integer.parseInt(request.getParameter("txtEscolaridade")));

        //Dados de Endereco
        mil.setEnd_cep(request.getParameter("txtCep").replace("-", ""));
        mil.setId_est(Integer.parseInt(request.getParameter("txtEstado")));
        mil.setId_cid(Integer.parseInt(request.getParameter("txtCidade")));
        
        
        mil.setId_bairro(Integer.parseInt(request.getParameter("txtBairro")));
     
        mil.setEnd_logradouro(request.getParameter("txtLogradouro"));
        mil.setEnd_numero(request.getParameter("txtNum"));
        mil.setEnd_complemento(request.getParameter("txtComplemento"));

        //Dados de Contato
        mil.setFone1(request.getParameter("txtFone01").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
        mil.setFone2(request.getParameter("txtFone02").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));
        mil.setEmail(request.getParameter("txtEmail"));
        mil.setCont_referencia(request.getParameter("txtFamiliar"));
        mil.setFone_referencia(request.getParameter("txtContFamiliar").replace("(", "").replace(")", "").replace(" ", "").replace("-", ""));

        //Dados de Acesso
        mil.setSenha(request.getParameter("txtSenha"));
       
        MilitarDAO milDAO = new MilitarDAO();
        
        if(milDAO.validarCPF(request.getParameter("txtCpf").replace(".", "").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=login-duplicado");
        }
        else if(milDAO.validarIDENTIDADE(request.getParameter("txtIdentidade").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=login-duplicado");
        }
        else{
            milDAO.inserir(mil);
            RequestDispatcher despachante = getServletContext().getRequestDispatcher("/index.jsp");
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
