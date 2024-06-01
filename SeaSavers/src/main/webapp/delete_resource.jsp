<%@ page import="java.sql.*"%>
<%@ page import="com.productos.datos.Conexion"%>
<%
int id_rec = Integer.parseInt(request.getParameter("id_rec"));
Conexion con = new Conexion();
String sql = "DELETE FROM tb_recursos WHERE id_rec = " + id_rec;
String resultado = con.Ejecutar(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sea Savers - Eliminar Recurso</title>
<!-- Inicio CSS del header -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/header_style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap">
<!-- Fin CSS del header -->
<!-- Inicio CSS del footer -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/footer_style.css">
<!-- Fin CSS del footer -->
<!-- Inicio CSS del main -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Fin CSS del main -->
</head>
<body>

	<!-- Incluyendo header_login.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_login.jsp" />
	
	<h2>Resultado de la Eliminación</h2>
	<p><%=resultado%></p>
	<a href="edit_resources.jsp">Volver a Editar Recursos</a>
	
	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />
</body>
</html>

