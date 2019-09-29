<div class="card">
  <div class="card-header" id="headingOne">
    <h2 class="mb-0">
      <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        New Product Plans
      </button>
    </h2>
  </div>

  <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
    <div class="card-body">
      <pre class="prettyprint">
        <cfoutput>#productService.generateProductPlans()#</cfoutput><br />
        <cfoutput>#productService.degenerateProductPlans()#</cfoutput><br />
      </pre>
    </div>
  </div>
</div>
