package com.productos.negocio;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.productos.datos.Conexion;

public class Recurso {
	int id_rec;
	String titulo_rec;
	String enlace_rec;
	String descripcion_rec;
	
	public int getId_rec() {
		return id_rec;
	}
	public void setId_rec(int id_rec) {
		this.id_rec = id_rec;
	}
	public String getTitulo_rec() {
		return titulo_rec;
	}
	public void setTitulo_rec(String titulo_rec) {
		this.titulo_rec = titulo_rec;
	}
	public String getEnlace_rec() {
		return enlace_rec;
	}
	public void setEnlace_rec(String enlace_rec) {
		this.enlace_rec = enlace_rec;
	}
	public String getDescripcion_rec() {
		return descripcion_rec;
	}
	public void setDescripcion_rec(String descripcion_rec) {
		this.descripcion_rec = descripcion_rec;
	}
	
	public String consultarTodo() {
	    String sql = "SELECT id_rec, titulo_rec, enlace_rec, descripcion_rec FROM tb_recursos ORDER BY id_rec";
	    Conexion con = new Conexion();
	    StringBuilder tabla = new StringBuilder();

	    try (ResultSet rs = con.Consulta(sql)) {
	        while (rs.next()) {
	            tabla.append("<div class='col-md-6 mb-4'>") // Ajusta el número de columnas según sea necesario
	                    .append("<div class='card h-100'>")
	                    .append("<div class='card-body'>")
	                    .append("<h5 class='card-title'>").append(rs.getString("titulo_rec")).append("</h5>")
	                    .append("<p class='card-text'>").append(rs.getString("descripcion_rec")).append("</p>")
	                    .append("<iframe src='").append(rs.getString("enlace_rec")).append("' frameborder='0' class='card-iframe'></iframe>")
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

	public String consultarTodoAdmin() {
		String sql = "SELECT id_rec, titulo_rec, enlace_rec, descripcion_rec FROM tb_recursos ORDER BY id_rec";
	    Conexion con = new Conexion();
	    String tabla = "<div class='row'>";
	    ResultSet rs = null;
	    rs = con.Consulta(sql);
	    try {
	        while (rs.next()) {
	            int id = rs.getInt("id_rec");
	            String titulo = rs.getString("titulo_rec");
	            String enlace = rs.getString("enlace_rec");
	            String descripcion = rs.getString("descripcion_rec");

	            tabla += "<div class='col-md-6 mb-4'>"
	                    + "<div class='card h-100'>"
	                    + "<div class='card-body'>"
	                    + "<h5 class='card-title'>" + titulo + "</h5>"
	                    + "<p class='card-text'>" + descripcion + "</p>"
	                    + "<iframe src='" + enlace + "' frameborder='0' allowfullscreen class='w-100' height='200'></iframe>"
	                    + "<form action='delete_resource.jsp' method='post' style='margin-top: 10px;' onsubmit='return confirm(\"¿Estás seguro de que deseas eliminar este recurso?\");'>"
	                    + "<input type='hidden' name='id_rec' value='" + id + "'>"
	                    + "<button type='submit' class='btn btn-danger'>Eliminar</button>"
	                    + "</form>"
	                    + "</div>"
	                    + "</div>"
	                    + "</div>";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	    }
	    tabla += "</div>";
	    return tabla;
	}

	
	

}
