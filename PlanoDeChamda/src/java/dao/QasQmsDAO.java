/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.QasQms;
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
public class QasQmsDAO {
    //Tabela
    private final String tabela = "QasQms";
    
    //Atributos
    private final String id = "qasqms_id";
    private final String nome = "qasqms_nome";
    
    //Consultas sql
    private final String GETQasQmsByID = "SELECT * FROM " + tabela + " WHERE " + id + "=?";
    private final String GETQasQms = "SELECT * FROM " + tabela + " ORDER BY " + nome;
    private final String GETQASQMSBYID = "SELECT * FROM QAS_QMS WHERE Arma_id=?";
    private final String GETARMAS = "SELECT * FROM QAS_QMS ORDER BY Arma_desc";
    
    public void imp(){
        System.out.println(GETQasQmsByID);
    }
    
    Connection conn;
    PreparedStatement pstm;
    
    public QasQms getQasQmsByID(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        QasQms arma = new QasQms();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETQASQMSBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               arma.setId(rs.getInt(id));
               arma.setNome(rs.getString("Arma_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return arma;
    }
    
    public ArrayList<QasQms> getArmas(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<QasQms> armas = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETARMAS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               QasQms arma = new QasQms();
               arma.setId(rs.getInt("Arma_id"));
               arma.setNome(rs.getString("Arma_desc"));
               armas.add(arma);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return armas;
    }
}
