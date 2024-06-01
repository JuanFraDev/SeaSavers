<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sea Savers - Registro</title>
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
<link rel="stylesheet" href="css/register_style.css">
<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header_login.jsp desde la carpeta comp -->
	<jsp:include page="comp/header_login.jsp" />

	<main>
		<section id="register" class="text-center">
        <div class="container">
            <h2>Regístrate</h2>
            <form action="register_action.jsp" method="post" class="mx-auto" style="max-width: 400px;">
                <div class="form-group">
                    <label for="txt_nombre">Nombre</label>
                    <input type="text" class="form-control" id="txt_nombre" name="txt_nombre" required>
                </div>
                <div class="form-group">
                    <label for="txt_edad">Edad</label>
                    <input type="number" class="form-control" id="txt_edad" name="txt_edad" required>
                </div>
                <div class="form-group">
                    <label for="cmb_genero">Género</label>
                    <select class="form-control" id="cmb_genero" name="cmb_genero" required>
                        <option value="1">Masculino</option>
                        <option value="2">Femenino</option>
                        <option value="3">Otro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txt_email">Correo Electrónico</label>
                    <input type="email" class="form-control" id="txt_email" name="txt_email" required>
                </div>
                <div class="form-group">
                    <label for="txt_pass1">Contraseña</label>
                    <input type="password" class="form-control" id="txt_pass1" name="txt_pass1" required>
                </div>
                <div class="form-group">
                    <label for="txt_pass2">Confirmar Contraseña</label>
                    <input type="password" class="form-control" id="txt_pass2" name="txt_pass2" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Registrarse</button>
                    <button type="button" class="btn btn-secondary btn-block mt-2" onclick="window.location.href='index.jsp'">Cancelar</button>
                </div>
            </form>
            <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a>.</p>
        </div>
    </section>
	</main>

	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />
</body>
</html>