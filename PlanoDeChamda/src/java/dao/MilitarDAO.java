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
    private final String GETID = "SELECT mil_id FROM Militar WHERE mil_identidade=?";
    private final String GETMILITAR = "SELECT * FROM Militar WHERE mil_identidade=?";
    private final String GETMILITARES = "SELECT * FROM Militar ORDER BY mil_postograduacao_id";
    
    private final String INSERT = "INSERT INTO Militar (mil_identidade,mil_nome,mil_nome_guerra,mil_cpf,mil_preccp,"+
                                  "                     mil_sexo,mil_data_nasc,mil_data_praca,mil_pai,mil_mae,mil_email,"+
                                  "                     mil_nome_referencia,mil_fone_referencia,mil_fone1,mil_fone2,"+
                                  "                     mil_naturalidade_estado,mil_naturalidade_cidade,mil_end_num,mil_senha,"+
	                          "                     mil_end_id,mil_divisaosecao_id,mil_postograduacao_id,mil_qasqms_id,mil_estadocivil_id,"+
                                  "                     mil_escolaridade_id,mil_situacao_id,mil_tituloeleitor_id,mil_religiao_id) "+
                                  "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    
    private final String UPDATE = "UPDATE Militar "+
                                  "SET mil_nome=?,mil_nome_guerra=?,mil_cpf=?,mil_preccp=?,mil_sexo=?,mil_data_nasc=?,"+
                                  "    mil_data_praca=?,mil_pai=?,mil_mae=?,mil_email=?,mil_nome_referencia=?,mil_fone_referencia=?,mil_fone1=?,mil_fone2=?,"+
                                  "    mil_naturalidade_estado=?,mil_naturalidade_cidade=?,mil_end_num=?,mil_senha=?,mil_end_id=?,mil_divisaosecao_id=?,"+
                                  "    mil_postograduacao_id=?,mil_qasqms_id=?,mil_estadocivil_id=?,mil_escolaridade_id=?,mil_situacao_id=?,"+
                                  "    mil_tituloeleitor_id=?,mil_religiao_id=? WHERE mil_id=? AND mil_identidade=?";
    
    private final String UPDATE_NIVEL_ACESSO = "UPDATE Militar SET mil_grupoacesso_id=? WHERE mil_identidade=?;";
    
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
                pstm.setString(14, mil.getFone1());
                pstm.setString(15, mil.getFone2());
                pstm.setInt(16, mil.getId_nat_est());
                pstm.setString(17, mil.getNat_cid());
                pstm.setString(18, mil.getEnd_num());
                pstm.setString(19, mil.getSenha());
                pstm.setInt(20, mil.getId_end());
                pstm.setInt(21, mil.getId_div_sec());
                pstm.setInt(22, mil.getId_pg());
                pstm.setInt(23, mil.getId_qq());
                pstm.setInt(24, mil.getId_ec());
                pstm.setInt(25, mil.getId_esc());
                pstm.setInt(26, mil.getId_sit());
                pstm.setInt(27, mil.getId_teleitor()); 
                pstm.setInt(28, mil.getId_religiao());
                              
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
                pstm.setString(2, mil.getNome_guerra());
                pstm.setString(3, mil.getCpf());
                pstm.setString(4, mil.getPreccp());
                pstm.setString(5, mil.getSexo());
                pstm.setString(6, mil.getData_nasc());
                pstm.setString(7, mil.getData_praca());
                pstm.setString(8, mil.getPai());
                pstm.setString(9, mil.getMae());
                pstm.setString(10, mil.getEmail());
                pstm.setString(11, mil.getNome_referencia());
                pstm.setString(12, mil.getFone_referencia());
                pstm.setString(13, mil.getFone1());
                pstm.setString(14, mil.getFone2());
                pstm.setInt(15, mil.getId_nat_est());
                pstm.setString(16, mil.getNat_cid());
                pstm.setString(17, mil.getEnd_num());
                pstm.setString(18, mil.getSenha());
                pstm.setInt(19, mil.getId_end());
                pstm.setInt(20, mil.getId_div_sec());
                pstm.setInt(21, mil.getId_pg());
                pstm.setInt(22, mil.getId_qq());
                pstm.setInt(23, mil.getId_ec());
                pstm.setInt(24, mil.getId_esc());
                pstm.setInt(25, mil.getId_sit());
                pstm.setInt(26, mil.getId_teleitor());
                
                pstm.setInt(27, mil.getId_religiao());
                
                pstm.setInt(28, mil.getId());
                pstm.setString(29, mil.getIdentidade());
            
                pstm.execute();
                ConnectionFactory.fechaConexao(conn, pstm);

            } catch (SQLException e) {
                throw new RuntimeException(e.getMessage());  
            }
        } else {
            
            throw new RuntimeException();
        }
    }
    
    public void modificarNivelAcesso(int nivel_acesso, String identidade){
        if (nivel_acesso != 0 && identidade != null) {
            try {
                conn = ConnectionFactory.getConnection();
                pstm = conn.prepareStatement(UPDATE);
                
                pstm.setInt(1, nivel_acesso);
                pstm.setString(2, identidade);
                
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
    
    public int getIdMilitar(String identidade){
        int id_mil = 0;
        
        try{
            conn = ConnectionFactory.getConnection();
            
            pstm = conn.prepareStatement(GETID);
            pstm.setString(1, identidade);
            rs = pstm.executeQuery();
            while (rs.next()) {
                
                id_mil = rs.getInt("mil_id");
            }
            
            ConnectionFactory.fechaConexao(conn, pstm);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());           
        }
        return id_mil;
    }
    
    public Militar getMilitar(String identidade){
        Militar mil = new Militar();
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETMILITAR);
            pstm.setString(1, identidade);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                mil.setId(rs.getInt("mil_id"));
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
                mil.setFone1(rs.getString("mil_fone1"));
                mil.setFone2(rs.getString("mil_fone2"));
                mil.setId_nat_est(rs.getInt("mil_naturalidade_estado"));
                mil.setNat_cid(rs.getString("mil_naturalidade_cidade"));
                mil.setEnd_num(rs.getString("mil_end_num"));
                mil.setSenha(rs.getString("mil_senha"));
                mil.setId_end(rs.getInt("mil_end_id"));
                mil.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                mil.setId_pg(rs.getInt("mil_postograduacao_id"));
                mil.setId_qq(rs.getInt("mil_qasqms_id"));
                mil.setId_ec(rs.getInt("mil_estadocivil_id"));
                mil.setId_esc(rs.getInt("mil_escolaridade_id"));
                mil.setId_sit(rs.getInt("mil_situacao_id"));
                mil.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                mil.setId_grp_acesso(rs.getInt("mil_grupoacesso_id"));
                mil.setId_religiao(rs.getInt("mil_religiao_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());           
        }
        return mil;
    }
    
    public ArrayList<Militar> getMilitares(){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        ArrayList<Militar> militares = new ArrayList<>();
        
        try {
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETMILITARES);
           
            rs = pstm.executeQuery();
            while (rs.next()) {
                Militar mil = new Militar();
                mil.setId(rs.getInt("mil_id"));
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
                mil.setFone1(rs.getString("mil_fone1"));
                mil.setFone2(rs.getString("mil_fone2"));
                mil.setId_nat_est(rs.getInt("mil_naturalidade_estado"));
                mil.setNat_cid(rs.getString("mil_naturalidade_cidade"));
                mil.setEnd_num(rs.getString("mil_end_num"));
                mil.setSenha(rs.getString("mil_senha"));
                mil.setId_end(rs.getInt("mil_end_id"));
                mil.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                mil.setId_pg(rs.getInt("mil_postograduacao_id"));
                mil.setId_qq(rs.getInt("mil_qasqms_id"));
                mil.setId_ec(rs.getInt("mil_estadocivil_id"));
                mil.setId_esc(rs.getInt("mil_escolaridade_id"));
                mil.setId_sit(rs.getInt("mil_situacao_id"));
                mil.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                mil.setId_grp_acesso(rs.getInt("mil_grupoacesso_id"));
                mil.setId_religiao(rs.getInt("mil_religiao_id"));
                
                militares.add(mil);
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());           
        }
        return militares;
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
                mil.setId(rs.getInt("mil_id"));
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
                mil.setFone1(rs.getString("mil_fone1"));
                mil.setFone2(rs.getString("mil_fone2"));
                mil.setId_nat_est(rs.getInt("mil_naturalidade_estado"));
                mil.setNat_cid(rs.getString("mil_naturalidade_cidade"));
                mil.setEnd_num(rs.getString("mil_end_num"));
                mil.setSenha(rs.getString("mil_senha"));
                mil.setId_end(rs.getInt("mil_end_id"));
                mil.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                mil.setId_pg(rs.getInt("mil_postograduacao_id"));
                mil.setId_qq(rs.getInt("mil_qasqms_id"));
                mil.setId_ec(rs.getInt("mil_estadocivil_id"));
                mil.setId_esc(rs.getInt("mil_escolaridade_id"));
                mil.setId_sit(rs.getInt("mil_situacao_id"));
                mil.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                mil.setId_grp_acesso(rs.getInt("mil_grupoacesso_id"));
                mil.setId_religiao(rs.getInt("mil_religiao_id"));
                
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
                
                ResultSet rs = pstm.executeQuery();
                
                if(rs.next()){
                    milRetorno = new Militar();
                    
                    milRetorno.setId(rs.getInt("mil_id"));
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
                    milRetorno.setFone1(rs.getString("mil_fone1"));
                    milRetorno.setFone2(rs.getString("mil_fone2"));
                    milRetorno.setId_nat_est(rs.getInt("mil_naturalidade_estado"));
                    milRetorno.setNat_cid(rs.getString("mil_naturalidade_cidade"));
                    milRetorno.setEnd_num(rs.getString("mil_end_num"));
                    milRetorno.setSenha(rs.getString("mil_senha"));
                    milRetorno.setId_end(rs.getInt("mil_end_id"));
                    milRetorno.setId_div_sec(rs.getInt("mil_divisaoSecao_id"));
                    milRetorno.setId_pg(rs.getInt("mil_postograduacao_id"));
                    milRetorno.setId_qq(rs.getInt("mil_qasqms_id"));
                    milRetorno.setId_ec(rs.getInt("mil_estadocivil_id"));
                    milRetorno.setId_esc(rs.getInt("mil_escolaridade_id"));
                    milRetorno.setId_sit(rs.getInt("mil_situacao_id"));
                    milRetorno.setId_teleitor(rs.getInt("mil_tituloeleitor_id"));
                    milRetorno.setId_grp_acesso(rs.getInt("mil_grupoacesso_id"));
                    milRetorno.setId_religiao(rs.getInt("mil_religiao_id"));
                }
                
                ConnectionFactory.fechaConexao(conn, pstm, rs);
            }catch(SQLException e){
                throw new RuntimeException("Erro: " + e.getMessage());
            }
        }
        return milRetorno;
    }
}
