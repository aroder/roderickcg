<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:template match="/">

    <xsl:for-each select="rss/channel">
      <h2>
        <!--<a href="{link}">
          <xsl:value-of select="title" />
        </a>-->
        Latest Blog Posts
      </h2>
    </xsl:for-each>
    <p>
    <ul>
      <xsl:for-each select="rss/channel/item">
        <li>
          <a href="{link}">
            <strong>
              <xsl:value-of select="title" />
            </strong>
          </a>
        </li>
      </xsl:for-each>
    </ul>
    </p>
  </xsl:template>

</xsl:stylesheet>

