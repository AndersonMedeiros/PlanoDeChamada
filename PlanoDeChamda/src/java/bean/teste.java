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
    
        if(cnh_num.equals("")){ System.out.println("-Vazio");}
        if(!cnh_cat.equals("")){System.out.println("Vazio");}
        EnderecoDAO endDAO = new EnderecoDAO();
        HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
        MilitarDAO milDAO = new MilitarDAO();
        System.out.println(endDAO.getIdEndereco("69073570", "Rua Jonas Barreto", "", 29));
        System.out.println(endDAO.getEnderecoById(1).getLogradouro());
    }
    
}
