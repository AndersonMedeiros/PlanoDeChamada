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

/**
 *
 * @author ander
 */
public class FoneDAO {
    private final String GETFONEBYID = "SELECT * FROM Fone WHERE fone_id=?";
    private final String INSERT = "INSERT INTO Fone(fone_num,fone_mil_identidade) VALUES(?,?);";
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(Fone fone){
        if(fone != null){
            try{
                ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                pstm.setString(1, fone.getNum());
                pstm.setString(2, fone.getIdentidade_mil());
                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException e){
                 throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    public Fone getFone(int id){
        Fone fone = new Fone();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETFONEBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               fone.setId(rs.getInt("fone_id"));
               fone.setNum(rs.getString("fone_num"));
               fone.setIdentidade_mil(rs.getString("fone_mil_identidade"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return fone;
    }
}
