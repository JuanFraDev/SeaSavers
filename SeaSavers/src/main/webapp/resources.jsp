<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sea Savers - Recursos</title>
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
	<!-- Incluyendo header.jsp desde la carpeta comp -->
	<jsp:include page="comp/header.jsp" />
	
	<main>
		<section id="resource-list" class="container">
		<%
                Recurso recurso = new Recurso();
                
                // Llamar al método consultarTodo() y obtener el resultado
                String resultadoConsulta = recurso.consultarTodo();
            %>
			<h2 class="text-center">Recursos Disponibles</h2>
			<div class="row justify-content-center">
				<%= recurso.consultarTodo() %>
			</div>
		</section>


	</main>
	
	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />
</body>
</html>