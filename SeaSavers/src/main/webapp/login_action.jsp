<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sea Savers - Verificar Usuario</title>
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

<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header_login.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_login.jsp" />

	<main>
		<%
		Usuario usuario = new Usuario();
		String nlogin = request.getParameter("txt_email");
		String nclave = request.getParameter("txt_pass");
		HttpSession sesion = request.getSession(); //Se crea la variable de sesión
		boolean respuesta = usuario.verificarUsuario(nlogin, nclave);
		if (respuesta) {
			sesion.setAttribute("usuario", usuario.getNombre()); //Se añade atributos
			sesion.setAttribute("perfil", usuario.getPerfil()); //Se añade atributos
			if(usuario.getPerfil()==2)
				response.sendRedirect("home_user.jsp"); //Se redirecciona a una página específica
			if(usuario.getPerfil()==1)
				response.sendRedirect("home_admin.jsp"); 
		} else {
			%>
			<jsp:forward page="login.jsp">
				<jsp:param name="error"
					value="Datos incorrectos.<br>Vuelva a intentarlo." />
			</jsp:forward>
			<%
		}
		%>
	</main>
	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />

</body>
</html>