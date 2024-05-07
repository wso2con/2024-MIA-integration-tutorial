<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
    <html>
        <head>
            <title>
                <xsl:value-of select="//*[local-name() = 'first_name']"/> <xsl:value-of select="//*[local-name() = 'last_name']"/> - Result Sheet for Semester <xsl:value-of select="(//*[local-name() = 'semester'])[position()=1]/text()"/></title>
        </head>
        <body bgcolor="#ffffff">
            <p>Hi <xsl:value-of select="//*[local-name() = 'first_name']"/>,</p>
            <p>Please find below your results for semester <xsl:value-of select="(//*[local-name() = 'semester'])[position()=1]/text()"/></p>
            <table border = "1">
                <tr bgcolor = "#9acd32">
                    <th>Subject Name</th>
                    <th>Grade</th>
                    <th>Marks</th>
                </tr>
                <xsl:for-each select="//*[local-name() = 'subject_result']">
                    <tr>
                    <td><xsl:value-of select = "current()//*[local-name() = 'subject']"/></td>
                    <td><xsl:value-of select = "current()//*[local-name() = 'grade']"/></td>
                    <td><xsl:value-of select = "current()//*[local-name() = 'marks']"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <p>If you have any queries pertaining to the above results, please contact the examination department</p>
            <p>Thank you</p>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>