<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sea Savers</title>
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
<link rel="stylesheet" href="css/main_style.css">
<!-- Fin CSS del main -->
</head>
<body>
	<!-- Incluyendo header.jsp desde la carpeta comp -->
	<jsp:include page="comp/header.jsp" />

	<main>
		<section id="about" class="text-center">
			<div class="container">
				<h2>Sobre Nosotros</h2>
				<p>Somos una organización comprometida con la conservación y
					protección de los océanos. Nuestro objetivo es promover las buenas
					prácticas en el ambiente laboral para el cuidado de los mares,
					fomentando el reciclaje, la reducción de plásticos y la
					sostenibilidad en general.</p>
				<img src="img/about_image.jpg" alt="Sobre nosotros">
			</div>
		</section>

		<section id="recycling" class="text-center">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6 mb-4 mb-md-0">
						<h2>Reciclaje</h2>
						<p>Somos defensores del reciclaje y la reducción de plásticos
							en los océanos. Trabajamos para concientizar sobre la importancia
							de reciclar y reutilizar los materiales para proteger nuestro
							medio ambiente.</p>
					</div>
					<div class="col-md-6">
						<img src="img/recycling_image.jpg" alt="Reciclaje"
							class="img-fluid">
					</div>
				</div>
			</div>
		</section>

		<section id="sustainability" class="text-center">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6 order-md-1">
						<img src="img/sustainability_image.jpg" alt="Sostenibilidad"
							class="img-fluid">
					</div>
					<div class="col-md-6 order-md-2">
						<h2>Sostenibilidad</h2>
						<p>Nos esforzamos por promover prácticas sostenibles que
							minimicen nuestro impacto en el medio ambiente. Fomentamos la
							conservación de los recursos naturales y la adopción de hábitos
							responsables para garantizar un futuro sostenible para las
							generaciones venideras.</p>
					</div>
				</div>
			</div>
		</section>

		<section id="participate" class="text-center">
			<div class="container">
				<h2>¡Participa!</h2>
				<p>¡Únete a nuestra comunidad y participa en nuestras
					iniciativas para proteger los océanos! Juntos podemos marcar la
					diferencia.</p>
			</div>
			<div class="container">
				<img src="img/participate_image.jpg" alt="Participa"
					class="img-fluid">
			</div>
		</section>
	</main>
	
	<p>
    <a href="http://jigsaw.w3.org/css-validator/check/referer">
        <img style="border:0;width:88px;height:31px"
            src="http://jigsaw.w3.org/css-validator/images/vcss"
            alt="¡CSS Válido!" />
    </a>
</p>

	<!-- Incluyendo footer.jsp desde la carpeta comp -->
	<jsp:include page="comp/footer.jsp" />

</body>
</html>
