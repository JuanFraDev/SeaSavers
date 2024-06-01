package com.productos.negocio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.productos.datos.Conexion;

public class Noticia {

	private int id_not;
	private String titulo_not;
	private String contenido_not; 
	private String enlace_not;
	
	public int getId_not() {
		return id_not;
	}
	public void setId_not(int id_not) {
		this.id_not = id_not;
	}
	public String getTitulo_not() {
		return titulo_not;
	}
	public void setTitulo_not(String titulo_not) {
		this.titulo_not = titulo_not;
	}
	public String getContenido_not() {
		return contenido_not;
	}
	public void setContenido_not(String contenido_not) {
		this.contenido_not = contenido_not;
	}
	public String getEnlace_not() {
		return enlace_not;
	}
	public void setEnlace_not(String enlace_not) {
		this.enlace_not = enlace_not;
	}
	
	public String insertarNoticia(Conexion con) {
	    String mensaje = "";
	    String sqlGetMaxId = "SELECT MAX(id_not) AS max_id FROM tb_noticias";
	    String sqlInsert = "INSERT INTO tb_noticias (id_not, titulo_not, contenido_not, enlace_not) VALUES (?, ?, ?, ?)";

	    try {
	        con.getConexion().setAutoCommit(false); // Desactivar el autocommit para controlar la transacción

	        // Obtener el último valor de id_not
	        int nuevoId = 1; // Valor por defecto para la primera noticia
	        ResultSet rs = con.Consulta(sqlGetMaxId);
	        if (rs.next()) {
	            int maxId = rs.getInt("max_id");
	            nuevoId = maxId + 1;
	        }

	        // Preparar la sentencia SQL
	        PreparedStatement pstmt = con.getConexion().prepareStatement(sqlInsert);
	        pstmt.setInt(1, nuevoId);
	        pstmt.setString(2, this.titulo_not);
	        pstmt.setString(3, this.contenido_not);
	        pstmt.setString(4, this.enlace_not);

	        // Ejecutar la sentencia SQL
	        int filasAfectadas = pstmt.executeUpdate();
	        if (filasAfectadas > 0) {
	            mensaje = "Noticia agregada exitosamente";
	        } else {
	            mensaje = "Error al agregar la noticia";
	        }

	        // Confirmar la transacción
	        con.getConexion().commit();
	    } catch (SQLException e) {
	        mensaje = "Error SQL al agregar la noticia: " + e.getMessage();
	        try {
	            con.getConexion().rollback(); // Deshacer la transacción en caso de error
	        } catch (SQLException ex) {
	            mensaje += " - Error al hacer rollback: " + ex.getMessage();
	        }
	    } finally {
	        try {
	            con.getConexion().setAutoCommit(true); // Restaurar el autocommit
	        } catch (SQLException ex) {
	            mensaje += " - Error al restaurar autocommit: " + ex.getMessage();
	        }
	    }

	    return mensaje;
	}
	
	public String consultarTodo() {
	    String sql = "SELECT id_not, titulo_not, contenido_not, enlace_not FROM tb_noticias ORDER BY id_not";
	    Conexion con = new Conexion();
	    StringBuilder tabla = new StringBuilder();

	    try (ResultSet rs = con.Consulta(sql)) {
	        while (rs.next()) {
	            tabla.append("<div class='col-md-8 mb-4 mx-auto'>") // Ajusta el número de columnas según sea necesario y añade la clase 'mx-auto' para centrar
	                .append("<div class='card h-100'>")
	                .append("<div class='card-body'>")
	                .append("<h5 class='card-title text-center'>").append(rs.getString("titulo_not")).append("</h5>")
	                .append("<p class='card-text'>").append(rs.getString("contenido_not")).append("</p>")
	                .append("</div>") // Cerramos el div del cuerpo de la tarjeta
	                .append("<div class='card-footer text-center' style='margin-top: 20px;'>") // Agregamos margen superior al footer
	                .append("<a href='").append(rs.getString("enlace_not")).append("' class='btn btn-primary' target='_blank'>Ver más</a>") 
	                .append("</div>") // Cerramos el div del footer de la tarjeta
	                .append("</div>") // Cerramos el div de la tarjeta
	                .append("</div>"); // Cerramos el div de la columna
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }

	    return tabla.toString();
	}

	public String consultarTodoAdmin() {
	    String sql = "SELECT id_not, titulo_not, contenido_not, enlace_not FROM tb_noticias ORDER BY id_not";
	    Conexion con = new Conexion();
	    StringBuilder tabla = new StringBuilder();

	    try (ResultSet rs = con.Consulta(sql)) {
	        while (rs.next()) {
	            tabla.append("<div class='col-md-6 mb-4'>")
	                    .append("<div class='card h-100'>")
	                    .append("<div class='card-body'>")
	                    .append("<h5 class='card-title'>").append(rs.getString("titulo_not")).append("</h5>")
	                    .append("<p class='card-text'>").append(rs.getString("contenido_not")).append("</p>")
	                    .append("<a href='delete_news.jsp?id=").append(rs.getInt("id_not")).append("' class='btn btn-danger'>Eliminar</a>")
	                    .append("<a href='").append(rs.getString("enlace_not")).append("' class='btn btn-primary' target='_blank'>Ver más</a>") 
	                    .append("</div>")
	                    .append("</div>")
	                    .append("</div>");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }

	    return tabla.toString();
	}

	
	public String consultarComentarios(int id_noticia) {
	    String sql = "SELECT id_com, contenido_com FROM tb_comentario WHERE id_not = " + id_noticia;
	    Conexion con = new Conexion();
	    StringBuilder comentariosHtml = new StringBuilder();

	    try (ResultSet rs = con.Consulta(sql)) {
	        while (rs.next()) {
	            comentariosHtml.append("<div class='comment'>")
	                .append("<p>").append(rs.getString("contenido_com")).append("</p>")
	                .append("</div>");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	    }

	    return comentariosHtml.toString();
	}
	
}
