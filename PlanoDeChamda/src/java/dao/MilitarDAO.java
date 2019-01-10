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
import java.util.ArrayList;

/**
 *
 * @author ander
 */
public class MilitarDAO {
    private final String GETIDTSENHA = "SELECT Mil_identidade, Mil_senha FROM militar WHERE Mil_identidade=? AND Mil_senha=?";
    private final String GETSENHA = "SELECT Mil_senha FROM militar WHERE Mil_senha=?";
    private final String GETCPF = "SELECT Mil_cpf FROM militar WHERE Mil_cpf=?";
    private final String GETIDENTIDADE = "SELECT Mil_identidade FROM militar WHERE Mil_identidade=?";
    private final String GETMILITAR = "SELECT * FROM militar WHERE Mil_identidade=? AND Mil_senha=?";
    
    private final String INSERT = "INSERT INTO militar(DivisaoSecao_ds_id,PostoGraduacao_pg_id,QAS_QMS_Arma_id,Situacao_id,Mil_nome,"+
            "Mil_nome_guerra,Mil_sexo,Mil_naturalidade,Mil_est_civil,Mil_dt_praca,Mil_identidade,Mil_cpf,Mil_preccp,Mil_data_nasc,"+
            "Mil_cnh_num,Mil_cnh_cat,Mil_pai,Mil_mae,Escolaridade_Esc_id,Mil_end_cep,Mil_end_estado,Mil_cid_id,Bairro_Bairro_id,"+
            "Mil_end_logradouro,Mil_end_num,Mil_end_complemento,Mil_fone1,Mil_fone2,Mil_email,Mil_contato_referencia,Mil_fone_referencia,"+
            "Mil_senha) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    private final String UPDATE = "UPDATE militar SET DivisaoSecao_ds_id=?,PostoGraduacao_pg_id=?,QAS_QMS_Arma_id=?,Situacao_id=?,"+
            "Mil_nome=?,Mil_nome_guerra=?,Mil_sexo=?,Mil_naturalidade=?,Mil_est_civil=?,Mil_dt_praca=?,Mil_cpf=?,Mil_preccp=?,"+
            "Mil_data_nasc=?,Mil_cnh_num=?,Mil_cnh_cat=?,Mil_pai=?,Mil_mae=?,Escolaridade_Esc_id=?,Mil_end_cep=?,Mil_end_estado=?,"+
            "Mil_cid_id=?,Bairro_Bairro_id=?,Mil_end_logradouro=?,Mil_end_num=?,Mil_end_complemento=?,Mil_fone1=?,Mil_fone2=?,"+
            "Mil_email=?,Mil_contato_referencia=?,Mil_fone_referencia=? WHERE Mil_identidade=? AND Mil_senha=?";
    
    Connection conn;
    PreparedStatement pstm;
    
    public void inserir(Militar mil) {
        if (mil != null) {
            conn = null;
            pstm = null;
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                //Dados Pessoais
                pstm.setInt(1, mil.getId_div_sec());
                pstm.setInt(2, mil.getId_post_grad());
                pstm.setInt(3, mil.getId_qas_qms());
                pstm.setInt(4, mil.getId_sit());
                pstm.setString(5, mil.getNome());
                pstm.setString(6, mil.getNome_guerra());
                pstm.setString(7, mil.getSexo());
                pstm.setString(8, mil.getNaturalidade());
                pstm.setString(9, mil.getEst_civil());
                pstm.setString(10, mil.getDt_praca());
                pstm.setString(11, mil.getIdentidade());
                pstm.setString(12, mil.getCpf());
                pstm.setString(13, mil.getPreccp());
                pstm.setString(14, mil.getData_nasc());
                pstm.setString(15, mil.getCnh_num());
                pstm.setString(16, mil.getCnh_cat());
                pstm.setString(17, mil.getPai());
                pstm.setString(18, mil.getMae());
                pstm.setInt(19, mil.getId_esc());
                                
                //Dados de Endereço
                pstm.setString(20, mil.getEnd_cep());
                pstm.setString(21, mil.getEnd_estado());
                pstm.setInt(22, mil.getId_cid());
                pstm.setInt(23, mil.getId_bairro());
                pstm.setString(24, mil.getEnd_logradouro());
                pstm.setString(25, mil.getEnd_numero());
                pstm.setString(26, mil.getEnd_complemento());
                
                //Dados de Contato
                pstm.setString(27, mil.getFone1());
                pstm.setString(28, mil.getFone2());
                pstm.setString(29, mil.getEmail());
                pstm.setString(30, mil.getCont_referencia());
                pstm.setString(31, mil.getFone_referencia());
                
                //Dados de Acesso
                
                pstm.setString(32, mil.getSenha());
                                
                pstm.execute();
                
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            throw new RuntimeException();
        }
    }
    
