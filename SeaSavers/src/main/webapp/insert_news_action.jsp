<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Noticia, com.productos.datos.Conexion" %>
<%@ page import="java.sql.SQLException" %>

<%
    // Obtener los parámetros del formulario
    String titulo = request.getParameter("titulo");
    String contenido = request.getParameter("contenido");
    String enlace = request.getParameter("enlace");

    // Crear un objeto de tipo Noticia
    Noticia noticia = new Noticia();
    noticia.setTitulo_not(titulo);
    noticia.setContenido_not(contenido);
    noticia.setEnlace_not(enlace);

    // Insertar la nueva noticia en la base de datos
    Conexion con = new Conexion();
    String mensaje = noticia.insertarNoticia(con);

    // Cerrar la conexión
    con.close();

    // Redireccionar a edit_news.jsp
    response.sendRedirect("edit_news.jsp?mensaje=" + mensaje);
%>
