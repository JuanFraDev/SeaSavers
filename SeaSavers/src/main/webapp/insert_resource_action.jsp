<%@ page import="java.sql.*" %>
<%@ page import="com.productos.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String titulo = request.getParameter("titulo");
    String enlace = request.getParameter("enlace");
    String descripcion = request.getParameter("descripcion");

    Conexion con = new Conexion();
    String sqlGetId = "SELECT MAX(id_rec) AS max_id FROM tb_recursos";
    int nuevoId = 1; // Valor por defecto para el primer recurso
    try {
        ResultSet rs = con.Consulta(sqlGetId);
        if (rs.next()) {
            int maxId = rs.getInt("max_id");
            nuevoId = maxId + 1;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    String sqlInsert = "INSERT INTO tb_recursos (id_rec, titulo_rec, enlace_rec, descripcion_rec) VALUES (" + nuevoId + ", '" + titulo + "', '" + enlace + "', '" + descripcion + "')";
    String resultado = con.Ejecutar(sqlInsert);

    if (resultado.equals("Datos insertados")) {
        response.sendRedirect("edit_resources.jsp");
    } else {
        out.println("<p>Error al insertar el recurso: " + resultado + "</p>");
        out.println("<a href='insert_resource.jsp'>Volver</a>");
    }
%>
