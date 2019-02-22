/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Dependente;
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
    private final String GETRELBYNOME = "SELECT * FROM Religiao WHERE rel_nome=?";
    private final String GETRELIGIOES = "SELECT * FROM Religiao";
    
    private final String INSERT = "INSERT INTO Religiao (rel_nome) VALUES(?)";
    
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    
    public void inserir(String nome_rel){
        if (nome_rel != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, nome_rel);
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public Religiao getReligiaoByID(int id){
        conn = null;
        pstm = null;
        rs = null;
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
    
    public Religiao getReligiaoByNome(String nome_rel){
        conn = null;
        pstm = null;
        rs = null;
        Religiao rel = new Religiao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETRELBYNOME);
            pstm.setString(1, nome_rel);
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
        rs = null;
        
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
