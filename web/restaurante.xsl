<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/reservaeventos'>

<!-- Gonzalo Izaga Gómez de Carrero
Módulo: LMSGI
UD: 04
Tarea evaluativa 2. XSLT 60%
09/03/2023 -->

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main>
			<!-- Declaramos la variable en la que almacenaremos en nombre del restaurante a mostrar -->
			<xsl:variable name="rest">El clarete</xsl:variable>

			<!-- Añadimos el título con el enlace a la web del restaurante -->
			<h1><a href="{restaurante[nombrerestaurante=$rest]/informacion}"><xsl:value-of select="restaurante[nombrerestaurante=$rest]/nombrerestaurante" /></a> - <xsl:value-of select="restaurante/ciudad" /></h1>

			<xsl:for-each select="restaurante[nombrerestaurante=$rest]/menu">
				<article class="restaurante">
					<h3><xsl:value-of select="@tipo" /></h3>
					<xsl:for-each select="plato">
						<p><xsl:value-of select="." /></p>
					</xsl:for-each>
				</article>
			</xsl:for-each>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>