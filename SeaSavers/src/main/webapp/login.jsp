<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sea Savers - Login</title>
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
<link rel="stylesheet" href="css/login_style.css">
<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header_login.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_login.jsp" />

	<main>
		<section id="login" class="text-center">
			<div class="container">
				<h2>Iniciar Sesión</h2>
				<form action="login_action.jsp" method="post" class="mx-auto">
					<div class="form-group">
						<label for="txt_email">Correo Electrónico</label> <input type="email"
							class="form-control" id="txt_email" name="txt_email" required>
					</div>
					<div class="form-group">
						<label for="txt_pass">Contraseña</label> <input type="password"
							class="form-control" id="txt_pass" name="txt_pass" required>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">Acceder</button>
					</div>
					<div class="form-group">
						<a href="index.jsp" class="btn btn-secondary btn-block">Cancelar</a>
					</div>
				</form>
				<p>
					¿Todavía no tienes una cuenta? <a href="register.jsp">Regístrate aquí</a>.
				</p>
			</div>
		</section>

	</main>
	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />

</body>
</html>