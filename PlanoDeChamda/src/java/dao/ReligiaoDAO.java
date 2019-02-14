/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.QasQms;
import bean.Religiao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author root
 */
public class ReligiaoDAO {
    private final String GETRELBYID = "SELECT * FROM Religiao WHERE rel_id=?";
    private final String GETRELIGIOES = "SELECT * FROM Religiao";
    
    Connection conn;
    PreparedStatement pstm;
    
    public Religiao getReligiaoByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Religiao rel = new Religiao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETRELBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               rel.setId(rs.getInt("rel_id"));
               rel.setNome(rs.getString("rel_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return rel;
    }
    
    public ArrayList<Religiao> getReligioes(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Religiao> religioes = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETRELIGIOES);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Religiao rel = new Religiao();
               rel.setId(rs.getInt("rel_id"));
               rel.setNome(rs.getString("rel_nome"));
               religioes.add(rel);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return religioes;
    }
}
