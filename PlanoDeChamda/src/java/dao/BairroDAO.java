/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Bairro;
import connection.ConnectionFactory;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class BairroDAO {
    private final String GETBAIRROBYID = "SELECT * FROM bairro WHERE Bairro_id=?";
    private final String GETBAIRROS = "SELECT * FROM bairro";
    private final String GETBAIRROSBYIDCID = "SELECT * FROM bairro WHERE Bairro_cid_id=?";
    Connection conn;
    PreparedStatement pstm;
    
    public Bairro getBairroByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Bairro b = new Bairro();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETBAIRROBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               b.setId(rs.getInt("Bairro_id"));
               b.setNome(rs.getString("Bairro_nome"));
               b.setZona(rs.getString("Bairro_zona"));
               b.setZona(rs.getString("Bairro_cid_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return b;
    }
    
    public Bairro getBairroByIdC(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Bairro b = new Bairro();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETBAIRROBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               b.setId(rs.getInt("Bairro_id"));
               b.setNome(rs.getString("Bairro_nome"));
               b.setZona(rs.getString("Bairro_zona"));
               b.setZona(rs.getString("Bairro_cid_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return b;
    }
    
    public ArrayList<Bairro> getBairros(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Bairro> bairros = new ArrayList<Bairro>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETBAIRROS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Bairro b = new Bairro();
               b.setId(rs.getInt("Bairro_id"));
               b.setNome(rs.getString("Bairro_nome"));
               b.setZona(rs.getString("Bairro_zona"));
               b.setId_cid(rs.getInt("Bairro_cid_id"));
               bairros.add(b);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return bairros;
    }
    
    public ArrayList<Bairro> getBairrosByCidade(int id_cid){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Bairro> bairros = new ArrayList<Bairro>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETBAIRROSBYIDCID);
            pstm.setInt(1, id_cid);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Bairro b = new Bairro();
               b.setId(rs.getInt("Bairro_id"));
               b.setNome(rs.getString("Bairro_nome"));
               b.setZona(rs.getString("Bairro_zona"));
               b.setId_cid(rs.getInt("Bairro_cid_id"));
               bairros.add(b);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return bairros;
    }

    
}
