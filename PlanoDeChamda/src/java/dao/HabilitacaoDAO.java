/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Habilitacao;
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
public class HabilitacaoDAO {
    private final String GETCNHBYID = "SELECT * FROM Habilitacao WHERE cnh_id=?";
    private final String INSERT = "INSERT INTO Habilitacao(cnh_num,cnh_cat,cnh_data_validade,cnh_mil_id) VALUES(?,?,?,?);";
    private final String UPDATE = "UPDATE Habilitacao SET cnh_num=?,cnh_cat=?,cnh_data_validade=?,cnh_mil_id=? WHERE cnh_id=?";
    private final String GETID = "SELECT cnh_id FROM Habilitacao WHERE cnh_num=? AND cnh_cat=?";
    private final String GETCNHS = "SELECT * FROM Habilitacao";
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(Habilitacao cnh){
        if(cnh != null){
            try{
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                pstm.setString(1, cnh.getNum());
                pstm.setString(2, cnh.getCat());
                pstm.setString(3, cnh.getData_validade());
                pstm.setInt(4, cnh.getMil_id());
                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    public void atualizar(Habilitacao cnh){
        if(cnh != null){
            try{
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(UPDATE);
                pstm.setString(1, cnh.getNum());
                pstm.setString(2, cnh.getCat());
                pstm.setString(3, cnh.getData_validade());
                pstm.setInt(4, cnh.getMil_id());
                pstm.setInt(5, cnh.getId());
                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    
    public Habilitacao getCNH(int id){
        Habilitacao cnh = new Habilitacao();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCNHBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               cnh.setId(rs.getInt("cnh_id"));
               cnh.setNum(rs.getString("cnh_num"));
               cnh.setCat(rs.getString("cnh_cat"));
               cnh.setData_validade(rs.getString("cnh_data_validade"));
               cnh.setMil_id(rs.getInt("cnh_mil_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return cnh;
    }
    
    public int getIdCnh(String num, String cat){ 
        int cnh_id=0;
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETID);
            pstm.setString(1, num);
            pstm.setString(2, cat);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               cnh_id = Integer.parseInt(String.valueOf(rs.getInt("cnh_id")));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return cnh_id;
    }
    
    public ArrayList<Habilitacao> getCNHS(){
        ArrayList<Habilitacao> cnhs = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCNHS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Habilitacao cnh = new Habilitacao();
               cnh.setId(rs.getInt("cnh_id"));
               cnh.setNum(rs.getString("cnh_num"));
               cnh.setCat(rs.getString("cnh_cat"));
               cnh.setData_validade(rs.getString("cnh_data_validade"));
               cnh.setMil_id(rs.getInt("cnh_mil_id"));
               cnhs.add(cnh);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return cnhs;
    }
}
