/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import dao.BairroDAO;
import dao.CidadeDAO;
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
        
        DadosCheckBox dcb = new DadosCheckBox();
        
        String[] cars = {"Volvo", "BMW", "Ford", "Mazda"};
      
        EnderecoDAO endDAO = new EnderecoDAO();
        CidadeDAO cDAO = new CidadeDAO();
        BairroDAO bDAO = new BairroDAO();
        HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
        MilitarDAO milDAO = new MilitarDAO();
        Militar mil = milDAO.getMilitar("1207153378");
        //if(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId()).getId_bairro()).getId_cid()).getId_est()==0){
        System.out.println(mil.getId());
        System.out.println(endDAO.getEnderecoById(mil.getId_end()).getId_bairro());
        System.out.println(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid());
            System.out.println(cDAO.getCidadeById(bDAO.getBairroByID(endDAO.getEnderecoById(mil.getId_end()).getId_bairro()).getId_cid()).getId_est());
        //}
        
        
    }
    
}