    public void atualizar(Militar mil) {
        if (mil != null) {
            conn = null;
            try {
                conn = ConnectionFactory.getConnection();
                System.out.println("passou");
                pstm = conn.prepareStatement(UPDATE);
                
               //Dados Pessoais
                pstm.setInt(1, mil.getId_div_sec());
                pstm.setInt(2, mil.getId_post_grad());
                pstm.setInt(3, mil.getId_qas_qms());
                pstm.setInt(4, mil.getId_sit());
                pstm.setString(5, mil.getNome());
                pstm.setString(6, mil.getNome_guerra());
                pstm.setString(7, mil.getSexo());
                pstm.setString(8, mil.getNaturalidade());
                pstm.setString(9, mil.getEst_civil());
                pstm.setString(10, mil.getDt_praca());
                pstm.setString(11, mil.getIdentidade());
                pstm.setString(12, mil.getCpf());
                pstm.setString(13, mil.getPreccp());
                pstm.setString(14, mil.getData_nasc());
                pstm.setString(15, mil.getCnh_num());
                pstm.setString(16, mil.getCnh_cat());
                pstm.setString(17, mil.getPai());
                pstm.setString(18, mil.getMae());
                pstm.setInt(19, mil.getId_esc());
                                
                //Dados de Endereço
                pstm.setString(20, mil.getEnd_cep());
                pstm.setString(21, mil.getEnd_estado());
                pstm.setInt(22, mil.getId_cid());
                pstm.setInt(23, mil.getId_bairro());
                pstm.setString(24, mil.getEnd_logradouro());
                pstm.setString(25, mil.getEnd_numero());
                pstm.setString(26, mil.getEnd_complemento());
                
                //Dados de Contato
                pstm.setString(27, mil.getFone1());
                pstm.setString(28, mil.getFone2());
                pstm.setString(29, mil.getEmail());
                pstm.setString(30, mil.getCont_referencia());
                pstm.setString(31, mil.getFone_referencia());
                
                //Dados de Acesso
                
                pstm.setString(32, mil.getSenha());
                                
                pstm.execute();
                System.out.println("ps tambem");
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            
            throw new RuntimeException();
        }
    }
     
    public boolean validarLoginSenha(String identidade, String senha) {
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
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
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarLogin(String identidade) {
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETIDENTIDADE);
            pstm.setString(1, identidade);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarSenha(String senha) {
        conn = null;
        pstm = null;
        ResultSet rs = null;
        
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETSENHA);
            
            pstm.setString(1, senha);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
        return false;
    }
    
    public boolean validarCPF(String cpf) {
        conn = null;
        pstm = null;
        ResultSet rs = null;
       
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETCPF);
            pstm.setString(1, cpf);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
       return false;
    }
    
