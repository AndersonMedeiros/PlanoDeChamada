/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.Cidade;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author de_paula
 */
public class CidadeDAO {
    private final String GETCIDADEBYID = "SELECT * FROM Cidade WHERE cid_id=?";
    private final String GETCIDADES = "SELECT * FROM Cidade ORDER BY cid_nome";
    
    Connection conn;
    PreparedStatement pstm;
      
    public Cidade getCidadeById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Cidade c = new Cidade();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCIDADEBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               c.setId(rs.getInt("cid_id"));
               c.setNome(rs.getString("cid_nome"));
               c.setId_est(rs.getInt("cid_estado_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return c;
    }
    
    public ArrayList<Cidade> getCidades(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Cidade> cidades = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCIDADES);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Cidade c = new Cidade();
               c.setId(rs.getInt("cid_id"));
               c.setNome(rs.getString("cid_nome"));
               c.setId_est(rs.getInt("cid_estado_id"));
               cidades.add(c);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return cidades;
    }
    
    public ArrayList<Cidade> getCidadesById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Cidade> cidades = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCIDADEBYID);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Cidade c = new Cidade();
               c.setId(rs.getInt("cid_id"));
               c.setNome(rs.getString("cid_nome"));
               c.setId_est(rs.getInt("cid_estado_id"));
               cidades.add(c);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return cidades;
    }
}
