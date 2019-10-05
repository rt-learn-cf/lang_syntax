<cfoutput>

<!DOCTYPE html>
<html>

<cfquery name="product" datasource="compass">
    SELECT *
      FROM owi_productplans product
     WHERE product.product_type in (20)
</cfquery>

<cfset isSubmit = isDefined('form.submit')>

<cfquery name="matrix" datasource="compass">
    SELECT
        fkproductplanid_current
      , current_plan.product_name current_plan
      , new_plan.product_name new_plan
      , fkproductplanid_new
      , migration_time
      , fkfeatures_name_active
      , fkfeatures_nPhoame_inactive
      FROM owi_productplans_matrix matrix
     INNER JOIN owi_productplans current_plan on matrix.fkproductplanid_current = current_plan.owi_productplanid
     INNER JOIN owi_productplans new_plan on matrix.fkproductplanid_new = new_plan.owi_productplanid
     LEFT JOIN owi_productplans product on product.owi_productplanid = matrix.fkproductplanid_current
     WHERE matrix.fkproductplanid_current in (0, 1234, 7010, 7025, 9310, 9311, 9330, 9345, 9350, 9360, 9206, 9375, 9460,9525,9600,9601,9602,9605,9610,9612,9615,9630,9645,9660,9661,9675,9690)
     <cfif isSubmit>
       AND matrix.fkproductplanid_current = <cfqueryparam value="#form.product#">
     </cfif>

     ORDER BY fkproductplanid_current
            , fkproductplanid_new
</cfquery>

<head>
</head>
<body style="padding:20px;">
    Products
    <span style="display:none;">
    <cftable query="product" htmlTable="true" colHeaders="true" border=1>
        <cfcol header="Row:" text="<em>#product.currentRow#</em>" align="center" />
        <cfcol header="ID:" text="#product.owi_productplanid#" />
        <cfcol header="Name:" text="#product.product_name#" />
        <cfcol header="Size:" text="#product.partition_incl#" />
        <cfcol header="Enabled on Feature:" text="#product.fkfeatures_name_enabled#" />
        <cfcol header="GF on Feature:" text="#product.fkfeatures_name_grandfathered#" />
    </cftable>
    </span>

    DEBUG
    <hr>
    <cfdump var="#serializeJSON(form)#">
    <cfdump var="#isDefined('form.submit')#">
    <hr>

    <form action="03-03-Form-Submission.cfml" method="POST" accept-charset="utf-8">
        Transitions:
        <select name="product">
            <option value="all" <cfif not isDefined('form.product')></cfif>>All</option>
            <cfloop query="product">
                <cfoutput>
                <option
                    value="#owi_productplanid#"
                    <cfif isDefined('form.product') AND form.product EQ owi_productplanid> selected </cfif>>#product_name#</option></cfoutput>
            </cfloop>
        </select>
        <input type="submit" name="submit" value="submit">
    </form>
    <cftable query="matrix" htmlTable="true" colHeaders="true" border=1>
        <cfcol header="Row:" text="<em>#matrix.currentRow#</em>" align="center" />
        <cfcol header="Current Plan:" text="#matrix.current_plan#" />
        <cfcol header="New Plan:" text="#matrix.new_plan#" />
        <cfcol header="Active on Feature:" text="#matrix.fkfeatures_name_active#" />
        <cfcol header="Inactive on Feature:" text="#matrix.fkfeatures_name_inactive#" />
    </cftable>
</body>
</html>
</cfoutput>
