/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Dependente;
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
public class DependenteDAO {
    private final String GETDEPBYID = "SELECT * FROM Dependente WHERE dep_id=?";
    private final String GETDEPBYIDMIL = "SELECT * FROM Dependente WHERE dep_mil_id=?";
    private final String GETDEPENDENTES = "SELECT * FROM Dependente";
    
    private final String INSERT = "INSERT INTO Dependente (dep_nome, dep_data_nasc, dep_grau_parentesco, dep_mil_id) VALUES(?,?,?,?)";
    private final String UPDATE = "UPDATE Dependente "+
                                  "SET dep_nome=?, dep_data_nasc=?, dep_grau_parentesco=? WHERE dep_id=? and dep_mil_id=?";
    private final String DELETE = "DELETE FROM Dependente WHERE dep_mil_id=?";
    
    Connection conn;
    PreparedStatement pstm;
    ResultSet rs;
    
    public void inserir(Dependente dependente){
        if (dependente != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, dependente.getNome());
                pstm.setString(2, dependente.getData_nasc());
                pstm.setString(3, dependente.getGrau_parentesco());
                pstm.setInt(4, dependente.getMil_id());
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public void atualizar(Dependente dependente){
        if (dependente != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(UPDATE);
                
                pstm.setString(1, dependente.getNome());
                pstm.setString(2, dependente.getData_nasc());
                pstm.setString(3, dependente.getGrau_parentesco());
                pstm.setInt(4, dependente.getId());
                pstm.setInt(5, dependente.getMil_id());
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public void delete(int id_mil){
        if (id_mil != 0) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(DELETE);
                
                pstm.setInt(1, id_mil);
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    
    
    public Dependente getDependenteByID(int id){
        conn = null;
        pstm = null;
        rs = null;
        Dependente dependente = new Dependente();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETDEPBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               dependente.setId(rs.getInt("dep_id"));
               dependente.setNome(rs.getString("dep_nome"));
               dependente.setData_nasc(rs.getString("dep_data_nasc"));
               dependente.setGrau_parentesco(rs.getString("dep_grau_parentesco"));
               dependente.setMil_id(rs.getInt("dep_mil_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return dependente;
    }
    
    public Dependente getDependenteByIDMil(int id){
        conn = null;
        pstm = null;
        rs = null;
        Dependente dependente = new Dependente();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETDEPBYIDMIL);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               dependente.setId(rs.getInt("dep_id"));
               dependente.setNome(rs.getString("dep_nome"));
               dependente.setData_nasc(rs.getString("dep_data_nasc"));
               dependente.setGrau_parentesco(rs.getString("dep_grau_parentesco"));
               dependente.setMil_id(rs.getInt("dep_mil_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return dependente;
    }
    
    public ArrayList<Dependente> getDependentesIdMil(int id_mil){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        ArrayList<Dependente> dependentes = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETDEPBYIDMIL);
            pstm.setInt(1, id_mil);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Dependente dependente = new Dependente();
               dependente.setId(rs.getInt("dep_id"));
               dependente.setNome(rs.getString("dep_nome"));
               dependente.setData_nasc(rs.getString("dep_data_nasc"));
               dependente.setGrau_parentesco(rs.getString("dep_grau_parentesco"));
               dependente.setMil_id(rs.getInt("dep_mil_id"));
               dependentes.add(dependente);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return dependentes;
    }
}
