/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Fone;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class FoneDAO {
    private final String GETFONEBYID = "SELECT * FROM Fone WHERE fone_mil_id=?";
    private final String GETFONES = "SELECT * FROM Fone";
    private final String INSERT = "INSERT INTO Fone(fone_num,fone_mil_id) VALUES(?,?);";
    private final String UPDATE = "UPDATE Fone SET fone_num=? WHERE fone_id=? AND fone_mil_id=?";
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(Fone fone){
        if(fone != null){
            try{
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                pstm.setString(1, fone.getNum());
                pstm.setInt(2, fone.getId_mil());
                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException e){
                 throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    public void atualizar(Fone fone){
        if(fone != null){
            try{
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(UPDATE);
                pstm.setString(1, fone.getNum());
                pstm.setInt(2, fone.getId());
                pstm.setInt(3, fone.getId_mil());
                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException e){
                 throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    public ArrayList<Fone> getFone(int id){
        ArrayList<Fone> fones = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETFONEBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Fone fone = new Fone();
               fone.setId(rs.getInt("fone_id"));
               fone.setNum(rs.getString("fone_num"));
               fone.setId_mil(rs.getInt("fone_mil_id"));
               fones.add(fone);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return fones;
    }
    
    public ArrayList<Fone> getFones(){
        ArrayList<Fone> fones = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETFONES);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Fone fone = new Fone();
               fone.setId(rs.getInt("fone_id"));
               fone.setNum(rs.getString("fone_num"));
               fone.setId_mil(rs.getInt("fone_mil_id"));
               fones.add(fone);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return fones;
    }
    
  
}
