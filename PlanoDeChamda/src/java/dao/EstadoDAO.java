/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Estado;
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
public class EstadoDAO {
    private final String GETESTADOBYID = "SELECT * FROM estados WHERE estado_id=?";
    private final String GETAM = "SELECT * FROM estados WHERE estado_id=4";
    private final String GETESTADOS = "SELECT * FROM estados ORDER BY estado_nome";
    
    Connection conn;
    PreparedStatement pstm;
      
    public Estado getEstadoById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Estado e = new Estado();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTADOBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               e.setId(rs.getInt("estado_id"));
               e.setNome(rs.getString("estado_nome"));
               e.setUf(rs.getString("estado_uf"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return e;
    }
    
    public Estado getAM(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Estado e = new Estado();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETAM);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               e.setId(rs.getInt("estado_id"));
               e.setNome(rs.getString("estado_nome"));
               e.setUf(rs.getString("estado_uf"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return e;
    }
    
    public ArrayList<Estado> getEstados(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Estado> estados = new ArrayList<Estado>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTADOS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Estado e = new Estado();
               e.setId(rs.getInt("estado_id"));
               e.setNome(rs.getString("estado_nome"));
               e.setUf(rs.getString("estado_uf"));
               estados.add(e);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return estados;
    }
    
    public ArrayList<Estado> getEstadosById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Estado> estados = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTADOBYID);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Estado e = new Estado();
               e.setId(rs.getInt("estado_id"));
               e.setNome(rs.getString("estado_nome"));
               e.setUf(rs.getString("estado_uf"));
               estados.add(e);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return estados;
    }
}
