/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Estado;
import bean.EstadoCivil;
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
public class EstadoCivilDAO {
    private final String GETESTCIVILBYID = "SELECT * FROM estado_civil WHERE estado_civil_id=?";
    private final String GETESTCIVIS = "SELECT * FROM estado_civil ORDER BY estado_civil_nome";
    
    Connection conn;
    PreparedStatement pstm;
      
    public EstadoCivil getEstadoCivilById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        EstadoCivil ec = new EstadoCivil();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTCIVILBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               ec.setId(rs.getInt("estado_civil_id"));
               ec.setNome(rs.getString("estado_civil_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return ec;
    }
    
    public ArrayList<EstadoCivil> getEstadosCivis(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<EstadoCivil> estcivis = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTCIVIS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               EstadoCivil ec = new EstadoCivil();
               ec.setId(rs.getInt("estado_civil_id"));
               ec.setNome(rs.getString("estado_civil_nome"));
               estcivis.add(ec);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return estcivis;
    }
    
    public ArrayList<EstadoCivil> getEstadosCivisById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<EstadoCivil> estcivis = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETESTCIVILBYID);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               EstadoCivil ec = new EstadoCivil();
               ec.setId(rs.getInt("estado_civil_id"));
               ec.setNome(rs.getString("estado_civil_nome"));
               estcivis.add(ec);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return estcivis;
    }
}
