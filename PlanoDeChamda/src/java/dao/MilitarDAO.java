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
    private final String GETIDTSENHA = "SELECT identidade, senha FROM militar WHERE identidade=? AND senha=?";
    private final String GETSENHA = "SELECT senha FROM militar WHERE senha=?";
    private final String GETCPF = "SELECT cpf FROM militar WHERE cpf=?";
    private final String GETIDENTIDADE = "SELECT identidade FROM militar WHERE identidade=?";
    private final String GETMILITAR = "SELECT * FROM militar WHERE identidade=? AND senha=?";
    
    private final String INSERT = "INSERT INTO militar (identidade,nome,nome_guerra,cpf,preccp,cnh_num,cnh_cat,sexo,est_civil,data_nasc,data_praca,pai,mae,fone1,fone2,email,nome_referencia," +
"					                fone_referencia,end_cep,end_logradouro,end_num,end_complemento,naturalidade,senha,titulo_num,titulo_zona,titulo_secao," +
"                                                       escolaridade_id,qasqms_id,postograduacao_id,divisaosecao_id,bairro_id,bairro_cidade_id,bairro_cidade_estado_id," +
"                                                       situacao_id)" +
"                                               VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    
    private final String UPDATE = "UPDATE militar SET nome=?,nome_guerra=?,cpf=?,preccp=?,cnh_num=?,cnh_cat=?,sexo=?,est_civil=?,data_nasc=?,data_praca=?,pai=?,mae=?,fone1=?,fone2=?,"+
                                                     "email=?,nome_referencia=?,fone_referencia=?,end_cep=?,end_logradouro=?,end_num=?,end_complemento=?,naturalidade=?,titulo_num=?,titulo_zona=?,titulo_secao=?,"+
                                                     "escolaridade_id=?,qasqms_id=?,postograduacao_id=?,divisaosecao_id=?,bairro_id=?,bairro_cidade_id=?,bairro_cidade_estado_id=?,situacao_id=? "+
                                                 "WHERE identidade=? AND senha=?";
    
    Connection conn;
    PreparedStatement pstm;
    
    public void inserir(Militar mil) {
        if (mil != null) {
            conn = null;
            pstm = null;
            try {
                conn = ConnectionFactory.getConnection();
                
                pstm = conn.prepareStatement(INSERT);
                
                pstm.setString(1, mil.getIdentidade());
                pstm.setString(2, mil.getNome());
                pstm.setString(3, mil.getNome_guerra());//
                pstm.setString(4, mil.getCpf());
                pstm.setString(5, mil.getPreccp());
                pstm.setString(6, mil.getCnh_num());
                pstm.setString(7, mil.getCnh_cat());
                pstm.setString(8, mil.getSexo());
                pstm.setString(9, mil.getEst_civil());
                pstm.setString(10, mil.getData_nasc());
                pstm.setString(11, mil.getDt_praca());
                pstm.setString(12, mil.getPai());
                pstm.setString(13, mil.getMae());
                pstm.setString(14, mil.getFone1());
                pstm.setString(15, mil.getFone2());
                pstm.setString(16, mil.getEmail());
                pstm.setString(17, mil.getCont_referencia());
                pstm.setString(18, mil.getFone_referencia());
                pstm.setString(19, mil.getEnd_cep());
                pstm.setString(20, mil.getEnd_logradouro());
                pstm.setString(21, mil.getEnd_numero());
                pstm.setString(22, mil.getEnd_complemento());
                pstm.setString(23, mil.getNaturalidade());
                pstm.setString(24, mil.getSenha());
                pstm.setString(25, mil.getTitulo_num());
                pstm.setString(26, mil.getTitulo_zona());
                pstm.setString(27, mil.getTitulo_secao());
                pstm.setInt(28, mil.getId_esc());
                pstm.setInt(29, mil.getId_qas_qms());
                pstm.setInt(30, mil.getId_post_grad());
                pstm.setInt(31, mil.getId_div_sec());
                pstm.setInt(32, mil.getId_bairro());
                pstm.setInt(33, mil.getId_cid());
                pstm.setInt(34, mil.getId_est());
                pstm.setInt(35, mil.getId_sit());
              
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
                pstm = conn.prepareStatement(UPDATE);
                
                pstm.setString(1, mil.getNome());
                pstm.setString(2, mil.getNome_guerra());//
                pstm.setString(3, mil.getCpf());
                pstm.setString(4, mil.getPreccp());
                pstm.setString(5, mil.getCnh_num());
                pstm.setString(6, mil.getCnh_cat());
                pstm.setString(7, mil.getSexo());
                pstm.setString(8, mil.getEst_civil());
                pstm.setString(9, mil.getData_nasc());
                pstm.setString(10, mil.getDt_praca());
                pstm.setString(11, mil.getPai());
                pstm.setString(12, mil.getMae());
                pstm.setString(13, mil.getFone1());
                pstm.setString(14, mil.getFone2());
                pstm.setString(15, mil.getEmail());
                pstm.setString(16, mil.getCont_referencia());
                pstm.setString(17, mil.getFone_referencia());
                pstm.setString(18, mil.getEnd_cep());
                pstm.setString(19, mil.getEnd_logradouro());
                pstm.setString(20, mil.getEnd_numero());
                pstm.setString(21, mil.getEnd_complemento());
                pstm.setString(22, mil.getNaturalidade());
                pstm.setString(23, mil.getTitulo_num());
                pstm.setString(24, mil.getTitulo_zona());
                pstm.setString(25, mil.getTitulo_secao());
                pstm.setInt(26, mil.getId_esc());
                pstm.setInt(27, mil.getId_qas_qms());
                pstm.setInt(28, mil.getId_post_grad());
                pstm.setInt(29, mil.getId_div_sec());
                pstm.setInt(30, mil.getId_bairro());
                pstm.setInt(31, mil.getId_cid());
                pstm.setInt(32, mil.getId_est());
                pstm.setInt(33, mil.getId_sit());
                pstm.setString(34, mil.getIdentidade());
                pstm.setString(35, mil.getSenha());
                                
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
                mil.setId_div_sec(rs.getInt("divisaoSecao_id"));
                mil.setId_post_grad(rs.getInt("postograduacao_id"));
                mil.setId_qas_qms(rs.getInt("qasqms_id"));
                mil.setId_sit(rs.getInt("situacao_id"));
                mil.setNome(rs.getString("nome"));
                mil.setNome_guerra(rs.getString("nome_guerra"));
                mil.setSexo(rs.getString("sexo"));
                mil.setNaturalidade(rs.getString("naturalidade"));
                mil.setEst_civil(rs.getString("est_civil"));
                mil.setDt_praca(rs.getString("data_praca"));
                mil.setIdentidade(rs.getString("identidade"));
                mil.setCpf(rs.getString("cpf"));
                mil.setPreccp(rs.getString("preccp"));
                mil.setData_nasc(rs.getString("data_nasc")); 
                mil.setCnh_num(rs.getString("cnh_num"));
                mil.setCnh_cat(rs.getString("cnh_cat"));
                mil.setPai(rs.getString("pai"));
                mil.setMae(rs.getString("mae"));
                mil.setId_esc(rs.getInt("escolaridade_id"));
                mil.setTitulo_num(rs.getString("titulo_num"));
                mil.setTitulo_zona(rs.getString("titulo_zona"));
                mil.setTitulo_secao(rs.getString("titulo_secao"));
                System.out.println(mil.getTitulo_num() + " " + mil.getTitulo_zona() + " " + mil.getTitulo_secao());
                
                //Dados de Endereço
                mil.setEnd_cep(rs.getString("end_cep"));
                mil.setEnd_logradouro(rs.getString("end_logradouro"));
                mil.setEnd_numero(rs.getString("end_num"));
                mil.setEnd_complemento(rs.getString("end_complemento"));
                mil.setId_est(rs.getInt("bairro_cidade_estado_id"));
                mil.setId_cid(rs.getInt("bairro_cidade_id"));
                mil.setId_bairro(rs.getInt("bairro_id"));
                
                //Dados de Contato
                mil.setFone1(rs.getString("fone1"));
                mil.setFone2(rs.getString("fone2"));
                mil.setEmail(rs.getString("email"));
                mil.setCont_referencia(rs.getString("nome_referencia"));
                mil.setFone_referencia(rs.getString("fone_referencia"));        
                
                //Dados de Acesso
                
                mil.setSenha(rs.getString("senha"));
                mil.setTipo_acesso(rs.getString("tipo_acesso"));

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
                //Dados Pessoais
                mil.setId_div_sec(rs.getInt("divisaoSecao_id"));
                mil.setId_post_grad(rs.getInt("postograduacao_id"));
                mil.setId_qas_qms(rs.getInt("qasqms_id"));
                mil.setId_sit(rs.getInt("situacao_id"));
                mil.setNome(rs.getString("nome"));
                mil.setNome_guerra(rs.getString("nome_guerra"));
                mil.setSexo(rs.getString("sexo"));
                mil.setNaturalidade(rs.getString("naturalidade"));
                mil.setEst_civil(rs.getString("est_civil"));
                mil.setDt_praca(rs.getString("data_praca"));
                mil.setIdentidade(rs.getString("identidade"));
                mil.setCpf(rs.getString("cpf"));
                mil.setPreccp(rs.getString("preccp"));
                mil.setData_nasc(rs.getString("data_nasc")); 
                mil.setCnh_num(rs.getString("cnh_num"));
                mil.setCnh_cat(rs.getString("cnh_cat"));
                mil.setPai(rs.getString("pai"));
                mil.setMae(rs.getString("mae"));
                mil.setId_esc(rs.getInt("escolaridade_id"));
                mil.setTitulo_num(rs.getString("titulo_num"));
                mil.setTitulo_zona(rs.getString("titulo_zona"));
                mil.setTitulo_secao(rs.getString("titulo_secao"));
                System.out.println(mil.getTitulo_num() + " " + mil.getTitulo_zona() + " " + mil.getTitulo_secao());
                
                //Dados de Endereço
                mil.setEnd_cep(rs.getString("end_cep"));
                mil.setEnd_logradouro(rs.getString("end_logradouro"));
                mil.setEnd_numero(rs.getString("end_num"));
                mil.setEnd_complemento(rs.getString("end_complemento"));
                mil.setId_est(rs.getInt("bairro_cidade_estado_id"));
                mil.setId_cid(rs.getInt("bairro_cidade_id"));
                mil.setId_bairro(rs.getInt("bairro_id"));
                
                //Dados de Contato
                mil.setFone1(rs.getString("fone1"));
                mil.setFone2(rs.getString("fone2"));
                mil.setEmail(rs.getString("email"));
                mil.setCont_referencia(rs.getString("nome_referencia"));
                mil.setFone_referencia(rs.getString("fone_referencia"));        
                
                //Dados de Acesso
                
                mil.setSenha(rs.getString("senha"));
                mil.setTipo_acesso(rs.getString("tipo_acesso"));
                
                
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
                    
                    milRetorno.setId_div_sec(rs.getInt("divisaosecao_id"));
                    milRetorno.setId_post_grad(rs.getInt("postograduacao_id"));
                    milRetorno.setId_qas_qms(rs.getInt("qasqms_id"));
                    milRetorno.setId_sit(rs.getInt("situacao_id"));
                    milRetorno.setNome(rs.getString("nome"));
                    milRetorno.setNome_guerra(rs.getString("nome_guerra"));
                    milRetorno.setSexo(rs.getString("sexo"));
                    milRetorno.setNaturalidade(rs.getString("naturalidade"));
                    milRetorno.setEst_civil(rs.getString("est_civil"));
                    milRetorno.setDt_praca(rs.getString("data_praca"));
                    milRetorno.setIdentidade(rs.getString("identidade"));
                    milRetorno.setCpf(rs.getString("cpf"));
                    milRetorno.setPreccp(rs.getString("preccp"));
                    milRetorno.setData_nasc("data_nasc"); 
                    milRetorno.setCnh_num(rs.getString("cnh_num"));
                    milRetorno.setCnh_cat(rs.getString("cnh_cat"));
                    milRetorno.setPai(rs.getString("pai"));
                    milRetorno.setMae(rs.getString("mae"));
                    milRetorno.setId_esc(rs.getInt("escolaridade_id"));
                    milRetorno.setTitulo_num(rs.getString("titulo_num"));
                    milRetorno.setTitulo_zona(rs.getString("titulo_zona"));
                    milRetorno.setTitulo_secao(rs.getString("titulo_secao"));

                    //Dados de Endereço
                    milRetorno.setEnd_cep(rs.getString("end_cep"));
                    milRetorno.setEnd_logradouro(rs.getString("end_logradouro"));
                    milRetorno.setEnd_numero(rs.getString("end_num"));
                    milRetorno.setEnd_complemento(rs.getString("end_complemento"));
                    milRetorno.setId_est(rs.getInt("bairro_cidade_estado_id"));
                    milRetorno.setId_cid(rs.getInt("bairro_cidade_id"));
                    milRetorno.setId_bairro(rs.getInt("bairro_id"));

                    //Dados de Contato
                    milRetorno.setFone1(rs.getString("fone1"));
                    milRetorno.setFone2(rs.getString("fone2"));
                    milRetorno.setEmail(rs.getString("email"));
                    milRetorno.setCont_referencia(rs.getString("nome_referencia"));
                    milRetorno.setFone_referencia(rs.getString("fone_referencia"));        

                    //Dados de Acesso
                    milRetorno.setSenha(rs.getString("senha"));
                }
                
                ConnectionFactory.fechaConexao(conn, pstm, rs);
            }catch(Exception e){
                throw new RuntimeException("Erro: " + e.getMessage());
            }
        }
        return milRetorno;
    }
}
