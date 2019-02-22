/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author root
 */
public class Dependente {
    int id, mil_id;
    String nome, data_nasc,grau_parentesco;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMil_id() {
        return mil_id;
    }

    public void setMil_id(int mil_id) {
        this.mil_id = mil_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getData_nasc() {
        return data_nasc;
    }

    public void setData_nasc(String data_nasc) {
        this.data_nasc = data_nasc;
    }

    public String getGrau_parentesco() {
        return grau_parentesco;
    }

    public void setGrau_parentesco(String grau_parentesco) {
        this.grau_parentesco = grau_parentesco;
    }
    
    
}
