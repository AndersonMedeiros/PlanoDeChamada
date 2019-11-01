/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author de_paula
 */
//@WebFilter("/*")
public class filtroPaginas implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
	HttpSession sessao = httpServletRequest.getSession();	
        String url = httpServletRequest.getRequestURI();

        /*
        if (sessao.getAttribute("militarAutenticado") != null || url.lastIndexOf("index.jsp")>-1 ||
            url.lastIndexOf("autenticador")>-1 ){
                        
            chain.doFilter(request, response);
            
        }else{
            ((HttpServletResponse) response).sendRedirect("/PlanoDeChamda/index.jsp");
        }
        */
        boolean logado = false;
        if(sessao.getAttribute("militarAutenticado") != null){
            logado = true;
        }
        else if(logado == false){
            ((HttpServletResponse) response).sendRedirect("/PlanoDeChamda/erro.jsp?x=sessao-encerrada");
        }
        try{
            chain.doFilter(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        
    }

}
