/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.TituloEleitor;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ander
 */
public class TituloEleitorDAO {
    private final String GETTITELEITORBYID = "SELECT * FROM TituloEleitor WHERE teleitor_id=?";
    private final String INSERT = "INSERT INTO TituloEleitor(teleitor_registro,teleitor_zona,teleitor_secao) VALUES(?,?,?);";
    private final String GETID = "SELECT teleitor_id FROM TituloEleitor WHERE teleitor_registro=? AND teleitor_zona=? AND teleitor_secao=?";
    private final String UPDATE = "UPDATE TituloEleitor SET teleitor_registro=?,teleitor_zona=?,teleitor_secao=? WHERE teleitor_id=?";
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(TituloEleitor teleitor){
        if (teleitor != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, teleitor.getRegistro());
                pstm.setString(2, teleitor.getZona());
                pstm.setString(3, teleitor.getSecao());//
                              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public void atualizar(TituloEleitor teleitor){
        if (teleitor != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(UPDATE);
                
                pstm.setString(1, teleitor.getRegistro());
                pstm.setString(2, teleitor.getZona());
                pstm.setString(3, teleitor.getSecao());
                pstm.setInt(4, teleitor.getId());
                              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    public TituloEleitor getTituloEleitor(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        TituloEleitor te = new TituloEleitor();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETTITELEITORBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               te.setRegistro(rs.getString("teleitor_registro"));
               te.setSecao(rs.getString("teleitor_secao"));
               te.setZona(rs.getString("teleitor_zona"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return te;
    }
    
    public int getIdTituloEleitor(String reg, String zona, String secao){ 
        int teleitor_id=0;
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETID);
            pstm.setString(1, reg);
            pstm.setString(2, zona);
            pstm.setString(3, secao);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               teleitor_id = Integer.parseInt(String.valueOf(rs.getInt("teleitor_id")));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return teleitor_id;
    }
}
