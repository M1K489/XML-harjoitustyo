<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML 2013 Designer Edition (Trial) 11.0.8.4549 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:template match="/">
        <html>
            <head>
                <title>Peliarkisto</title>
                <meta http-equiv="content-type"
                      content="text/html;charset=utf-8" />
                <link rel="stylesheet"
                      type="text/css"
                      href="css/tyyli.css" />
                <script src="javascripts/prototype.js"
                        type="text/javascript" />
                <script src="javascripts/effects.js"
                        type="text/javascript" />
            </head>
            <body>
                <h1>Peliarkisto</h1>
                <h2>Pelit</h2>
                <ul>
                    <xsl:for-each select="//Peli">
                        <xsl:sort select="Nimi" />
                        <li>
                            <h3>
                                <a href="#a"
                                   onclick="Effect.toggle('{Nimi}','appear')">
                                    <xsl:value-of select="Nimi" />
                                </a>
                            </h3>
                            <ul style="display: none"
                                id="{Nimi}">
                                
                                    <table border="1">
                                        <tr>
                                            <th>Pelisarja</th>
                                            <th>Genre</th>
                                            <th>Julkaisupäivä</th>
                                            <th>Alusta</th>
                                            <th>Omistettu media</th>
                                            <th>Arvosana</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <xsl:value-of select="Pelisarja" />
                                            </td>
                                            <td>
                                                <ul>
                                                    <xsl:for-each select="Genret/Genre">
                                                        <li>
                                                            <xsl:value-of select="." />
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </td>
                                            <td>
                                                <xsl:value-of select="Julkaisupäivä" />
                                            </td>
                                            <td>
                                                <ul>
                                                    <xsl:for-each select="Alustat/Alusta">
                                                        <li>
                                                            <xsl:value-of select="." />
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </td>
                                            <td>
                                                <ul>
                                                    <xsl:for-each select="Mediat/Media">
                                                        <li>
                                                            <xsl:value-of select="." />
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </td>
                                            <td>
                                                <xsl:value-of select="Arvostelu/Arvosana" />/5
                                            </td>
                                        </tr>
                                    </table>
                                <li>
                                    <p>
                                        <a href="#a"
                                           onclick="Effect.toggle('{Nimi}tietoja','appear')">Lisätietoja:</a>
                                    </p>
                                    <table border="1"
                                           style="display: none"
                                           id="{Nimi}tietoja">
                                        <tr>
                                            <th colspan="2">Kehittäjät</th>
                                            <th colspan="2">Huomautus</th>
                                            <th colspan="2">Julkaisijat</th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <xsl:call-template name="kehittajat"></xsl:call-template>
                                            </td>
                                            <td colspan="2">
                                                <ol>
                                                    <xsl:for-each select="Kehittäjät/Kehittäjä">
                                                        <li>
                                                            <xsl:value-of select="@Huomautus" />
                                                        </li>
                                                    </xsl:for-each>
                                                </ol>
                                            </td>
                                            <td colspan="2">
                                                <ul>
                                                    <xsl:for-each select="Julkaisijat/Julkaisija">
                                                        <li>
                                                            <xsl:value-of select="Nimi" /> (<xsl:for-each select="Alustat/Alusta">
                                                                <xsl:value-of select="." />,
                                                            </xsl:for-each>)
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Arvio:</th>
                                            <td colspan="5">
                                                <xsl:value-of select="Arvostelu/Arvio" />
                                            </td>
                                        </tr>
                                    </table>
                                </li>
                            </ul>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="kehittajat">
        <ol>
            <xsl:for-each select="Kehittäjät/Kehittäjä">
                <li>
                    <xsl:value-of select="." />
                </li>
            </xsl:for-each>
        </ol>
    </xsl:template>
</xsl:stylesheet>
