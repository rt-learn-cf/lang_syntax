<div class="card">
  <div class="card-header" id="headingInput">
    <h2 class="mb-0">
      <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseInput" aria-expanded="false" aria-controls="collapseInput">
        Input
      </button>
    </h2>
  </div>
  <div id="collapseInput" class="collapse show" aria-labelledby="headingInput" data-parent="#accordionExample">
    <div class="card-body">
      # First line is the base id<br />
      # 2nd Line: Size in GB,Price,Data Stop Flag,VCT,300Minutes,Active,GF
      <hr />
        <cfoutput>#session.baseId#</cfoutput><br />
        <cfloop from="1" to="#session.productCount#" index="i">
          <cfoutput>#session["product#i#"]#</cfoutput><br />
        </cfloop>
    </div>
  </div>
</div>
