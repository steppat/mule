<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"
                version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <!-- identity transform -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- special handling for soap:Header -->
  <xsl:template match="S:Envelope">
    <xsl:copy>

      <!-- insert the following inside the soap:Header tag -->
      <S:Header xmlns:sec="http://caelum.com.br/estoquews/v2">
        <sec:token>TOKEN123</sec:token>
      </S:Header>
      <xsl:apply-templates select="@*|node()"/>

    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>