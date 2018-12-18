/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Bairro;
import bean.DivisaoSecao;
import bean.Escolaridade;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class EscolaridadeDAO {
    private final String GETESCBYID = "SELECT Esc_id, Esc_nome FROM escolaridade WHERE Esc_id=?";
    private final String GETESCS = "SELECT * FROM escolaridade";
    
    Connection conn;
    PreparedStatement pstm;
    
    public Escolaridade getEscolaridadeByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Escolaridade esc = new Escolaridade();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESCBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               esc.setId(rs.getInt("Esc_id"));
               esc.setNome(rs.getString("Esc_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return esc;
    }
    
    public ArrayList<Escolaridade> getEscs(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Escolaridade> escs = new ArrayList<Escolaridade>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESCS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Escolaridade esc = new Escolaridade();
               esc.setId(rs.getInt("Esc_id"));
               esc.setNome(rs.getString("Esc_nome"));
               escs.add(esc);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return escs;
    }
}
