/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Filho;
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
public class FilhoDAO {
    private final String GETFILHOBYID = "SELECT * FROM Filho WHERE fil_id=?";
    private final String GETFILHOS = "SELECT * FROM Filho";
    
    private final String INSERT = "INSERT INTO Filho (fil_nome, fil_data_nasc, fil_mil_id) VALUES(?,?,?)";
    
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    
    public void inserir(Filho filho){
        if (filho != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, filho.getNome());
                pstm.setString(2, filho.getData_nasc());
                pstm.setInt(3, filho.getMil_id());
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public Filho getFilhooByID(int id){
        conn = null;
        pstm = null;
        rs = null;
        Filho filho = new Filho();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETFILHOBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               filho.setId(rs.getInt("fil_id"));
               filho.setNome(rs.getString("fil_nome"));
               filho.setData_nasc(rs.getString("fil_data_nasc"));
               filho.setMil_id(rs.getInt("fil_mil_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return filho;
    }
    
    public ArrayList<Filho> getFilhos(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Filho> filhos = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETFILHOS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Filho filho = new Filho();
               filho.setId(rs.getInt("fil_id"));
               filho.setNome(rs.getString("fil_nome"));
               filho.setData_nasc(rs.getString("fil_data_nasc"));
               filho.setMil_id(rs.getInt("fil_mil_id"));
               filhos.add(filho);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return filhos;
    }
}
