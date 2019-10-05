<div class="card">
  <div class="card-header" id="headingMatrix">
    <h2 class="mb-0">
      <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseMatrixNew" aria-expanded="false" aria-controls="collapseMatrixNew">
        Matrix (New Products)
      </button>
    </h2>
  </div>
  <div id="collapseMatrixNew" class="collapse show" aria-labelledby="headingMatrixNew" data-parent="#accordionExample">
    <div class="card-body">
      <pre class="prettyprint">
        <cfoutput>#productService.generateNewProductsTransitions()#</cfoutput><br />
      </pre>
    </div>
  </div>
</div>
