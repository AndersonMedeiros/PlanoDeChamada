/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Bairro;
import bean.QasQms;
import bean.TituloEleitor;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ander
 */
public class TituloEleitorDAO {
    private final String GETTITELEITORBYID = "SELECT Tit_eleitor_id, Tit_eleitor_registro, "
            + "Tit_eleitor_zona, Tit_eleitor_secao, Militar_mil_id FROM tituloeleitor WHERE Tit_eleitor_id=?";
    
    Connection conn;
    PreparedStatement pstm;
    
    public TituloEleitor getTituloEleitor(int id){
        conn = null;
        pstm = null;
        ResultSet rs = null;
        TituloEleitor te = new TituloEleitor();
        
        try{
            conn = ConnectionFactory.getConnection();
            pstm = conn.prepareStatement(GETTITELEITORBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
        
            while (rs.next()) {
               te.setId(rs.getInt("Tit_eleitor_id"));
               te.setRegistro(rs.getInt("Tit_eleitor_registro"));
               te.setZona(rs.getInt("Tit_eleitor_zona"));
               te.setSecao(rs.getInt("Tit_eleitor_secao"));
               te.setId_mil(rs.getInt("Militar_mil_id"));
            }
            ConnectionFactory.fechaConexao(conn, pstm, rs);
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return te;
    }
}
