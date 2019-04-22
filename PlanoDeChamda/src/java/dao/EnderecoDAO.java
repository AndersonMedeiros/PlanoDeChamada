/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Endereco;
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
public class EnderecoDAO {
    private final String GETENDBYID = "SELECT * FROM Endereco WHERE end_id=?";
    private final String GETENDERECOS = "SELECT * FROM Endereco";
    private final String INSERT = "INSERT INTO Endereco(end_cep,end_logradouro,end_complemento,end_bairro_id) VALUES(?,?,?,?);";
    private final String GETID = "SELECT end_id FROM Endereco WHERE end_cep=? AND end_logradouro=? AND end_complemento=? AND end_bairro_id=?";
    private final String UPDATE = "UPDATE Endereco SET end_cep=?,end_logradouro=?,end_complemento=?,end_bairro_id=? WHERE end_id=?";
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(Endereco end){
        if(end != null){
            try{
                conn = ConnectionFactory.getConnection();

                pstm = conn.prepareStatement(INSERT);
                pstm.setString(1, end.getCep());
                pstm.setString(2, end.getLogradouro());
                pstm.setString(3, end.getComplemento());
                pstm.setInt(4, end.getId_bairro());

                pstm.execute();

                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException ex){
                throw new RuntimeException(ex.getMessage());
            }
        }else {
            throw new RuntimeException();
        }
    }
    
    public void atualizar(Endereco end){
        if(end != null){
            try{
                conn = ConnectionFactory.getConnection();

                pstm = conn.prepareStatement(UPDATE);
                pstm.setString(1, end.getCep());
                pstm.setString(2, end.getLogradouro());
                pstm.setString(3, end.getComplemento());
                pstm.setInt(4, end.getId_bairro());
                pstm.setInt(5, end.getId());

                pstm.execute();

                ConnectionFactory.fechaConexao(conn, pstm);
            }catch(SQLException ex){
                throw new RuntimeException(ex.getMessage());
            }
        }else {
            throw new RuntimeException();
        }
    }
      
    public Endereco getEnderecoById(int id){
        Endereco end = new Endereco();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETENDBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               end.setId(rs.getInt("end_id"));
               end.setCep(rs.getString("end_cep"));
               end.setLogradouro(rs.getString("end_logradouro"));
               end.setComplemento(rs.getString("end_complemento"));
               end.setId_bairro(rs.getInt("end_bairro_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return end;
    }
    
    public int getIdEndereco(String cep, String log, String comp, int id_bairro){ 
        int end_id=0;
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETID);
            pstm.setString(1, cep);
            pstm.setString(2, log);
            pstm.setString(3, comp);
            pstm.setInt(4, id_bairro);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               end_id = Integer.parseInt(String.valueOf(rs.getInt("end_id")));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException ex){
            throw new RuntimeException(ex.getMessage());
        }
        return end_id;
    }
    
    public ArrayList<Endereco> getEnderecos(){
        ArrayList<Endereco> enderecos = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETENDERECOS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Endereco end = new Endereco();
               end.setId(rs.getInt("end_id"));
               end.setCep(rs.getString("end_cep"));
               end.setLogradouro(rs.getString("end_logradouro"));
               end.setComplemento(rs.getString("end_complemento"));
               end.setId_bairro(rs.getInt("end_bairro_id"));
               enderecos.add(end);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return enderecos;
    }
    
    public ArrayList<Endereco> getEnderecosById(int id){
        ArrayList<Endereco> enderecos = new ArrayList<>();
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETENDBYID);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               Endereco end = new Endereco();
               end.setId(rs.getInt("end_id"));
               end.setCep(rs.getString("end_cep"));
               end.setLogradouro(rs.getString("end_logradouro"));
               end.setComplemento(rs.getString("end_complemento"));
               end.setId_bairro(rs.getInt("end_bairro_id"));
               enderecos.add(end);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return enderecos;
    }
    
    /*public boolean getEndExistente(String cep, String log, String complemento, String){
        boolean existe = false;
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETENDERECOS);
            
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               if()
               Endereco end = new Endereco();
               end.setId(rs.getInt("end_id"));
               end.setCep(rs.getString("end_cep"));
               end.setLogradouro(rs.getString("end_logradouro"));
               end.setComplemento(rs.getString("end_complemento"));
               end.setId(rs.getInt("end_bairro_id"));
               enderecos.add(end);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(SQLException e){
            throw new RuntimeException(e.getMessage());
        }
        return existe;
    }*/
}
