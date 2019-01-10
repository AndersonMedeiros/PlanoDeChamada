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
import java.util.ArrayList;

/**
 *
 * @author de_paula
 */
public class CidadeDAO {
    private final String GETCIDADEBYID = "SELECT * FROM cidade WHERE Cid_id=?";
    private final String GETCIDADES = "SELECT * FROM cidade";
    
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
               c.setId(rs.getInt("Cid_id"));
               c.setNome(rs.getString("Cid_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return c;
    }
    
    public ArrayList<Cidade> getCidades(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Cidade> cidades = new ArrayList<Cidade>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCIDADES);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Cidade c = new Cidade();
               c.setId(rs.getInt("Cid_id"));
               c.setNome(rs.getString("Cid_nome"));
               
               cidades.add(c);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return cidades;
    }
    
    public ArrayList<Cidade> getCidadesById(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Cidade> cidades = new ArrayList<Cidade>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCIDADEBYID);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Cidade c = new Cidade();
               c.setId(rs.getInt("Cid_id"));
               c.setNome(rs.getString("Cid_nome"));
               cidades.add(c);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return cidades;
    }
}
