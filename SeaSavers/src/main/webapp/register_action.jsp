<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sea Savers - Respuesta</title>
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

	<main>
		
		<section>
			<h2>Resultados del registro</h2>
		</section>
		<%
		            String nombre = request.getParameter("txt_nombre");
		            String edad = request.getParameter("txt_edad");
		            String genero = request.getParameter("cmb_genero");
		            String correo = request.getParameter("txt_email");
		            String contrasena = request.getParameter("txt_pass1");
		            String contrasena2 = request.getParameter("txt_pass2");    
		            
		            Usuario user = new Usuario();
		            String id = user.getUsuarios();
		            user.setId(Integer.parseInt(id) + 1);
		            user.setCorreo(correo);
		            user.setGenero(Integer.parseInt(genero));
		            user.setNombre(nombre);
		            user.setEdad(Integer.parseInt(edad));
		            if (contrasena.equals(contrasena2)) {
		                user.setClave(contrasena);
		                String resultado = user.ingresarCliente();
		                out.print(resultado);
		            } else {
		                out.print("<p>Las contraseñas no coinciden</p>");
		                out.print("<p>Inténtelo nuevamente</p>");
		            }
		%>
		<button class="btn btn-primary" onclick="window.location.href='login.jsp'" style="font-size: 1.1rem; padding: 10px 20px; margin-top: 500px; display: flex; align-items: center">Continuar</button>
		
	</main>

	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />
</body>
</html>