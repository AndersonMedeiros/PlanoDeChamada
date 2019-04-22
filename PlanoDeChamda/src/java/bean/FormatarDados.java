/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author ander
 */
public class FormatarDados {
    
    public String formatDATA(String data){
        return data.substring(0, 2) + "/" + data.substring(2, 4) + "/" + data.substring(4, 8);
    }
    
    public String formatCPF(String cpf){
        return cpf.substring(0, 3) + "." + cpf.substring(3, 6) + 
               "." + cpf.substring(6, 9) + "-" + cpf.substring(9, 11);
    }
    
    public String formatCEP(String cep){
        return cep.substring(0, 5) + "-" + cep.substring(5, 8); 
    }
    
    public String formatFONE(String fone){
        if(fone.equals(""))
            return "-";
        
        return "("+fone.substring(0, 2) + ") " + fone.substring(2, 7) + "-" + fone.substring(7, 11); 
    }
    
    
}
