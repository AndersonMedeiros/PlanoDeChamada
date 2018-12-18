/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Bairro;
import bean.PostoGraduacao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class PostoGraduacaoDAO {
    private final String GETPOSTGRADBYID = "SELECT pg_id, pg_nome FROM postograduacao WHERE pg_id=?";
    private final String GETPOSTGRADS = "SELECT * FROM postograduacao";
    
    Connection conn;
    PreparedStatement pstm;
    
    public PostoGraduacao getPostGradByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        PostoGraduacao pg = new PostoGraduacao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETPOSTGRADBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               pg.setId(rs.getInt("pg_id"));
               pg.setNome(rs.getString("pg_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return pg;
    }
    
    public ArrayList<PostoGraduacao> getPostGrads(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<PostoGraduacao> pgs = new ArrayList<PostoGraduacao>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETPOSTGRADS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               PostoGraduacao pg = new PostoGraduacao();
               pg.setId(rs.getInt("pg_id"));
               pg.setNome(rs.getString("pg_nome"));
               pgs.add(pg);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return pgs;
    }
}
