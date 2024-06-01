<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener el ID de la noticia a eliminar desde la URL
    int id_noticia = Integer.parseInt(request.getParameter("id"));

    // Construir la consulta SQL para eliminar la noticia
    String sqlDelete = "DELETE FROM tb_noticias WHERE id_not = " + id_noticia;

    // Crear una instancia de la clase Conexion
    Conexion con = new Conexion();

    // Ejecutar la consulta de eliminación
    String resultado = con.Ejecutar(sqlDelete);

    // Verificar el resultado de la eliminación
    if (resultado.equals("Datos insertados")) {
        // Si la eliminación fue exitosa, redirigir a la página de noticias
        response.sendRedirect("edit_news.jsp");
    } else {
        // Si hubo un error, mostrar un mensaje de error
        out.println("<p>Error al eliminar la noticia: " + resultado + "</p>");
        out.println("<a href='edit_news.jsp'>Volver</a>");
    }
%>
