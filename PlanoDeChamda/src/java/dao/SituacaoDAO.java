/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Escolaridade;
import bean.Situacao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ander
 */
public class SituacaoDAO {
    private final String GETSITBYID = "SELECT Sit_id, Sit_nome FROM situacao WHERE Sit_id=?";
    
    Connection conn;
    PreparedStatement pstm;
    
    public Situacao getSituacaoByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Situacao sit = new Situacao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETSITBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               sit.setId(rs.getInt("Sit_id"));
               sit.setNome(rs.getString("Sit_nome"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return sit;
    }
}
