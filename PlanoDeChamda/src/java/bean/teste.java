/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import dao.EnderecoDAO;
import dao.HabilitacaoDAO;
import dao.MilitarDAO;

/**
 *
 * @author ander
 */
public class teste {
    public static void main(String[] args) {
        String cnh_num="", cnh_cat = "a";
    
      
        EnderecoDAO endDAO = new EnderecoDAO();
        HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
        MilitarDAO milDAO = new MilitarDAO();
        System.out.println(endDAO.getIdEndereco("48488484", "Rua Jonas Barreto","",64));
        
    }
    
}
