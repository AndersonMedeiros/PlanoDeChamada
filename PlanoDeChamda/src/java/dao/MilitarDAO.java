/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Militar;
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
public class MilitarDAO {
    private final String GETIDTSENHA = "SELECT mil_identidade, mil_senha FROM Militar WHERE mil_identidade=? AND mil_senha=?";
    private final String GETSENHA = "SELECT mil_senha FROM Militar WHERE mil_senha=?";
    private final String GETCPF = "SELECT mil_cpf FROM Militar WHERE mil_cpf=?";
    private final String GETIDENTIDADE = "SELECT mil_identidade FROM Militar WHERE mil_identidade=?";
    private final String GETMILITAR = "SELECT * FROM Militar WHERE mil_identidade=? AND mil_senha=?";
    
    private final String INSERT = "INSERT INTO Militar (mil_identidade,mil_nome,mil_nome_guerra,mil_cpf,mil_preccp,"+
                                  "                     mil_sexo,mil_data_nasc,mil_data_praca,mil_pai,mil_mae,mil_email,"+
                                  "                     mil_nome_referencia,mil_fone_referencia,mil_naturalidade,mil_end_num,mil_senha,"+
	                          "                     mil_end_id,mil_divisaosecao_id,mil_postograduacao_id,mil_qasqms_id,mil_estadocivil_id,"+
                                  "                     mil_escolaridade_id,mil_situacao_id,mil_cnh_id,mil_tituloeleitor_id) "+
                                  "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    
    private final String UPDATE = "UPDATE Militar "+
                                  "SET mil_nome=?,mil_nome_guerra=?,mil_cpf=?,mil_preccp=?,mil_sexo=?,mil_data_nasc=?,"+
                                  "    mil_data_praca=?,mil_pai=?,mil_mae=?,email=?,mil_nome_referencia=?,mil_fone_referencia=?,"+
                                  "    mil_naturalidade=?,mil_end_num=?,mil_senha=?,mil_end_id,mil_divisaosecao_id=?,"+
                                  "    mil_postograduacao_id=?,mil_qasqms_id=?,mil_estadocivil_id,mil_escolaridade_id=?,mil_situacao_id=?,"+
                                  "    mil_cnh_id=?,mil_tituloeleitor=? WHERE mil_identidade=?";
    
    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rs = null;
    
    public void inserir(Militar mil) {
        if (mil != null) {
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, mil.getIdentidade());
                pstm.setString(2, mil.getNome());
                pstm.setString(3, mil.getNome_guerra());//
                pstm.setString(4, mil.getCpf());
                pstm.setString(5, mil.getPreccp());
                pstm.setString(6, mil.getSexo());
                pstm.setString(7, mil.getData_nasc());
                pstm.setString(8, mil.getData_praca());
                pstm.setString(9, mil.getPai());
                pstm.setString(10, mil.getMae());
                pstm.setString(11, mil.getEmail());
                pstm.setString(12, mil.getNome_referencia());
                pstm.setString(13, mil.getFone_referencia());
                pstm.setString(14, mil.getNaturalidade());
                pstm.setString(15, mil.getEnd_num());
                pstm.setString(16, mil.getSenha());
                pstm.setInt(17, mil.getId_end());
                pstm.setInt(18, mil.getId_div_sec());
                pstm.setInt(19, mil.getId_pg());
                pstm.setInt(20, mil.getId_qq());
                pstm.setInt(21, mil.getId_ec());
                pstm.setInt(22, mil.getId_esc());
                pstm.setInt(23, mil.getId_sit());
                pstm.setInt(24, mil.getId_cnh());
                pstm.setInt(25, mil.getId_teleitor());
              
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public void atualizar(Militar mil) {
        if (mil != null) {
            try {
                conn = ConnectionFactory.getConnection();
                pstm = conn.prepareStatement(UPDATE);
                
                pstm.setString(1, mil.getNome());
                pstm.setString(2, mil.getNome_guerra());//
                pstm.setString(3, mil.getCpf());
                pstm.setString(4, mil.getPreccp());
                pstm.setString(5, mil.getCpf());
                pstm.setString(6, mil.getPreccp());
                pstm.setString(7, mil.getSexo());
                pstm.setString(8, mil.getData_nasc());
                pstm.setString(9, mil.getData_praca());
                pstm.setString(10, mil.getPai());
                pstm.setString(11, mil.getMae());
                pstm.setString(12, mil.getEmail());
                pstm.setString(13, mil.getNome_referencia());
                pstm.setString(14, mil.getFone_referencia());
                pstm.setString(15, mil.getNaturalidade());
                pstm.setString(16, mil.getEnd_num());
                pstm.setString(17, mil.getSenha());
                pstm.setInt(18, mil.getId_end());
                pstm.setInt(19, mil.getId_div_sec());
                pstm.setInt(20, mil.getId_pg());
                pstm.setInt(21, mil.getId_qq());
                pstm.setInt(22, mil.getId_ec());
                pstm.setInt(23, mil.getId_esc());
                pstm.setInt(24, mil.getId_sit());
                pstm.setInt(25, mil.getId_cnh());
                pstm.setInt(26, mil.getId_teleitor());
                
                pstm.setString(27, mil.getIdentidade());
            
                pstm.execute();
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            
            throw new RuntimeException();
        }
    }
     
    public boolean validarLoginSenha(String identidade, String senha) {
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETIDTSENHA);
            pstm.setString(1, identidade);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarLogin(String identidade) {       
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETIDENTIDADE);
            pstm.setString(1, identidade);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarSenha(String senha) {
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETSENHA);
            
            pstm.setString(1, senha);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarCPF(String cpf) {
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCPF);
            pstm.setString(1, cpf);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
            
        }
       return false;
    }
    
