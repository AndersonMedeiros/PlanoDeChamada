/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.GeradorDeRelatorios;
import connection.ConnectionFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ander
 */
public class gerarRelatorio extends HttpServlet {

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
            out.println("<title>Servlet gerarRelatorio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet gerarRelatorio at " + request.getContextPath() + "</h1>");
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
        int id_div_sec, id_post_grad, id_qas_qms; 
        String sql_query =  "SELECT ds.nome AS ds_nome, " +
                            "       pg.nome AS pg_nome, " +
                            "       m.nome_guerra,  "+
                            "       m.nome AS mil_nome, " +
                            "       c.nome AS cid_nome, " +
                            "       b.nome AS bairro_nome, " +
                            "       m.end_logradouro, " +
                            "       m.end_num, " +
                            "       m.end_complemento, " +
                            "       m.fone1, " +
                            "       m.fone2, " +
                            "       m.email, " +
                            "       m.nome_referencia, " +
                            "       m.fone_referencia " +
                            "FROM militar as m, " +
                            "     divisaosecao as ds, " +
                            "     postograduacao as pg, " +
                            "	  cidade as c, " +
                            "	  bairro as b " +
                            "WHERE m.divisaosecao_id=ds.id and " +
                            "      m.postograduacao_id=pg.id and " +
                            "      m.bairro_cidade_id=c.id and " +
                            "      m.bairro_id=b.id and";

        if((request.getParameter("txtDivSec")!=null) && (request.getParameter("txtPostGrad")!=null)
                && (request.getParameter("txtQasQms")!=null)){
            id_div_sec = Integer.parseInt(request.getParameter("txtDivSec"));
            id_post_grad = Integer.parseInt(request.getParameter("txtPostGrad"));
            id_qas_qms = Integer.parseInt(request.getParameter("txtQasQms"));
            
            if(id_div_sec!=0 && id_post_grad==0 && id_qas_qms==0){
                sql_query+=" m.divisaosecao_id="+id_div_sec;
            }
            else if(id_div_sec==0 && id_post_grad!=0 && id_qas_qms==0){
                sql_query+=" m.postograduacao_id="+id_post_grad; 
            }
            else if(id_div_sec==0 && id_post_grad==0 && id_qas_qms!=0){
                sql_query+=" m.qasqms_id="+id_qas_qms; 
            }   
            else if(id_div_sec==0 && id_post_grad!=0 && id_qas_qms!=0){
                sql_query+=" m.postograduacao_id="+id_post_grad+" AND m.qasqms_id="+id_qas_qms;
            }
            else if(id_div_sec!=0 && id_post_grad==0 && id_qas_qms!=0){
                sql_query+=" m.divisaosecao_id="+id_div_sec+" AND m.qasqms_id="+id_qas_qms;
            }
            else if(id_div_sec!=0 && id_post_grad!=0 && id_qas_qms==0){
                sql_query+=" m.divisaosecao_id="+id_div_sec+" AND m.postograduacao_id="+id_post_grad;
            }
                  
            else if(id_div_sec!=0 && id_post_grad!=0 && id_qas_qms!=0){
                sql_query+=" m.divisaosecao_id="+id_div_sec+" AND m.postograduacao_id="+id_post_grad+" AND m.qasqms_id="+id_qas_qms;           
            }
            
            ServletContext contexto = getServletContext();
            String jrxml = contexto.getRealPath("/relatorios/RelatorioPlanoDeChamada.jrxml");

            // prepara parâmetros
            Map<String, Object> parametros = new HashMap<>();

            // abre conexão com o banco
            Connection conexao = new ConnectionFactory().getConnection();

            // gera relatório
            GeradorDeRelatorios gerador = new GeradorDeRelatorios(conexao);
            gerador.geraPdf(jrxml, parametros, response.getOutputStream(), sql_query);

            try {
                conexao.close(); // não esqueça de fechar a conexão
            } catch (SQLException ex) {
                Logger.getLogger(gerarRelatorio.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }else{
            response.sendRedirect("/PlanoDeChamada/restrito/EmitirRelatorio.jsp");
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
