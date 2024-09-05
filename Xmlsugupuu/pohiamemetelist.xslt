<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">

	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		<html>
			<head>
				<style>
					body {
					background-color: #121212;
					color: #e0e0e0;
					font-family: "Old English Text MT", "Garamond", serif;
					text-align: center;
					}
					h1, h2, h3 {
					color: #ff6666;
					text-transform: uppercase;
					font-weight: bold;
					}
					ul {
					list-style-type: none;
					padding: 0;
					}
					ul li {
					margin: 10px 0;
					}
					table {
					width: 80%;
					margin: 20px auto;
					border-collapse: collapse;
					background-color: #1c1c1c;
					color: #e0e0e0;
					font-size: 1.1em;
					}
					th, td {
					padding: 12px;
					border: 2px solid #ff6666;
					}
					th {
					background-color: #333333;
					color: #ffcccc;
					text-transform: uppercase;
					}
					td {
					background-color: #1e1e1e;
					}
					ul li, td {
					font-style: italic;
					}
					a {
					color: #ff6666;
					text-decoration: none;
					}
					a:hover {
					text-decoration: underline;
					}
					br {
					margin-bottom: 15px;
					}
				</style>
			</head>
			<body>
				<h1>Gothic Family Tree</h1>
				<p>Kuvame 1. inimese nimi:</p>
				<h2>
					<xsl:value-of select="sugupu/inimine[1]/nimi"/>
				</h2>

				<h3>Koik nimed:</h3>
				<ul>
					<xsl:for-each select="sugupu/inimine">
						<li>
							<xsl:value-of select="nimi"/>
							(<xsl:value-of select="synniaasta"/>),
							<xsl:value-of select="synnikoht"/>
							<ul>
								<li>
									<em>Lapsed:</em>
								</li>
								<xsl:for-each select="lapsed/inimine">
									<li>
										<xsl:value-of select="nimi"/>,
										<xsl:value-of select="synniaasta"/>,
										<xsl:value-of select="synnikoht"/>
									</li>
								</xsl:for-each>
							</ul>
						</li>
					</xsl:for-each>
				</ul>

				<h3>Tabel:</h3>
				<table>
					<tr>
						<th>Vanavanem</th>
						<th>Vanem</th>
						<th>Laps</th>
					</tr>
					<xsl:for-each select="sugupu/inimine">
						<xsl:for-each select="lapsed/inimine">
							<xsl:for-each select="lapsed/inimine">
							<tr>
								<td>
									<xsl:value-of select="../../../../nimi"/>
								</td>
								<!-- Vanavanem -->
								<td>
									<xsl:value-of select="../../nimi"/>
								</td>
								<!-- Vanem -->
								<td>
									
										<xsl:value-of select="nimi"/>
										<br/>
									
								</td>
								<!-- Laps -->
							</tr>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
