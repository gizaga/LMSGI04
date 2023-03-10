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
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
				<!-- Seleccionamos los teatros  -->
				<xsl:for-each select="teatro[fechahora/@dia[starts-with(., '2023-01')]]">
					
					<!-- Las ordenamos por fecha -->
					<xsl:sort select="fechahora/@dia" order="descending" />

					<!-- Seleccionamos las fechas y los títulos de las obras -->
					<ul>
						<li>
							<!-- Subrayamos las con precio menor de 20€ -->
							<xsl:choose>
								<xsl:when test="precio &lt; 20">
									<span class="subrayado"><xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" /></span>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="fechahora/@dia" />: <xsl:value-of select="obra" />
								</xsl:otherwise>
							</xsl:choose>
						</li>
					</ul>

				</xsl:for-each>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>