    public boolean validarIDENTIDADE(String identidade) {
        conn = null;
        pstm = null;
        ResultSet rs = null;
       
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETIDENTIDADE);
            pstm.setString(1, identidade);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
            
        }
       return false;
    }
    
    public Militar getMilitar(String identidade, String senha){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        Militar mil = new Militar();
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETMILITAR);
            pstm.setString(1, identidade);
            pstm.setString(2, senha);
            rs = pstm.executeQuery();
            while (rs.next()) {
                
                //Dados Pessoais
                mil.setId_div_sec(rs.getInt("DivisaoSecao_ds_id"));
                mil.setId_post_grad(rs.getInt("PostoGraduacao_pg_id"));
                mil.setId_qas_qms(rs.getInt("QAS_QMS_Arma_id"));
                mil.setId_sit(rs.getInt("Situacao_id"));
                mil.setNome(rs.getString("Mil_nome"));
                mil.setNome_guerra(rs.getString("Mil_nome_guerra"));
                mil.setSexo(rs.getString("Mil_sexo"));
                mil.setNaturalidade(rs.getString("Mil_naturalidade"));
                mil.setEst_civil(rs.getString("Mil_est_civil"));
                mil.setDt_praca(rs.getString("Mil_dt_praca"));
                mil.setIdentidade(rs.getString("Mil_identidade"));
                mil.setCpf(rs.getString("Mil_cpf"));
                mil.setPreccp(rs.getString("Mil_preccp"));
                mil.setData_nasc(rs.getString("Mil_data_nasc")); 
                mil.setCnh_num(rs.getString("Mil_cnh_num"));
                mil.setCnh_cat(rs.getString("Mil_cnh_cat"));
                mil.setPai(rs.getString("Mil_pai"));
                mil.setMae(rs.getString("Mil_mae"));
                mil.setId_esc(rs.getInt("Escolaridade_Esc_id"));
                
                //Dados de Endereço
                mil.setEnd_cep(rs.getString("Mil_end_cep"));
                mil.setEnd_estado(rs.getString("Mil_end_estado"));
                mil.setId_cid(rs.getInt("Mil_cid_id"));
                mil.setId_bairro(rs.getInt("Bairro_Bairro_id"));
                mil.setEnd_logradouro(rs.getString("Mil_end_logradouro"));
                mil.setEnd_numero(rs.getString("Mil_end_num"));
                mil.setEnd_complemento(rs.getString("Mil_end_complemento"));
                
                //Dados de Contato
                mil.setFone1(rs.getString("Mil_fone1"));
                mil.setFone2(rs.getString("Mil_fone2"));
                mil.setEmail(rs.getString("Mil_email"));
                mil.setCont_referencia(rs.getString("Mil_contato_referencia"));
                mil.setFone_referencia(rs.getString("Mil_fone_referencia"));        
                
                //Dados de Acesso
                
                mil.setSenha(rs.getString("Mil_senha"));
                mil.setTipo_acesso(rs.getString("Mil_tipo_acesso"));

            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            e.printStackTrace();
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
                //Dados Pessoais
                mil.setId_div_sec(rs.getInt("DivisaoSe"
                        + "cao_ds_id"));
                mil.setId_post_grad(rs.getInt("PostoGraduacao_pg_id"));
                mil.setId_qas_qms(rs.getInt("QAS_QMS_Arma_id"));
                mil.setId_sit(rs.getInt("Situacao_id"));
                mil.setNome(rs.getString("Mil_nome"));
                mil.setNome_guerra(rs.getString("Mil_nome_guerra"));
                mil.setSexo(rs.getString("Mil_sexo"));
                mil.setNaturalidade(rs.getString("Mil_naturalidade"));
                mil.setEst_civil(rs.getString("Mil_est_civil"));
                mil.setDt_praca(rs.getString("Mil_dt_praca"));
                mil.setIdentidade(rs.getString("Mil_identidade"));
                mil.setCpf(rs.getString("Mil_cpf"));
                mil.setPreccp(rs.getString("Mil_preccp"));
                mil.setData_nasc("Mil_data_nasc"); 
                mil.setCnh_num(rs.getString("Mil_cnh_num"));
                mil.setCnh_cat(rs.getString("Mil_cnh_cat"));
                mil.setPai(rs.getString("Mil_pai"));
                mil.setMae(rs.getString("Mil_mae"));
                mil.setId_esc(rs.getInt("Escolaridade_Esc_id"));
                
                //Dados de Endereço
                mil.setEnd_cep(rs.getString("Mil_end_cep"));
                mil.setEnd_estado(rs.getString("Mil_end_estado"));
                mil.setId_cid(rs.getInt("Mil_cid_id"));
                mil.setId_bairro(rs.getInt("Bairro_Bairro_id"));
                mil.setEnd_logradouro(rs.getString("Mil_end_logradouro"));
                mil.setEnd_numero(rs.getString("Mil_end_num"));
                mil.setEnd_complemento(rs.getString("Mil_end_complemento"));
                
                //Dados de Contato
                mil.setFone1(rs.getString("Mil_fone1"));
                mil.setFone2(rs.getString("Mil_fone2"));
                mil.setEmail(rs.getString("Mil_email"));
                mil.setCont_referencia(rs.getString("Mil_contato_referencia"));
                mil.setFone_referencia(rs.getString("Mil_fone_referencia"));        
                
                //Dados de Acesso
                
                mil.setSenha(rs.getString("Mil_senha"));
                
                
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
                System.out.println("isso");
                if(rs.next()){
                    milRetorno = new Militar();
                    milRetorno.setId_div_sec(rs.getInt("DivisaoSecao_ds_id"));
                    milRetorno.setId_post_grad(rs.getInt("PostoGraduacao_pg_id"));
                    milRetorno.setId_qas_qms(rs.getInt("QAS_QMS_Arma_id"));
                    milRetorno.setId_sit(rs.getInt("Situacao_id"));
                    milRetorno.setNome(rs.getString("Mil_nome"));
                    milRetorno.setNome_guerra(rs.getString("Mil_nome_guerra"));
                    milRetorno.setSexo(rs.getString("Mil_sexo"));
                    milRetorno.setNaturalidade(rs.getString("Mil_naturalidade"));
                    milRetorno.setEst_civil(rs.getString("Mil_est_civil"));
                    milRetorno.setDt_praca(rs.getString("Mil_dt_praca"));
                    milRetorno.setIdentidade(rs.getString("Mil_identidade"));
                    milRetorno.setCpf(rs.getString("Mil_cpf"));
                    milRetorno.setPreccp(rs.getString("Mil_preccp"));
                    milRetorno.setData_nasc("Mil_data_nasc"); 
                    milRetorno.setCnh_num(rs.getString("Mil_cnh_num"));
                    milRetorno.setCnh_cat(rs.getString("Mil_cnh_cat"));
                    milRetorno.setPai(rs.getString("Mil_pai"));
                    milRetorno.setMae(rs.getString("Mil_mae"));
                    milRetorno.setId_esc(rs.getInt("Escolaridade_Esc_id"));

                    //Dados de Endereço
                    milRetorno.setEnd_cep(rs.getString("Mil_end_cep"));
                    milRetorno.setEnd_estado(rs.getString("Mil_end_estado"));
                    milRetorno.setId_cid(rs.getInt("Mil_cid_id"));
                    milRetorno.setId_bairro(rs.getInt("Bairro_Bairro_id"));
                    milRetorno.setEnd_logradouro(rs.getString("Mil_end_logradouro"));
                    milRetorno.setEnd_numero(rs.getString("Mil_end_num"));
                    milRetorno.setEnd_complemento(rs.getString("Mil_end_complemento"));

                    //Dados de Contato
                    milRetorno.setFone1(rs.getString("Mil_fone1"));
                    milRetorno.setFone2(rs.getString("Mil_fone2"));
                    milRetorno.setEmail(rs.getString("Mil_email"));
                    milRetorno.setCont_referencia(rs.getString("Mil_contato_referencia"));
                    milRetorno.setFone_referencia(rs.getString("Mil_fone_referencia"));        

                    //Dados de Acesso
                    milRetorno.setSenha(rs.getString("Mil_senha"));
                }
                
                ConnectionFactory.fechaConexao(conn, pstm, rs);
            }catch(Exception e){
                throw new RuntimeException("Erro: " + e.getMessage());
            }
        }
        return milRetorno;
    }
}
