/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.PostoGraduacao;
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
public class PostoGraduacaoDAO {
    private final String GETPOSTGRADBYID = "SELECT * FROM PostoGraduacao WHERE pg_id=?";
    private final String GETPOSTGRADS = "SELECT * FROM PostoGraduacao where pg_forca='EB' ORDER BY pg_id DESC";
    
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
               pg.setSigla(rs.getString("pg_sigla"));
               pg.setForca(rs.getString("pg_forca"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return pg;
    }
    
    public ArrayList<PostoGraduacao> getPostGrads(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<PostoGraduacao> pgs = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETPOSTGRADS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               PostoGraduacao pg = new PostoGraduacao();
               pg.setId(rs.getInt("pg_id"));
               pg.setNome(rs.getString("pg_nome"));
               pg.setSigla(rs.getString("pg_sigla"));
               pg.setForca(rs.getString("pg_forca"));
               pgs.add(pg);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return pgs;
    }
}
