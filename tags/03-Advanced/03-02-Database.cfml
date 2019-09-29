<cfquery datasource="compass" name="matrix">
  SELECT *
    FROM owi_productplans_matrix;
</cfquery>

<p>All product transitions</p>
<cfoutput query="matrix">
    #fkproductplanid_current#<br/>
</cfoutput>
