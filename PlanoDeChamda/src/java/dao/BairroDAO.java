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