    public boolean validarIDENTIDADE(String identidade) {
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETIDENTIDADE);
            pstm.setString(1, identidade);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
            
        }
       return false;
    }
    
    public Militar getMilitar(String identidade, String senha){
        Militar mil = new Militar();
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETMILITAR);
            pstm.setString(1, identidade);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();
            while (rs.next()) {
                mil.setId_end(rs.getInt("mil_end_id"));
                mil.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                mil.setId_pg(rs.getInt("mil_postograduacao_id"));
                mil.setId_qq(rs.getInt("mil_qasqms_id"));
                mil.setId_ec(rs.getInt("mil_estadocivil_id"));
                mil.setId_esc(rs.getInt("mil_escolaridade_id"));
                mil.setId_sit(rs.getInt("mil_situacao_id"));
                mil.setId_cnh(rs.getInt("mil_cnh_id"));
                mil.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                
                mil.setIdentidade(rs.getString("mil_identidade"));
                mil.setNome(rs.getString("mil_nome"));
                mil.setNome_guerra(rs.getString("mil_nome_guerra"));
                mil.setCpf(rs.getString("mil_cpf"));
                mil.setPreccp(rs.getString("mil_preccp"));
                mil.setSexo(rs.getString("mil_sexo"));
                mil.setData_nasc(rs.getString("mil_data_nasc")); 
                mil.setData_praca(rs.getString("mil_data_praca"));
                mil.setPai(rs.getString("mil_pai"));
                mil.setMae(rs.getString("mil_mae"));
                mil.setEmail(rs.getString("mil_email"));
                mil.setNome_referencia(rs.getString("mil_nome_referencia"));
                mil.setFone_referencia(rs.getString("mil_fone_referencia"));       
                mil.setNaturalidade(rs.getString("mil_naturalidade"));
                mil.setTipo_acesso(rs.getString("mil_tipo_acesso"));
                mil.setEnd_num(rs.getString("mil_end_num"));
                mil.setSenha(rs.getString("mil_senha"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());           
        }
        return mil;
    }
    
    public ArrayList<Militar> getMilitarByDivSec_PostGrad_QasQms(String sql){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        ArrayList<Militar> militares = new ArrayList<>();
        
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(sql);
           
            rs = pstm.executeQuery();
            while (rs.next()) {
                Militar mil = new Militar();
                mil.setId_end(rs.getInt("mil_end_id"));
                mil.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                mil.setId_pg(rs.getInt("mil_postograduacao_id"));
                mil.setId_qq(rs.getInt("mil_qasqms_id"));
                mil.setId_ec(rs.getInt("mil_estadocivil_id"));
                mil.setId_esc(rs.getInt("mil_escolaridade_id"));
                mil.setId_sit(rs.getInt("mil_situacao_id"));
                mil.setId_cnh(rs.getInt("mil_cnh_id"));
                mil.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                
                mil.setIdentidade(rs.getString("mil_identidade"));
                mil.setNome(rs.getString("mil_nome"));
                mil.setNome_guerra(rs.getString("mil_nome_guerra"));
                mil.setCpf(rs.getString("mil_cpf"));
                mil.setPreccp(rs.getString("mil_preccp"));
                mil.setSexo(rs.getString("mil_sexo"));
                mil.setData_nasc(rs.getString("mil_data_nasc")); 
                mil.setData_praca(rs.getString("mil_data_praca"));
                mil.setPai(rs.getString("mil_pai"));
                mil.setMae(rs.getString("mil_mae"));
                mil.setEmail(rs.getString("mil_email"));
                mil.setNome_referencia(rs.getString("mil_nome_referencia"));
                mil.setFone_referencia(rs.getString("mil_fone_referencia"));       
                mil.setNaturalidade(rs.getString("mil_naturalidade"));
                mil.setTipo_acesso(rs.getString("mil_tipo_acesso"));
                mil.setEnd_num(rs.getString("mil_end_num"));
                mil.setSenha(rs.getString("mil_senha"));
                
                militares.add(mil);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());           
        }
        return militares;
    }
    
    public Militar autenticacao(Militar mil){
        Militar milRetorno = null;
        if(mil != null){
            conn = null;
            try{
                conn = ConnectionFactory.getConnection();
                pstm = conn.prepareStatement(GETMILITAR);
                pstm.setString(1, mil.getIdentidade());
                pstm.setString(2, mil.getSenha());
                ResultSet rs = pstm.executeQuery();
                
                if(rs.next()){
                    milRetorno = new Militar();
                    
                    milRetorno.setId_end(rs.getInt("mil_end_id"));
                    milRetorno.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                    milRetorno.setId_pg(rs.getInt("mil_postograduacao_id"));
                    milRetorno.setId_qq(rs.getInt("mil_qasqms_id"));
                    milRetorno.setId_ec(rs.getInt("mil_estadocivil_id"));
                    milRetorno.setId_esc(rs.getInt("mil_escolaridade_id"));
                    milRetorno.setId_sit(rs.getInt("mil_situacao_id"));
                    milRetorno.setId_cnh(rs.getInt("mil_cnh_id"));
                    milRetorno.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));

                    milRetorno.setIdentidade(rs.getString("mil_identidade"));
                    milRetorno.setNome(rs.getString("mil_nome"));
                    milRetorno.setNome_guerra(rs.getString("mil_nome_guerra"));
                    milRetorno.setCpf(rs.getString("mil_cpf"));
                    milRetorno.setPreccp(rs.getString("mil_preccp"));
                    milRetorno.setSexo(rs.getString("mil_sexo"));
                    milRetorno.setData_nasc(rs.getString("mil_data_nasc")); 
                    milRetorno.setData_praca(rs.getString("mil_data_praca"));
                    milRetorno.setPai(rs.getString("mil_pai"));
                    milRetorno.setMae(rs.getString("mil_mae"));
                    milRetorno.setEmail(rs.getString("mil_email"));
                    milRetorno.setNome_referencia(rs.getString("mil_nome_referencia"));
                    milRetorno.setFone_referencia(rs.getString("mil_fone_referencia"));       
                    milRetorno.setNaturalidade(rs.getString("mil_naturalidade"));
                    milRetorno.setTipo_acesso(rs.getString("mil_tipo_acesso"));
                    milRetorno.setEnd_num(rs.getString("mil_end_num"));
                    milRetorno.setSenha(rs.getString("mil_senha"));
                }
                
                ConnectionFactory.fechaConexao(conn, pstm, rs);
            }catch(SQLException e){
                throw new RuntimeException("Erro: " + e.getMessage());
            }
        }
        return milRetorno;
    }
}
