<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="com.productos.negocio.*"%>

<%
	int perfil = 0;
	String usuario = "";
	HttpSession sesion = request.getSession();
	 if (sesion.getAttribute("usuario") == null || (Integer)sesion.getAttribute("perfil") != 1) //Se verifica si existe la variable
	 {
		 %>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
	 }
	 else
	 {
		 usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
		 perfil=(Integer)sesion.getAttribute("perfil");
	 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sea Savers - Insertar Recursos</title>
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
<link rel="stylesheet" href="css/insert_resources_style.css">
<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header_admin.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_admin.jsp" />

	<main>
		<div class="container">
        <h2>Insertar Nuevo Recurso</h2>
        <form action="insert_resource_action.jsp" method="post">
            <div class="form-group">
                <label for="titulo">Título</label>
                <input type="text" class="form-control" id="titulo" name="titulo" required>
            </div>
            <div class="form-group">
                <label for="enlace">Enlace</label>
                <input type="text" class="form-control" id="enlace" name="enlace" required>
            </div>
            <div class="form-group">
                <label for="descripcion">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-success">Guardar</button>
            <a href="edit_resources.jsp" class="btn btn-terciary">Cancelar</a>
        </form>
    </div>

	</main>

	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />

</body>
</html>
