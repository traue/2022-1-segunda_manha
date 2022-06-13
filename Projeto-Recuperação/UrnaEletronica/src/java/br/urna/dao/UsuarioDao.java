package br.urna.dao;

import br.urna.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDao {

    private static Connection conn = null;
    private static Statement stm = null;

    public Usuario processaLogin(String usuario, String senha) throws SQLException {
        conn = ConnectionFactory.getConnection();

        String query = "SELECT USUARIO.IDUSUARIO, USUARIO.USUARIO "
                + "FROM USUARIO "
                + "WHERE usuario = ? "
                + "  AND senha = ?";

        PreparedStatement stm = conn.prepareStatement(query, 
                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                ResultSet.CONCUR_READ_ONLY);
        stm.setString(1, usuario);
        stm.setString(2, senha);

      
        ResultSet resultado = stm.executeQuery();

        int numLinhas = 0;
        if (resultado.last()) {
            numLinhas = resultado.getRow();
            if (numLinhas == 1) {
                Usuario u = new Usuario();
                u.setIdUsuario(resultado.getInt("IDUSUARIO"));
                u.setUsuario(resultado.getString("USUARIO"));
                stm.getConnection().close();
                return u;
            }
        }
        stm.getConnection().close();
        return null;
    }

}
