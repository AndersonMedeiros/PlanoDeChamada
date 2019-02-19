/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Conjuge;
import bean.Religiao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author root
 */
public class ConjugeDAO {
    private final String GETCONBYID = "SELECT * FROM Conjuge WHERE con_id=?";
    private final String GETID = "SELECT con_id FROM Conjuge WHERE con_cpf=?";
    private final String GETCONBYNOME_CPF = "SELECT * FROM Conjuge WHERE con_nome=? AND con_cpf=?";
    private final String GETCONJUGES = "SELECT * FROM Conjuge";
    
    private final String INSERT = "INSERT INTO Conjuge (con_nome,con_email,con_fone,con_profissao,con_data_nasc,con_naturalidade,con_cpf) VALUES(?,?,?,?,?,?,?)";
    
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    
    public void inserir(Conjuge con){
        if (con != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, con.getNome());
                pstm.setString(2, con.getEmail());
                pstm.setString(3, con.getFone());
                pstm.setString(4, con.getProfissao());
                pstm.setString(5, con.getData_nasc());
                pstm.setString(6, con.getNaturalidade());
                pstm.setString(7, con.getCpf());
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public Conjuge getConjugeByID(int id){
        conn = null;
        pstm = null;
        rs = null;
        Conjuge conjuge = new Conjuge();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCONBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               conjuge.setId(rs.getInt("con_id"));
               conjuge.setNome(rs.getString("con_nome"));
               conjuge.setEmail(rs.getString("con_email"));
               conjuge.setFone(rs.getString("con_fone"));
               conjuge.setProfissao(rs.getString("con_profissao"));
               conjuge.setData_nasc(rs.getString("con_data_nasc"));
               conjuge.setNaturalidade(rs.getString("con_naturalidade"));
               conjuge.setCpf(rs.getString("con_cpf"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return conjuge;
    }
    
    public Conjuge getConjugeByNome_Cpf(String nome_con, String cpf_con){
        conn = null;
        pstm = null;
        rs = null;
        Conjuge conjuge = new Conjuge();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCONBYNOME_CPF);
            pstm.setString(1, nome_con);
            pstm.setString(2, cpf_con);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               conjuge.setId(rs.getInt("con_id"));
               conjuge.setNome(rs.getString("con_nome"));
               conjuge.setEmail(rs.getString("con_email"));
               conjuge.setFone(rs.getString("con_fone"));
               conjuge.setProfissao(rs.getString("con_profissao"));
               conjuge.setData_nasc(rs.getString("con_data_nasc"));
               conjuge.setNaturalidade(rs.getString("con_naturalidade"));
               conjuge.setCpf(rs.getString("con_cpf"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return conjuge;
    }
    
    public int getIdConjuge(String cpf){ 
        int con_id=0;
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETID);
            
            pstm.setString(1, cpf);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               con_id = Integer.parseInt(String.valueOf(rs.getInt("con_id")));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return con_id;
    }
    
    public ArrayList<Conjuge> getConjuges(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Conjuge> conjuges = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCONJUGES);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Conjuge conjuge = new Conjuge();
               conjuge.setId(rs.getInt("con_id"));
               conjuge.setNome(rs.getString("con_nome"));
               conjuge.setEmail(rs.getString("con_email"));
               conjuge.setFone(rs.getString("con_fone"));
               conjuge.setProfissao(rs.getString("con_profissao"));
               conjuge.setData_nasc(rs.getString("con_data_nasc"));
               conjuge.setNaturalidade(rs.getString("con_naturalidade"));
               conjuge.setCpf(rs.getString("con_cpf"));
               conjuges.add(conjuge);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return conjuges;
    }
}
