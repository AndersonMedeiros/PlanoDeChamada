/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.DivisaoSecao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class DivisaoSecaoDAO {
    private final String GETDIVSECBYID = "SELECT ds_id, ds_nome FROM divisaodecao WHERE ds_id=?";
    private final String GETDIVSECS = "SELECT * FROM divisaosecao";
    
    Connection conn;
    PreparedStatement pstm;
    
    public DivisaoSecao getDivSecByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        DivisaoSecao ds = new DivisaoSecao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETDIVSECBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               ds.setId(rs.getInt("ds_id"));
               ds.setNome(rs.getString("ds_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return ds;
    }
    
    public ArrayList<DivisaoSecao> getDivSec(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<DivisaoSecao> dss = new ArrayList<DivisaoSecao>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETDIVSECS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               DivisaoSecao ds = new DivisaoSecao();
               ds.setId(rs.getInt("ds_id"));
               ds.setNome(rs.getString("ds_nome"));
               dss.add(ds);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return dss;
    }
}
