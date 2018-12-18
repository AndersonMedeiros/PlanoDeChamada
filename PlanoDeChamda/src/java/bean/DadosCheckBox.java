/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class DadosCheckBox {

    public ArrayList<String> getNaturalidades(){
        ArrayList<String> naturalidades = new ArrayList<>();
        naturalidades.add("Amazonense");
        naturalidades.add("Rondoniense");
        naturalidades.add("Roraimense");
        naturalidades.add("Amapaense");
        naturalidades.add("Paraense");
        naturalidades.add("Tocantinense");
        naturalidades.add("Sul-Mato-Grossense");
        naturalidades.add("Goiano(a)");
        naturalidades.add("Maranhense");
        naturalidades.add("Cearense");
        naturalidades.add("Potiguar ou Rio-Grandense-do-Norte");
        naturalidades.add("Piauiense");
        naturalidades.add("Paraibano(a)");
        naturalidades.add("Alagoano(a)");
        naturalidades.add("Sergipano(a)");
        naturalidades.add("Baiano(a)");
        naturalidades.add("Mineiro(a)");
        naturalidades.add("Capixaba ou Espírito-Santinense");
        naturalidades.add("Carioca");
        naturalidades.add("Paulista");
        naturalidades.add("Paranaense");
        naturalidades.add("Catarinense");
        naturalidades.add("Gaúcho ou Rio-Grandense-do-Sul");
        
        return naturalidades;
    }
    
    public ArrayList<String> getEstadosCivis(){
        ArrayList<String> est_civis = new ArrayList<>();
        est_civis.add("Solteiro(a)");
        est_civis.add("Casado(a)");
        est_civis.add("Divorciado(a)");
        est_civis.add("Viúvo(a)");
        est_civis.add("Separado(a)");
        
        return est_civis;
    }
    
    public ArrayList<String> getCnhCat(){
        ArrayList<String> cnh_cats = new ArrayList<>();
        cnh_cats.add("A");
        cnh_cats.add("B");
        cnh_cats.add("AB");
        cnh_cats.add("C");
        cnh_cats.add("D");
        cnh_cats.add("E");

        return cnh_cats;
    }
    
    public ArrayList<String> getCidades(){
        ArrayList<String> cidades = new ArrayList<>();
        
        cidades.add("Manaus");
        cidades.add("Iranduba");
        cidades.add("Rio Preto da Eva");
            
        return cidades;
    }
    
    public ArrayList<String> getEstados(){
        ArrayList<String> estados = new ArrayList<>();
        
        estados.add("Amazonas");
            
        return estados;
    }
    
    
    
    
}
