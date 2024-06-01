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
<title>Sea Savers - Editar Recursos</title>
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
<link rel="stylesheet" href="css/edit_resources_style.css">
<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header_admin.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_admin.jsp" />

	<main>
		<div class="container">
			<h2>Recursos Disponibles</h2>
			<div class="text-right mb-4">
				<a href="insert_resource.jsp" class="btn btn-primary">Insertar
					Recurso</a>
			</div>
			<%
            Recurso recurso = new Recurso();
            String recursos = recurso.consultarTodoAdmin();
            out.println(recursos);
        %>
        <div class="text-center mt-4">
            <a href="home_admin.jsp" class="btn btn-secondary">Volver al inicio</a>
        </div>
		</div>

	</main>

	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
